# encoding: utf-8
from datetime import datetime

from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from contestms.models import Contest, Application, User, Question, GradeInfo, Contest_question, Contest_user, SubmitInfo

import sys

reload(sys)
sys.setdefaultencoding('utf-8')

alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'


def contests_list(request):
    temp_var = get_contests_info(request)
    return render(request, 'contestms/index.html', temp_var)


def get_contests_info(request):
    apply_num = []
    applied = []
    contest_list = Contest.objects.order_by('start_time')
    for contest in contest_list:
        apply_num.append(Application.objects.filter(contest=contest).count())
        applied.append(
            True if request.user.is_authenticated() and
                    Application.objects.filter(user=request.user, contest=contest).count() != 0 else False)

    temp_var = {}
    if request.GET.get('u_id') is not None:

        user = User.objects.filter(pk=request.GET.get('u_id'))[0]
        contest = Contest.objects.filter(pk=request.GET.get('c_id'))[0]
        apls = Application.objects.filter(user=user, contest=contest)

        if apls.count() == 0:
            Application.objects.create(user=user, contest=contest)

    temp_var['contest_list'] = dict(zip(contest_list, zip(apply_num, applied)))
    return temp_var


@login_required
def contest_detail_list(request, pk):
    temp_var = {}
    questions = Question.objects.filter(contests=pk)

    questions_info = dict(zip(questions, alpha))
    temp_var['questions_info'] = questions_info
    temp_var['c_id'] = pk
    return render(request, 'contestms/contest_detail.html', temp_var)


@login_required
def contest_detail_rank(request, pk):
    temp_var = {'c_id': pk}
    return render(request, 'contestms/contest_detail_rank.html', temp_var)


@login_required
def contest_detail_info(request, pk):
    temp_var = {'c_id': pk}
    GradeInfo.objects.order_by()

    return render(request, 'contestms/contest_detail_info.html', temp_var)


@login_required
def question_detail(request, question_id):
    q = get_object_or_404(Question, pk=question_id)
    temp_var = {'question': q}
    return render(request, 'contestms/question_detail.html', temp_var)


def contest_manager(request):
    if request.user.is_staff is False:
        return HttpResponseRedirect(reverse('contestms:contests_list'))

    temp_var = get_contests_info(request)
    return render(request, 'contestms/contest_manager.html', temp_var)


def manager_contest_detail_list(request, contest_id):
    if request.user.is_staff is False:
        return HttpResponseRedirect(reverse('contestms:contests_list'))

    if request.method == 'POST':
        handle_list = request.POST.getlist('handle_list')
        contest = get_object_or_404(Contest, pk=contest_id)
        for a_id in handle_list:
            a = get_object_or_404(Application, pk=a_id)
            a.handled = True
            a.accepted = True

            Contest_user.objects.create(contest=contest, user=a.user)
            cqs = Contest_question.objects.filter(contest=contest_id)
            for cq in cqs:
                GradeInfo.objects.create(contest=contest, user=a.user, question=cq.question)
            a.save()

    temp_var = {}
    apls = Application.objects.filter(contest=contest_id, accepted=False)
    temp_var['apls'] = apls
    temp_var['c_id'] = contest_id
    return render(request, 'contestms/manager_contest_detail.html', temp_var)


def manager_contest_update(request, contest_id):
    if request.user.is_staff is False:
        return HttpResponseRedirect(reverse('contestms:contests_list'))

    temp_var = {}
    contestants = []
    cus = Contest_user.objects.filter(contest=contest_id)
    for cu in cus:
        contestants.append(cu.user)
    temp_var['contestants'] = contestants

    questions = []
    cqs = Contest_question.objects.filter(contest=contest_id)
    for cq in cqs:
        questions.append(cq.question)
    temp_var['questions_info'] = dict(zip(questions, alpha))

    temp_var['c_id'] = contest_id
    if request.method == 'POST':
        u_id = request.POST.get('u_id')
        q_id = request.POST.get('q_id')
        accepted = request.POST.get('accepted')

        bool_accepted = False if accepted == 'False' else True

        user = get_object_or_404(User, pk=u_id)
        question = get_object_or_404(Question, pk=q_id)
        contest = get_object_or_404(Contest, pk=contest_id)

        s = SubmitInfo.objects.create(user=user, question=question,
                                      contest=contest, accepted=bool_accepted,
                                      sub_time=datetime.now())
        temp_var['message'] = user.username + u'在' + \
                              str(s.sub_time) + u' 提交 ' + \
                              temp_var['questions_info'][question] + question.title + ': ' + \
                              accepted
        temp_var['accepted'] = bool_accepted

        item = get_object_or_404(GradeInfo, contest=contest_id, user=user, question=question)
        item.sub_times += 1
        if bool_accepted and item.accept is False:
            item.accept = True
            item.accept_sub_time = s.sub_time
        if not bool_accepted:
            item.wrong_times += 1
        item.save()

    return render(request, 'contestms/manager_contest_update.html', temp_var)
