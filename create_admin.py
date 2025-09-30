import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'bookstore.settings')
django.setup()

from django.contrib.auth.models import User
from shop.models import UserProfile

def create_admin():
    if User.objects.filter(username='admin').exists():
        print('Администратор "admin" уже существует!')
        user = User.objects.get(username='admin')
        user.set_password('admin123')
        user.save()
        print('Пароль администратора обновлён: admin123')
    else:
        user = User.objects.create_superuser(
            username='admin',
            email='admin@bookstore.ru',
            password='admin123',
            first_name='Администратор',
            last_name='Системы'
        )
        UserProfile.objects.create(
            user=user,
            phone='+7 (999) 123-45-67',
            address='г. Москва, ул. Ленина, д. 1'
        )
        print('✓ Администратор создан успешно!')
        print('  Логин: admin')
        print('  Пароль: admin123')

    if not User.objects.filter(username='user1').exists():
        user1 = User.objects.create_user(
            username='user1',
            email='ivan@example.com',
            password='password123',
            first_name='Иван',
            last_name='Петров'
        )
        UserProfile.objects.create(
            user=user1,
            phone='+7 (999) 234-56-78',
            address='г. Санкт-Петербург, Невский пр., д. 10'
        )
        print('✓ Пользователь user1 создан!')
        print('  Логин: user1')
        print('  Пароль: password123')

    if not User.objects.filter(username='user2').exists():
        user2 = User.objects.create_user(
            username='user2',
            email='maria@example.com',
            password='password123',
            first_name='Мария',
            last_name='Иванова'
        )
        UserProfile.objects.create(
            user=user2,
            phone='+7 (999) 345-67-89',
            address='г. Екатеринбург, ул. Малышева, д. 5'
        )
        print('✓ Пользователь user2 создан!')
        print('  Логин: user2')
        print('  Пароль: password123')

if __name__ == '__main__':
    create_admin()
    print('\n✓ Все тестовые пользователи готовы к использованию!')