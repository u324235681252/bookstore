from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('books/', views.book_list, name='book_list'),
    path('book/<int:book_id>/', views.book_detail, name='book_detail'),
    path('book/<int:book_id>/purchase/', views.purchase_book, name='purchase_book'),
    path('book/<int:book_id>/rent/', views.rent_book, name='rent_book'),
    path('my-purchases/', views.my_purchases, name='my_purchases'),
    path('my-rentals/', views.my_rentals, name='my_rentals'),
    path('profile/', views.profile, name='profile'),
    path('register/', views.register, name='register'),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
]