from django.urls import path
from .views import show_home_page


urlpatterns = [
    path('', show_home_page, name='Home')
]
