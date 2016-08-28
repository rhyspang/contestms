# coding=utf-8
from django import forms
from contestms.models import *


# Register your models here.

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

    # def clean_name(self):

    #     if len(self.cleaned_data["name"])<4:
    #         raise forms.ValidationError(u"昵称长度不能小于4")
    #     else:
    #         for a in self.cleaned_data["name"]:
    #             if a not in ALLOW_CHAR:
    #                 raise forms.ValidationError(u"昵称仅能用字母或数字")

    #     users = User.objects.filter(username__iexact=self.cleaned_data["username"])
    #     if not users:
    #         return self.cleaned_data["username"]
    #     else:
    #         raise forms.ValidationError(u"该昵称已经被使用请使用其他的昵称")

    # def clean_password(self):
    #     if len(self.cleaned_data["password"])<6:
    #         raise forms.ValidationError(u"密码长度不能小于6")
    #     else:
    #         for a in self.cleaned_data["password"]:
    #             if a not in ALLOW_CHAR:
    #                 raise forms.ValidationError(u"密码仅能用字母或数字")
    #     return self.cleaned_data["password"]

    # def clean(self):
    #     """验证其他非法"""
    #     cleaned_data = super(RegisterForm, self).clean()

    #     if cleaned_data.get("password") == cleaned_data.get("username"):
    #         raise forms.ValidationError(u"用户名和密码不能一样")
    #     if cleaned_data.get("password") != cleaned_data.get("re_password"):
    #         raise forms.ValidationError(u"两次输入密码不一致")

    #     return cleaned_data




    def save(self):
        name = self.name
        gender = self.gender
        class_name = self.class_name
        tel_num = self.tel_num
        qq_num = self.qq_num
        stu_id = self.stu_id
        remark = self.remark
        password = self.password

        contestant = User.objects.create(
            username=name,
            gender=gender,
            class_name=class_name,
            stu_id=stu_id,
            tel_num=tel_num,
            qq_num=qq_num,
            comment=remark,
            password=password
        )
        return contestant


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

    def clean(self):
        if not self.is_valid():
            raise forms.ValidationError(u'请准确填写用户名和密码')
        else:
            self.cleaned_data = super(LoginForm, self).clean()

