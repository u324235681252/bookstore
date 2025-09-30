from django.contrib import admin
from django.utils.html import format_html
from .models import Category, Author, Book, Purchase, Rental, UserProfile


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug']
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ['name']


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ['name', 'book_count']
    search_fields = ['name']

    def book_count(self, obj):
        return obj.books.count()
    book_count.short_description = 'Книг'


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'category', 'year', 'status', 'stock', 'price', 'image_preview']
    list_filter = ['status', 'category', 'year', 'author']
    search_fields = ['title', 'author__name', 'isbn']
    list_editable = ['status', 'stock', 'price']
    readonly_fields = ['image_preview_large']

    fieldsets = (
        ('Основная информация', {
            'fields': ('title', 'author', 'category', 'description', 'year', 'isbn', 'pages', 'language', 'publisher')
        }),
        ('Изображение', {
            'fields': ('image_url', 'image_file', 'image_preview_large')
        }),
        ('Ценообразование', {
            'fields': ('price', 'rental_price_2weeks', 'rental_price_1month', 'rental_price_3months')
        }),
        ('Доступность', {
            'fields': ('status', 'stock')
        }),
    )

    def image_preview(self, obj):
        if obj.image_file:
            return format_html('<img src="{}" width="50" height="70" style="object-fit: cover;" />', obj.image_file.url)
        elif obj.image_url:
            return format_html('<img src="{}" width="50" height="70" style="object-fit: cover;" />', obj.image_url)
        return "Нет изображения"
    image_preview.short_description = 'Обложка'

    def image_preview_large(self, obj):
        if obj.image_file:
            return format_html('<img src="{}" width="200" height="280" style="object-fit: cover;" />', obj.image_file.url)
        elif obj.image_url:
            return format_html('<img src="{}" width="200" height="280" style="object-fit: cover;" />', obj.image_url)
        return "Нет изображения"
    image_preview_large.short_description = 'Предпросмотр обложки'


@admin.register(Purchase)
class PurchaseAdmin(admin.ModelAdmin):
    list_display = ['user', 'book', 'price', 'purchased_at']
    list_filter = ['purchased_at']
    search_fields = ['user__username', 'book__title']
    readonly_fields = ['purchased_at']


@admin.register(Rental)
class RentalAdmin(admin.ModelAdmin):
    list_display = ['user', 'book', 'rental_period', 'rented_at', 'expires_at', 'days_left', 'returned', 'reminder_sent']
    list_filter = ['returned', 'reminder_sent', 'rental_period']
    search_fields = ['user__username', 'book__title']
    list_editable = ['returned']
    readonly_fields = ['rented_at', 'expires_at']
    actions = ['send_reminders', 'mark_as_returned']

    def days_left(self, obj):
        days = obj.days_until_expiry()
        if obj.returned:
            return format_html('<span style="color: green;">Возвращена</span>')
        elif days == 0:
            return format_html('<span style="color: red;">Просрочена</span>')
        elif days <= 3:
            return format_html('<span style="color: orange;">{} дней</span>', days)
        return f"{days} дней"
    days_left.short_description = 'Осталось дней'

    def send_reminders(self, request, queryset):
        count = 0
        for rental in queryset.filter(returned=False, reminder_sent=False):
            if rental.days_until_expiry() <= 3:
                rental.reminder_sent = True
                rental.save()
                count += 1
        self.message_user(request, f'Напоминания отправлены для {count} аренд')
    send_reminders.short_description = 'Отправить напоминания'

    def mark_as_returned(self, request, queryset):
        count = queryset.update(returned=True)
        self.message_user(request, f'{count} аренд отмечены как возвращенные')
    mark_as_returned.short_description = 'Отметить как возвращенные'


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'phone', 'email_notifications']
    search_fields = ['user__username', 'phone']


admin.site.site_header = 'Администрирование книжного магазина'
admin.site.site_title = 'Книжный магазин'
admin.site.index_title = 'Добро пожаловать в панель управления'