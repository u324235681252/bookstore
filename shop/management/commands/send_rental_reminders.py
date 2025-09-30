from django.core.management.base import BaseCommand
from django.utils import timezone
from shop.models import Rental
from datetime import timedelta


class Command(BaseCommand):
    help = 'Отправляет напоминания пользователям об истечении срока аренды'

    def handle(self, *args, **kwargs):
        now = timezone.now()
        reminder_threshold = now + timedelta(days=3)

        rentals = Rental.objects.filter(
            returned=False,
            reminder_sent=False,
            expires_at__lte=reminder_threshold,
            expires_at__gte=now
        ).select_related('user', 'book')

        count = 0
        for rental in rentals:
            days_left = rental.days_until_expiry()

            self.stdout.write(
                self.style.WARNING(
                    f'Напоминание для {rental.user.username}: '
                    f'Книга "{rental.book.title}" должна быть возвращена через {days_left} дней '
                    f'({rental.expires_at.strftime("%d.%m.%Y")})'
                )
            )

            rental.reminder_sent = True
            rental.save()
            count += 1

        expired_rentals = Rental.objects.filter(
            returned=False,
            expires_at__lt=now
        ).select_related('user', 'book')

        for rental in expired_rentals:
            self.stdout.write(
                self.style.ERROR(
                    f'ПРОСРОЧЕНА: Пользователь {rental.user.username} не вернул книгу '
                    f'"{rental.book.title}". Срок истёк {rental.expires_at.strftime("%d.%m.%Y")}'
                )
            )

        self.stdout.write(
            self.style.SUCCESS(
                f'\nОтправлено {count} напоминаний\n'
                f'Просроченных аренд: {expired_rentals.count()}'
            )
        )