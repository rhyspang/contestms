from django.shortcuts import render, get_object_or_404

# Create your views here.

from contestms.models import Contest, Application, User, Question


def contests_list(request):
    apply_num = []
    applied = []
    contest_list = Contest.objects.order_by('start_time')
    for contest in contest_list:
        apply_num.append(Application.objects.filter(contest=contest).count())
        applied.append(False if Application.objects.filter(user=request.user, contest=contest).count() == 0 else True)
    temp_var = {}
    if request.GET.get('u_id') is not None:

        user = User.objects.filter(pk=request.GET.get('u_id'))[0]
        contest = Contest.objects.filter(pk=request.GET.get('c_id'))[0]
        apls = Application.objects.filter(user=user, contest=contest)

        if apls.count() == 0:
            Application.objects.create(user=user, contest=contest)

    temp_var['contest_list'] = dict(zip(contest_list, zip(apply_num, applied)))

    return render(request, 'contestms/index.html', temp_var)


def contest_detail_list(request, pk):
    temp_var = {}
    questions = Question.objects.filter(contests=pk)
    alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    questions_info = dict(zip(questions, alpha))
    temp_var['questions_info'] = questions_info
    temp_var['c_id'] = pk
    return render(request, 'contestms/contest_detail.html', temp_var)


def contest_detail_rank(request, pk):
    temp_var = {}
    temp_var['c_id'] = pk
    return render(request, 'contestms/contest_detail_rank.html', temp_var)


def contest_detail_info(request, pk):
    temp_var = {}
    temp_var['c_id'] = pk
    return render(request, 'contestms/contest_detail_info.html', temp_var)


def question_detail(request, question_id):
    q = get_object_or_404(Question, pk=question_id)
    temp_var = {'question': q}
    return render(request, 'contestms/question_detail.html', temp_var)
