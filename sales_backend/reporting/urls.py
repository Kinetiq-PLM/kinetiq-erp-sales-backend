from .views import *
from django.urls import path

urlpatterns = [
    path("operations/", get_sales_report),
    path("profit/", get_profit_report),
    path("top-customers/", get_customer_report),
    path("top-products/", get_product_report),
    path("top-employees/", get_employee_report),
]
