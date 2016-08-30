from django.contrib import admin

# Register your models here.
from contestms.models import Contest, Question, Contest_question, Application, SubmitInfo

admin.site.register(Contest)
admin.site.register(Question)
admin.site.register(Contest_question)
admin.site.register(Application)
admin.site.register(SubmitInfo)