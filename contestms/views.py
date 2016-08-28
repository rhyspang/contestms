from django.http import HttpResponse
from django.shortcuts import render


# Create your views here.

def contests_list(request):
    return HttpResponse('contest list')
