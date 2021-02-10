from django.http.response import HttpResponse
from django.shortcuts import render

# Create your views here.

def show_home_page(request):
    return HttpResponse("PostgreSQL-experience app is working!")