from .views import *
from django.urls import path

urlpatterns = [
    path("operations/", get_sales_report),
    path("profit/", get_profit_report),
]
