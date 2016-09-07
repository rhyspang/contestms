from __future__ import unicode_literals
from django.contrib.auth.models import AbstractUser
from django.db import models


class Contest(models.Model):
    name = models.CharField(max_length=200)
    start_time = models.DateTimeField('time started')
    duration = models.DurationField()

    def __unicode__(self):
        return self.name


class User(AbstractUser):
    contests = models.ManyToManyField(Contest, through='Contest_user')
    gender = models.CharField(max_length=20)
    class_name = models.CharField(max_length=20)
    stu_id = models.CharField(max_length=20)
    tel_num = models.CharField(max_length=20)
    qq_num = models.CharField(max_length=20)
    comment = models.TextField(null=True)

    def __unicode__(self):
        return self.username


class Question(models.Model):
    contests = models.ManyToManyField(Contest, through='Contest_question')
    title = models.CharField(max_length=200)
    content = models.TextField()
    hint = models.TextField(null=True)

    def __unicode__(self):
        return self.title


class Example(models.Model):
    question = models.ForeignKey(Question)
    input = models.TextField()
    output = models.TextField()


class SubmitInfo(models.Model):
    contest = models.ForeignKey(Contest)
    user = models.ForeignKey(User)
    question = models.ForeignKey(Question)
    sub_time = models.DateTimeField()
    accepted = models.BooleanField(default=False)

    def __unicode__(self):
        return self.user.username + '-' + self.question.title


class Application(models.Model):
    user = models.ForeignKey(User)
    contest = models.ForeignKey(Contest)
    apply_time = models.DateTimeField(auto_now_add=True)
    handled = models.BooleanField(default=False)
    accepted = models.NullBooleanField(default=False, null=True)

    def __unicode__(self):
        return self.user.username + '-' + self.contest.name

    class Meta:
        unique_together = ('user', 'contest')


class GradeInfo(models.Model):
    contest = models.ForeignKey(Contest)
    user = models.ForeignKey(User)
    question = models.ForeignKey(Question)
    accept = models.BooleanField(default=False)
    accept_sub_time = models.DateTimeField(null=True)
    sub_times = models.PositiveSmallIntegerField(default=0)
    wrong_times = models.PositiveSmallIntegerField(default=0)

    def __unicode__(self):
        return self.user.username + '-' + self.question.title

    class Meta:
        unique_together = ('contest', 'user', 'question')


class Contest_user(models.Model):
    contest = models.ForeignKey(Contest)
    user = models.ForeignKey(User)
    date_joined = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.contest.name + '-' + self.user.username

    class Meta:
        unique_together = ('contest', 'user')


class Contest_question(models.Model):
    contest = models.ForeignKey(Contest)
    question = models.ForeignKey(Question)
    date_added = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('contest', 'question')

    def __unicode__(self):
        return self.contest.name + '-' + self.question.title
