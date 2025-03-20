from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.request import Request
from rest_framework.response import Response
from quotation.models import Quotation
from order.models import Order
from invoice.models import SalesInvoices
from datetime import date, datetime
from rest_framework import status
from dateutil.relativedelta import relativedelta


@api_view(["GET"])
def get_sales_report(request: Request):
    """
    valid query params:
    period (default 'day'): day, month, year, all

    Returns the following object:
    {
        start_date: date,
        end_date: date,
        quotations: [{date, number_of_quotations}],
        orders: [{date, number_of_orders}],
        invoices: [{date, number_of_invoices}],
        deliveries: [{date, number_of_deliveries}]
        total_sold: int
    }
    """
    params = request.query_params
    start_date = date.today()
    end_date = date.today()

    match params.get("period"):
        case "month":
            start_date = date.today() - relativedelta(months=1)
        case "year":
            start_date = date.today() - relativedelta(years=1)
        case "all":
            start_date = datetime.fromtimestamp(0).date()
        case "day":
            pass
        case other:
            if other is not None:
                return Response(
                    {"error": "invalid period"}, status=status.HTTP_400_BAD_REQUEST
                )

    filtered_q = Quotation.objects.filter(date_issued__range=(start_date, end_date))
    filtered_o = Order.objects.filter(order_date__range=(start_date, end_date))
    filtered_i = SalesInvoices.objects.filter(
        invoice_date__range=(start_date, end_date)
    )

    data = {}
    for quotation in filtered_q:
        str_date = str(quotation.date_issued.date())
        if str_date in data:
            data[str_date] += 1
        else:
            data[str_date] = 1

    quotations = [
        {"date": key, "number_of_quotations": value} for key, value in data.items()
    ]

    data = {}
    for order in filtered_o:
        str_date = str(order.order_date.date())
        if str_date in data:
            data[str_date] += 1
        else:
            data[str_date] = 1

    orders = [{"date": key, "number_of_orders": value} for key, value in data.items()]
    data = {}
    for invoice in filtered_i:
        str_date = str(invoice.invoice_date.date())
        if str_date in data:
            data[str_date] += 1
        else:
            data[str_date] = 1

    invoices = [
        {"date": key, "number_of_invoices": value} for key, value in data.items()
    ]
    return Response(
        {
            "start_date": start_date,
            "end_date": end_date,
            "quotations": quotations,
            "orders": orders,
            "invoices": invoices,
        }
    )


@api_view(["GET"])
def get_profit_report(request: Request):
    """
    valid query params:
    period (required): day, month, year, all

    Returns the following object:
    {
        profit_data: [{date, total_amount}]
        total_profit: int
    }
    """
    params = request.query_params
    return Response({"success": True})
