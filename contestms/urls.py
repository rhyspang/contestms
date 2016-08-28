from django.conf.urls import url

from contestms import views

urlpatterns = [
    url(r'^$', views.contests_list, name='contests_list'),

]