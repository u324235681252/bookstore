from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import timedelta


class Category(models.Model):
    name = models.CharField(max_length=200, verbose_name="Название")
    slug = models.SlugField(max_length=200, unique=True, verbose_name="URL")

    class Meta:
        verbose_name = "Категория"
        verbose_name_plural = "Категории"
        ordering = ['name']

    def __str__(self):
        return self.name


class Author(models.Model):
    name = models.CharField(max_length=200, verbose_name="Имя")
    biography = models.TextField(blank=True, verbose_name="Биография")

    class Meta:
        verbose_name = "Автор"
        verbose_name_plural = "Авторы"
        ordering = ['name']

    def __str__(self):
        return self.name


class Book(models.Model):
    STATUS_CHOICES = [
        ('available', 'Доступна'),
        ('rented', 'Арендована'),
        ('unavailable', 'Недоступна'),
    ]

    title = models.CharField(max_length=300, verbose_name="Название")
    author = models.ForeignKey(Author, on_delete=models.CASCADE, related_name='books', verbose_name="Автор")
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True, related_name='books', verbose_name="Категория")
    description = models.TextField(verbose_name="Описание")
    year = models.IntegerField(verbose_name="Год издания")
    isbn = models.CharField(max_length=13, unique=True, verbose_name="ISBN")
    pages = models.IntegerField(verbose_name="Количество страниц")
    language = models.CharField(max_length=50, default="Русский", verbose_name="Язык")
    publisher = models.CharField(max_length=200, verbose_name="Издательство")

    image_url = models.URLField(max_length=500, blank=True, null=True, verbose_name="URL изображения")
    image_file = models.ImageField(upload_to='books/', blank=True, null=True, verbose_name="Файл изображения")

    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена покупки")
    rental_price_2weeks = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена аренды (2 недели)")
    rental_price_1month = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена аренды (1 месяц)")
    rental_price_3months = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена аренды (3 месяца)")

    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='available', verbose_name="Статус")
    stock = models.IntegerField(default=1, verbose_name="Количество на складе")

    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Дата обновления")

    class Meta:
        verbose_name = "Книга"
        verbose_name_plural = "Книги"
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.title} - {self.author.name}"

    def get_image(self):
        if self.image_file:
            return self.image_file.url
        elif self.image_url:
            return self.image_url
        return '/static/images/no-image.jpg'


class Purchase(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='purchases', verbose_name="Пользователь")
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='purchases', verbose_name="Книга")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    purchased_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата покупки")

    class Meta:
        verbose_name = "Покупка"
        verbose_name_plural = "Покупки"
        ordering = ['-purchased_at']

    def __str__(self):
        return f"{self.user.username} купил {self.book.title}"


class Rental(models.Model):
    PERIOD_CHOICES = [
        (14, '2 недели'),
        (30, '1 месяц'),
        (90, '3 месяца'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='rentals', verbose_name="Пользователь")
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='rentals', verbose_name="Книга")
    rental_period = models.IntegerField(choices=PERIOD_CHOICES, verbose_name="Период аренды (дней)")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")

    rented_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата аренды")
    expires_at = models.DateTimeField(verbose_name="Дата окончания")
    returned = models.BooleanField(default=False, verbose_name="Возвращена")
    reminder_sent = models.BooleanField(default=False, verbose_name="Напоминание отправлено")

    class Meta:
        verbose_name = "Аренда"
        verbose_name_plural = "Аренды"
        ordering = ['-rented_at']

    def __str__(self):
        return f"{self.user.username} арендовал {self.book.title}"

    def save(self, *args, **kwargs):
        if not self.expires_at:
            self.expires_at = timezone.now() + timedelta(days=self.rental_period)
        super().save(*args, **kwargs)

    def is_expired(self):
        return timezone.now() > self.expires_at and not self.returned

    def days_until_expiry(self):
        if self.returned:
            return 0
        delta = self.expires_at - timezone.now()
        return max(0, delta.days)


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile', verbose_name="Пользователь")
    phone = models.CharField(max_length=20, blank=True, verbose_name="Телефон")
    address = models.TextField(blank=True, verbose_name="Адрес")
    email_notifications = models.BooleanField(default=True, verbose_name="Email уведомления")

    class Meta:
        verbose_name = "Профиль пользователя"
        verbose_name_plural = "Профили пользователей"

    def __str__(self):
        return f"Профиль {self.user.username}"