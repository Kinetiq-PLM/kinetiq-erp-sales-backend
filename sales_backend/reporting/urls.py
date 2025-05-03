from .views import *
from django.urls import path

urlpatterns = [
    path("operations/", get_sales_report),
    path("profit/", get_profit_report),
    path("top-customers/", get_customer_report),
    path("top-products/", get_product_report),
    path("top-employees/", get_employee_report),
    path("top-employee-conversions/", get_employee_conversions),
    path("commissions/", get_salesrep_commission),
    path("quota/", get_salesrep_quota_progress),
    path("supervisor-commissions/", supervisor_commission_view),
    path("supervisor-quota/", supervisor_quota_view),
]
