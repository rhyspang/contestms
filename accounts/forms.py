# coding=utf-8
from django import forms
from contestms.models import *

# Register your models here.
ALLOW_CHAR = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_'


class RegisterForm(forms.Form):
    GENDER_CHOICES = (
        ('male', '男'),
        ('female', '女'),
    )

    name = forms.CharField(label=u"姓名", max_length=40,
                           widget=forms.TextInput(attrs={'size': 40, 'class': "form-control"}))
    gender = forms.ChoiceField(choices=GENDER_CHOICES, label=u"性别")

    class_name = forms.CharField(label=u"班级", max_length=40,
                                 widget=forms.TextInput(attrs={'size': 40, 'class': "form-control"}))
    tel_num = forms.CharField(label=u"电话", max_length=20,
                              widget=forms.TextInput(attrs={'size': 40, 'class': "form-control"}))
    qq_num = forms.CharField(label=u"qq", max_length=20,
                             widget=forms.TextInput(attrs={'size': 40, 'class': "form-control"}))

    stu_id = forms.CharField(label=u"学号", max_length=20,
                             widget=forms.TextInput(attrs={'size': 40, 'class': "form-control"}))

    remark = forms.CharField(label=u'备注', widget=forms.Textarea, required=False)

    password = forms.CharField(label=u"密码", max_length=20,
                               widget=forms.PasswordInput(attrs={'size': 20, 'class': "form-control"}))
    re_password = forms.CharField(label=u"重复密码", max_length=20,
                                  widget=forms.PasswordInput(attrs={'size': 20, 'class': "form-control"}))

    def clean_name(self):
        if len(self.cleaned_data['name']) < 2 or len(self.cleaned_data['name']) > 10:
            raise forms.ValidationError(u'姓名长度不合法')
        user = User.objects.filter(username__iexact=self.cleaned_data['name'])
        if not user:
            return self.cleaned_data['name']
        else:
            raise forms.ValidationError(u'该姓名已注册!')

    def clean_password(self):
        for a in self.cleaned_data['password']:
            if a not in ALLOW_CHAR:
                raise forms.ValidationError(u'密码只能包含数字字母下划线')
        return self.cleaned_data['password']

    def clean(self):
        cleaned_data = super(RegisterForm, self).clean()
        if cleaned_data.get("password") == cleaned_data.get("name"):
            raise forms.ValidationError(u"用户名和密码不能一样")
        if cleaned_data.get("password") != cleaned_data.get("re_password"):
            raise forms.ValidationError(u"两次输入密码不一致")
        return cleaned_data

    def save(self):
        name = self.cleaned_data['name']
        gender = self.cleaned_data['gender']
        class_name = self.cleaned_data['class_name']
        tel_num = self.cleaned_data['tel_num']
        qq_num = self.cleaned_data['qq_num']
        stu_id = self.cleaned_data['stu_id']
        remark = self.cleaned_data['remark']
        password = self.cleaned_data['password']

        user = User.objects.create_user(
            username=name,
            gender=gender,
            class_name=class_name,
            stu_id=stu_id,
            tel_num=tel_num,
            qq_num=qq_num,
            comment=remark,
            password=password
        )
        return user


class LoginForm(forms.Form):
    username = forms.CharField(
        required=True,
        label=u'用户名',
        error_messages={'required': u'请输入姓名'},
        widget=forms.TextInput(
            attrs={
                'placeholder': u'请输入姓名',
            }
        ),
    )
    password = forms.CharField(
        required=True,
        label=u'密码',
        error_messages={'required': u'请输入密码'},
        widget=forms.PasswordInput(
            attrs={
                'placeholder': u'请输入密码',
            }
        ),
    )

    def clean_username(self):
        user = User.objects.filter(username__iexact=self.cleaned_data['username'])
        if not user:
            return forms.ValidationError(u'用户不存在')
        else:
            return self.cleaned_data['username']

    def clean(self):
        if not self.is_valid():
            raise forms.ValidationError(u'请准确填写用户名和密码')
        else:
            cleaned_data = super(LoginForm, self).clean()
