# encoding: utf-8
import sys
from datetime import datetime
import time
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from contestms.models import *

reload(sys)
sys.setdefaultencoding('utf-8')

alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'


def contests_list(request):
    temp_var = get_contests_info(request)
    return render(request, 'contestms/index.html', temp_var)


def get_contests_info(request):
    temp_var = {}
    apply_num = []
    applied = []
    accepted = []
    span = []

    now_time = datetime.now()
    now_second = time.mktime(now_time.timetuple())

    temp_var['now_second'] = now_second

    contest_list = Contest.objects.order_by('start_time')
    for contest in contest_list:
        apply_num.append(Application.objects.filter(contest=contest).count())
        applied.append(
            True if request.user.is_authenticated() and
                    Application.objects.filter(user=request.user, contest=contest).count() != 0 else False

        )

        accepted.append(
            True if request.user.is_authenticated() and
                    Application.objects.filter(user=request.user, contest=contest,
                                               accepted=True).count() != 0 else False
        )

        span.append(time.mktime(contest.start_time.timetuple()) - now_second)

    if request.GET.get('u_id') is not None:

        user = User.objects.filter(pk=request.GET.get('u_id'))[0]
        contest = Contest.objects.filter(pk=request.GET.get('c_id'))[0]
        apls = Application.objects.filter(user=user, contest=contest)

        if apls.count() == 0:
            Application.objects.create(user=user, contest=contest)

    temp_var['contest_list'] = dict(zip(contest_list, zip(apply_num, applied, accepted, span)))
    return temp_var


def getSeconds(t):
    return time.mktime(t.timetuple())


@login_required
def contest_detail_list(request, pk):
    temp_var = {}
    questions = Question.objects.filter(contests=pk)

    questions_info = dict(zip(questions, alpha))
    temp_var['questions_info'] = questions_info
    temp_var['c_id'] = pk

    contest = get_object_or_404(Contest, pk=pk)
    used_time = 100 * (getSeconds(datetime.now()) - getSeconds(contest.start_time)) / contest.duration.seconds
    temp_var['used_time'] = used_time

    return render(request, 'contestms/contest_detail.html', temp_var)


@login_required
def contest_detail_rank(request, pk):
    temp_var = {'c_id': pk}

    info_items = GradeInfo.objects.filter(contest=pk)
    contestant_list = []
    names = []
    fb = []
    c = None
    for item in info_items:
        if item.user.username not in names:
            if c is not None:
                c.complete_info()
                contestant_list.append(c)
            names.append(item.user.username)
            c = Contestant(item.user.username)

        q = QuestionToCtt()
        q.accepted = item.accept
        q.wrong_times = item.wrong_times
        q.sub_times = item.sub_times
        q.ac_time = item.accept_sub_time
        q.complete_info()
        c.questions.append(q)
    c.complete_info()
    contestant_list.append(c)

    list_info = sorted(contestant_list, cmp=cmp)
    temp_var['list_info'] = list_info

    q_len = len(list_info[0].questions)
    q_alpha = []
    for i in range(q_len):
        q_alpha.append(alpha[i])
    temp_var['q_alpha'] = q_alpha

    contest = get_object_or_404(Contest, pk=pk)
    used_time = 100 * (getSeconds(datetime.now()) - getSeconds(contest.start_time)) / contest.duration.seconds
    temp_var['used_time'] = used_time

    return render(request, 'contestms/contest_detail_rank.html', temp_var)


def cmp(x, y):
    if x.ac_num == y.ac_num:
        return x.penalty - y.penalty
    return y.ac_num - x.ac_num


class QuestionToCtt(object):
    def __init__(self):
        self.accepted = False
        self.wrong_times = 0
        self.sub_times = 0
        self.ac_time = None
        self.penalty = 0
        self.is_fb = False

    def complete_info(self):
        if self.accepted:
            self.penalty = self.ac_time.hour * 60 + self.ac_time.minute + self.wrong_times * 20


class Contestant(object):
    def __init__(self, name):
        self.ac_num = 0
        self.penalty = 0
        self.name = name

        self.questions = []

    def complete_info(self):
        for question in self.questions:
            if question.accepted:
                self.ac_num += 1
                self.penalty += question.penalty


@login_required
def contest_detail_info(request, pk):
    temp_var = {'c_id': pk}
    GradeInfo.objects.order_by()

    return render(request, 'contestms/contest_detail_info.html', temp_var)


@login_required
def question_detail(request, question_id):
    q = get_object_or_404(Question, pk=question_id)
    temp_var = {'question': q}

    examples = Example.objects.filter(question=question_id)
    temp_var['examples'] = examples
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
    temp_var['questions_info'] = zip(questions, alpha)

    temp_var['c_id'] = contest_id

    if request.method == 'POST':
        u_id = request.POST.get('u_id')
        q_id = request.POST.get('q_id')
        accepted = request.POST.get('accepted')

        bool_accepted = False if accepted == 'False' else True

        user = get_object_or_404(User, pk=u_id)
        question = get_object_or_404(Question, pk=q_id)
        contest = get_object_or_404(Contest, pk=contest_id)

        now_t = datetime.now()

        sub_t = datetime(1, 1, 1, 0, 0, 0) + (now_t - contest.start_time)

        s = SubmitInfo.objects.create(user=user, question=question,
                                      contest=contest, accepted=bool_accepted,
                                      sub_time=sub_t)
        temp_var['message'] = user.username + u'在' + \
                              str(s.sub_time) + u' 提交 ' + \
                              temp_var['questions_info'][1][1] + question.title + ': ' + \
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


def manager_contest_rank(request, pk):
    if request.user.is_staff is False:
        return HttpResponseRedirect(reverse('contestms:contests_list'))
    temp_var = {'c_id': pk}
    info_items = GradeInfo.objects.filter(contest=pk)
    contestant_list = []
    names = []
    fb = []
    c = None
    for item in info_items:
        if item.user.username not in names:
            if c is not None:
                c.complete_info()
                contestant_list.append(c)
            names.append(item.user.username)
            c = Contestant(item.user.username)

        q = QuestionToCtt()
        q.accepted = item.accept
        q.wrong_times = item.wrong_times
        q.sub_times = item.sub_times
        q.ac_time = item.accept_sub_time
        q.complete_info()
        c.questions.append(q)
    c.complete_info()
    contestant_list.append(c)

    list_info = sorted(contestant_list, cmp=cmp)
    temp_var['list_info'] = list_info

    q_len = len(list_info[0].questions)
    q_alpha = []
    for i in range(q_len):
        q_alpha.append(alpha[i])
    temp_var['q_alpha'] = q_alpha
    return render(request, 'contestms/manager_contest_rank.html', temp_var)


def about(request):
    return render(request, 'contestms/about.html')
