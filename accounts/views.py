# coding: utf-8

from django.contrib.auth import authenticate
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.contrib import auth

from accounts.forms import RegisterForm, LoginForm


def login(request):
    if request.method == 'GET':
        form = LoginForm()
        return render(request, 'accounts/login.html', {'form': form, })
    else:
        form = LoginForm(request.POST)
        if form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_active:
                auth.login(request, user)
                return HttpResponseRedirect(reverse('contestms:contests_list'))
            else:
                return render(request, 'accounts/login.html', {'form': form, 'password_is_wrong': True, })
        else:
            return render(request, 'accounts/login.html', {'form': form, })


    # template_var = {}
    # if request.method == 'POST':
    #     username = request.POST.get('username')
    #     password = request.POST.get('password')
    #     if _login(request, username, password, template_var):
    #         try:
    #             tmp = request.GET['next']
    #             return HttpResponseRedirect(tmp)
    #         except:
    #             return HttpResponseRedirect(reverse('contestms:contests_list'))
    #     template_var.update({'username': username})
    # return render(request, 'accounts/login.html', template_var)


def logout(request):
    return HttpResponse('logout page')


def register(request):
    template_var = {}
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST.copy())
        if form.is_valid():
            form.save()
            if _login(request, form.cleaned_data['username'], form.cleaned_data['password'], template_var):
                return HttpResponseRedirect(reverse("contestms: contests_list"))
    template_var['form'] = form
    return render(request, "accounts/register.html", template_var)


    return HttpResponse('register page')


def _login(request, username, password, template_var):
    ret = False
    user = authenticate(username=username, password=password)
    if user is not None:
        auth_login(request, user)
        ret = True
    else:
        template_var['error'] = u'用户' + username + u'不存在或密码错误'
    return ret
