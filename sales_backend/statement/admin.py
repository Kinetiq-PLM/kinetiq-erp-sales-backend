from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Statement, StatementAdmin)
admin.site.register(StatementItem)
