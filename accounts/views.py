# coding: utf-8

from django.contrib import auth
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from accounts.forms import RegisterForm, LoginForm
from django.core.urlresolvers import reverse


def login(request):
    if request.method == 'GET':
        login_form = LoginForm()
        return render(request, 'accounts/login.html', {'login_form': login_form,})
    else:
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_active:
                auth.login(request, user)

                if user.is_staff:
                    return HttpResponseRedirect(reverse('contestms:contest_manager'))
                return HttpResponseRedirect(reverse('contestms:contests_list'))
            else:
                return render(request,
                              'accounts/login.html',
                              {'login_form': login_form, 'password_is_wrong': True, 'username': username})
        else:
            return render(request, 'accounts/login.html', {'login_form': login_form, })


@login_required
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(reverse('accounts:login'))


def register(request):
    if request.method == 'GET':
        register_form = RegisterForm()
        # wrong to write template firstly
        return render(request, 'accounts/register.html', {'register_form': register_form,})
    else:
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            register_form.save()
            return HttpResponseRedirect(reverse('accounts:login'))
        else:
            return render(request,
                          'accounts/register.html',
                          {'register_form': register_form, 'register_fail': True,})

