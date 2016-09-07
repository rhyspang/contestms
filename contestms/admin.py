from django.contrib import admin

# Register your models here.
from contestms.models import *


class ExampleInline(admin.TabularInline):
    model = Example
    extra = 0


class QuestionAdmin(admin.ModelAdmin):
    inlines = [ExampleInline]


admin.site.register(Contest)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Contest_question)
admin.site.register(Application)
admin.site.register(SubmitInfo)
admin.site.register(Contest_user)
