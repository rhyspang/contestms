from django.conf.urls import url

from contestms import views

urlpatterns = [
    url(r'^$', views.contests_list, name='contests_list'),
    url(r'^contest_list_(?P<pk>[0-9]+)/$', views.contest_detail_list, name='contest_detail_list'),
    url(r'^contest_rank_(?P<pk>[0-9]+)/$', views.contest_detail_rank, name='contest_detail_rank'),
    url(r'^contest_info_(?P<pk>[0-9]+)/$', views.contest_detail_info, name='contest_detail_info'),

    url(r'^question_(?P<question_id>[0-9]+)/$', views.question_detail, name='question_detail'),
]