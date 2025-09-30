from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.db.models import Q
from .models import Book, Category, Author, Purchase, Rental, UserProfile
from .forms import BookFilterForm, RentalForm, UserRegistrationForm


def home(request):
    books = Book.objects.filter(status='available').select_related('author', 'category')[:8]
    categories = Category.objects.all()
    return render(request, 'shop/home.html', {
        'books': books,
        'categories': categories
    })


def book_list(request):
    books = Book.objects.filter(status='available').select_related('author', 'category')

    category_slug = request.GET.get('category')
    author_id = request.GET.get('author')
    year = request.GET.get('year')
    search = request.GET.get('search')
    sort = request.GET.get('sort', 'title')

    if category_slug:
        books = books.filter(category__slug=category_slug)

    if author_id:
        books = books.filter(author_id=author_id)

    if year:
        books = books.filter(year=year)

    if search:
        books = books.filter(
            Q(title__icontains=search) |
            Q(author__name__icontains=search) |
            Q(description__icontains=search)
        )

    if sort == 'title':
        books = books.order_by('title')
    elif sort == 'year':
        books = books.order_by('-year')
    elif sort == 'price':
        books = books.order_by('price')
    elif sort == 'author':
        books = books.order_by('author__name')

    categories = Category.objects.all()
    authors = Author.objects.all()
    years = Book.objects.values_list('year', flat=True).distinct().order_by('-year')

    return render(request, 'shop/book_list.html', {
        'books': books,
        'categories': categories,
        'authors': authors,
        'years': years,
        'current_category': category_slug,
        'current_author': author_id,
        'current_year': year,
        'search_query': search,
        'sort': sort
    })


def book_detail(request, book_id):
    book = get_object_or_404(Book.objects.select_related('author', 'category'), id=book_id)
    return render(request, 'shop/book_detail.html', {'book': book})


@login_required
def purchase_book(request, book_id):
    book = get_object_or_404(Book, id=book_id)

    if book.status != 'available' or book.stock < 1:
        messages.error(request, 'К сожалению, эта книга недоступна для покупки.')
        return redirect('book_detail', book_id=book.id)

    Purchase.objects.create(
        user=request.user,
        book=book,
        price=book.price
    )

    book.stock -= 1
    if book.stock == 0:
        book.status = 'unavailable'
    book.save()

    messages.success(request, f'Книга "{book.title}" успешно куплена!')
    return redirect('my_purchases')


@login_required
def rent_book(request, book_id):
    book = get_object_or_404(Book, id=book_id)

    if book.status != 'available':
        messages.error(request, 'К сожалению, эта книга недоступна для аренды.')
        return redirect('book_detail', book_id=book.id)

    if request.method == 'POST':
        form = RentalForm(request.POST, book=book)
        if form.is_valid():
            rental = form.save(commit=False)
            rental.user = request.user
            rental.book = book
            rental.save()

            messages.success(request, f'Книга "{book.title}" успешно арендована на {rental.get_rental_period_display()}!')
            return redirect('my_rentals')
    else:
        form = RentalForm(book=book)

    return render(request, 'shop/rent_book.html', {'form': form, 'book': book})


@login_required
def my_purchases(request):
    purchases = Purchase.objects.filter(user=request.user).select_related('book', 'book__author')
    return render(request, 'shop/my_purchases.html', {'purchases': purchases})


@login_required
def my_rentals(request):
    rentals = Rental.objects.filter(user=request.user).select_related('book', 'book__author')
    return render(request, 'shop/my_rentals.html', {'rentals': rentals})


@login_required
def profile(request):
    profile, created = UserProfile.objects.get_or_create(user=request.user)
    return render(request, 'shop/profile.html', {'profile': profile})


def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            UserProfile.objects.create(user=user)
            login(request, user)
            messages.success(request, 'Регистрация прошла успешно!')
            return redirect('home')
    else:
        form = UserRegistrationForm()
    return render(request, 'shop/register.html', {'form': form})


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, f'Добро пожаловать, {user.username}!')
            return redirect('home')
        else:
            messages.error(request, 'Неверное имя пользователя или пароль.')
    return render(request, 'shop/login.html')


def user_logout(request):
    logout(request)
    messages.success(request, 'Вы успешно вышли из системы.')
    return redirect('home')