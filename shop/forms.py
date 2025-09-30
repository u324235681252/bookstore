from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Rental, Book


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(required=True, label="Email")
    first_name = forms.CharField(max_length=100, required=False, label="Имя")
    last_name = forms.CharField(max_length=100, required=False, label="Фамилия")

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password1', 'password2']
        labels = {
            'username': 'Логин',
            'password1': 'Пароль',
            'password2': 'Подтверждение пароля',
        }


class BookFilterForm(forms.Form):
    category = forms.ChoiceField(choices=[], required=False, label="Категория")
    author = forms.ChoiceField(choices=[], required=False, label="Автор")
    year = forms.IntegerField(required=False, label="Год")
    search = forms.CharField(max_length=200, required=False, label="Поиск")


class RentalForm(forms.ModelForm):
    class Meta:
        model = Rental
        fields = ['rental_period']
        labels = {
            'rental_period': 'Период аренды'
        }
        widgets = {
            'rental_period': forms.RadioSelect
        }

    def __init__(self, *args, **kwargs):
        self.book = kwargs.pop('book', None)
        super().__init__(*args, **kwargs)

    def save(self, commit=True):
        rental = super().save(commit=False)
        if self.book:
            period = rental.rental_period
            if period == 14:
                rental.price = self.book.rental_price_2weeks
            elif period == 30:
                rental.price = self.book.rental_price_1month
            elif period == 90:
                rental.price = self.book.rental_price_3months

        if commit:
            rental.save()
        return rental