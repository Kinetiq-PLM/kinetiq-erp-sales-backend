from django.contrib import admin
from .models import *

admin.site.register(SalesInvoices, SalesInvoicesAdmin)
admin.site.register(Payments)
