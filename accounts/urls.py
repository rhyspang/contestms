# coding=utf-8
from django.conf.urls import include, url
from django.contrib import admin
from accounts import views

admin.autodiscover()

urlpatterns = [
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^register/$', views.register, name='register'),
]
