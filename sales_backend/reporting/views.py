from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.request import Request
from rest_framework.response import Response
from quotation.models import Quotation
from order.models import Order
from invoice.models import SalesInvoicesView
from CRM.models import Opportunities
from datetime import date, datetime, time
from django.utils.timezone import make_aware
from rest_framework import status
from decimal import Decimal
from dateutil.relativedelta import relativedelta
from customer.models import Customer
from order.models import Order
from django.db.models import Sum, Count, Q
from statement.models import *
from django.shortcuts import get_object_or_404
from delivery.models import DeliveryNote


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
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

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

    filtered_q = Quotation.objects.filter(
        date_issued__range=(start_date, end_date_inclusive)
    )
    filtered_o = Order.objects.filter(
        order_date__range=(start_date, end_date_inclusive)
    )
    filtered_i = SalesInvoicesView.objects.filter(
        invoice_date__range=(start_date, end_date_inclusive)
    )
    filtered_d = DeliveryNote.objects.filter(
        created_at__range=(start_date, end_date_inclusive)
    )

    data = {}
    total = 0
    for quotation in filtered_q:
        if params.get("period") == "day":
            hour = quotation.date_issued.hour
            str_date = f"{quotation.date_issued.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
        else:
            str_date = str(quotation.date_issued.date())
        if str_date not in data:
            data[str_date] = {
                "quotations": 0,
                "orders": 0,
                "invoices": 0,
                "deliveries": 0,
            }

        prev = data[str_date].get("quotations", 0)
        data[str_date]["quotations"] = prev + 1
        total += 1

    for order in filtered_o:
        if params.get("period") == "day":
            hour = order.order_date.hour
            str_date = (
                f"{order.order_date.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
            )
        else:
            str_date = str(order.order_date.date())
        if str_date not in data:
            data[str_date] = {
                "quotations": 0,
                "orders": 0,
                "invoices": 0,
                "deliveries": 0,
            }
        prev = data[str_date].get("orders", 0)
        data[str_date]["orders"] = prev + 1
        total += 1

    for invoice in filtered_i:
        if params.get("period") == "day":
            hour = invoice.invoice_date.hour
            str_date = f"{invoice.invoice_date.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
        else:
            str_date = str(invoice.invoice_date.date())
        if str_date not in data:
            data[str_date] = {
                "quotations": 0,
                "orders": 0,
                "invoices": 0,
                "deliveries": 0,
            }
        prev = data[str_date].get("invoices", 0)
        data[str_date]["invoices"] = prev + 1
        total += 1

    for delivery in filtered_d:
        if params.get("period") == "day":
            hour = delivery.created_at.hour
            str_date = f"{delivery.created_at.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
        else:
            str_date = str(delivery.created_at.date())
        if str_date not in data:
            data[str_date] = {
                "quotations": 0,
                "orders": 0,
                "invoices": 0,
                "deliveries": 0,
            }
        prev = data[str_date].get("deliveries", 0)
        data[str_date]["deliveries"] = prev + 1
        total += 1
    res = []
    for key in sorted(
        data.keys(),
        key=lambda x: (
            datetime.strptime(
                x,
                ("%Y-%m-%d" if params.get("period") != "day" else "%Y-%m-%dT%H:%M:%SZ"),
            )
        ),
    ):
        res.append({"date": key, **data[key]})

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date_inclusive,
            "data": res,
            "total": total,
        }
    )


@api_view(["GET"])
def get_profit_report(request: Request):
    """
    valid query params:
    period (required): day, month, year, all

    Returns the following object:
    {
        start_date: date,
        end_date: date,
        profit_data: [{date, total_amount}]
        total_profit: int
    }
    """
    params = request.query_params
    start_date = date.today()
    end_date = date.today()
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

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

    profits = SalesInvoicesView.objects.filter(
        payment_status__in=["Fully Paid", "Partially Paid"],
        invoice_date__range=(start_date, end_date_inclusive),
    )
    data = {}
    total_profit = Decimal(0)
    for profit in profits:
        if params.get("period") == "day":
            hour = profit.invoice_date.hour
            str_date = f"{profit.invoice_date.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
        else:
            str_date = str(profit.invoice_date.date())
        if str_date in data:
            data[str_date] += profit.total_amount_paid
        else:
            data[str_date] = profit.total_amount_paid
        total_profit += profit.total_amount_paid

    sales_profits = [
        {"date": key, "profit": data[key]}
        for key in sorted(
            data.keys(),
            key=lambda x: (
                datetime.strptime(
                    x,
                    (
                        "%Y-%m-%d"
                        if params.get("period") != "day"
                        else "%Y-%m-%dT%H:%M:%SZ"
                    ),
                )
            ),
        )
    ]

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date_inclusive,
            "profit_data": sales_profits,
            "total_profit": total_profit,
        }
    )


@api_view(["GET"])
def get_customer_report(request: Request):
    total_revenue = (
        Order.objects.aggregate(total=Sum("statement__total_amount"))["total"] or 1
    )  # Avoid division by zero

    # Get the top 3 customers by total spending
    top_customers = (
        Order.objects.values("statement__customer")
        .annotate(total_spent=Sum("statement__total_amount"))
        .order_by("-total_spent")[:3]
    )

    data = {"top_customers": []}

    # Calculate each top customer's percentage of total revenue
    for customer in top_customers:
        model = get_object_or_404(Customer, pk=customer["statement__customer"])
        data["top_customers"].append(
            {
                "customer": model.name,
                "percentage": round((customer["total_spent"] / total_revenue) * 100, 2),
            }
        )

    return Response(data)


@api_view(["GET"])
def get_product_report(request: Request):
    # only consider orders as product sold
    order_statements = Order.objects.values_list("statement_id", flat=True)
    filtered_statement_items = StatementItem.objects.filter(
        statement_id__in=order_statements
    )
    total_products = (
        filtered_statement_items.aggregate(total=Sum("quantity"))["total"] or 1
    )

    top_products = (
        filtered_statement_items.values("product")  # Group by product name
        .annotate(total_sold=Sum("quantity"))  # Sum total quantity sold
        .order_by("-total_sold")
    )
    data = {"top_products": []}

    # Calculate each top customer's percentage of total revenue
    total_percent = 0
    for product in top_products[:3]:  # Get top 3 best-selling products
        model = get_object_or_404(Products, pk=product["product"])
        percent = round((product["total_sold"] / total_products) * 100, 2)
        total_percent += percent
        data["top_products"].append(
            {
                "product": model.product_name,
                "percentage": percent,
            }
        )
    data["top_products"].append(
        {"product": "Others", "percentage": round(100 - total_percent, 2)}
    )
    data["total_sold"] = total_products
    return Response(data)


@api_view(["GET"])
def get_employee_report(request: Request):
    params = request.query_params
    period = params.get("period")
    queryset = Order.objects.all()
    now = timezone.now()
    if period == "Day":
        queryset = queryset.filter(order_date=now.date())
    elif period == "Month":
        queryset = queryset.filter(
            order_date__year=now.year, order_date__month=now.month
        )
    elif period == "Year":
        queryset = queryset.filter(order_date__year=now.year)

    total_revenue = (
        Order.objects.aggregate(total=Sum("statement__total_amount"))["total"] or 1
    )  # Avoid division by zero

    # Get the top 3 employees by total spending
    top_employees = (
        queryset.values("statement__salesrep")
        .annotate(total_sales=Sum("statement__total_amount"))
        .order_by("-total_sales")[:3]
    )

    data = {"top_employees": []}

    # Calculate each top customer's percentage of total revenue
    for employee in top_employees:
        model = get_object_or_404(Employees, pk=employee["statement__salesrep"])
        data["top_employees"].append(
            {
                "employee": f"{model.first_name} {model.last_name}",
                "percentage": round((employee["total_sales"] / total_revenue) * 100, 2),
            }
        )

    return Response(data)


@api_view(["GET"])
def get_employee_conversions(request: Request):
    params = request.query_params
    period = params.get("period")
    queryset = Opportunities.objects.filter(status=Opportunities.Status.WON)
    now = timezone.now()
    if period == "Day":
        queryset = queryset.filter(expected_closed_date=now.date())
    elif period == "Month":
        queryset = queryset.filter(
            expected_closed_date__year=now.year, expected_closed_date__month=now.month
        )
    elif period == "Year":
        queryset = queryset.filter(expected_closed_date__year=now.year)

    total_won = queryset.count() or 1

    # Get top 3 employees based on 'Won' opportunity count
    top_employees = (
        queryset.values("salesrep__employee_id")
        .annotate(won_count=Count("opportunity_id"))
        .order_by("-won_count")[:3]
    )

    data = {"top_employees": []}

    for entry in top_employees:
        employee = get_object_or_404(Employees, pk=entry["salesrep__employee_id"])
        data["top_employees"].append(
            {
                "employee": f"{employee.first_name} {employee.last_name}",
                "percentage": round((entry["won_count"] / total_won) * 100, 2),
            }
        )

    return Response(data)


@api_view(["GET"])
def get_sales_commissions(request: Request):
    """
    Retrieves all sales orders and calculates 10% commission for each sales representative.

    Returns:
    {
        "total_sales": decimal,
        "total_commission": decimal,
        "commissions": [
            {
                "sales_rep": str,
                "orders": int,
                "total_sales": decimal,
                "commission": decimal
            }
        ]
    }
    """
    # Get all orders grouped by sales rep
    sales_data = (
        Order.objects.values("statement__salesrep")
        .annotate(total_sales=Sum("statement__total_amount"), order_count=Count("id"))
        .order_by("-total_sales")
    )

    commission_rate = Decimal("0.10")  # 10% commission
    total_sales = Decimal("0")
    total_commission = Decimal("0")
    commissions = []

    for data in sales_data:
        if data["total_sales"]:
            sales_rep = get_object_or_404(Employees, pk=data["statement__salesrep"])
            commission = data["total_sales"] * commission_rate

            total_sales += data["total_sales"]
            total_commission += commission

            commissions.append(
                {
                    "sales_rep": f"{sales_rep.first_name} {sales_rep.last_name}",
                    "orders": data["order_count"],
                    "total_sales": round(data["total_sales"], 2),
                    "commission": round(commission, 2),
                }
            )

    return Response(
        {
            "total_sales": round(total_sales, 2),
            "total_commission": round(total_commission, 2),
            "commissions": commissions,
        }
    )


@api_view(["GET"])
def get_order_commissions(request: Request):
    """
    Retrieves individual orders and calculates commission for each order's sales representative.

    Returns:
    {
        "orders": [
            {
                "order_id": str,
                "order_date": date,
                "sales_rep": str,
                "order_amount": decimal,
                "commission": decimal,
                "customer": str
            }
        ],
        "total_orders": int,
        "total_commission": decimal
    }
    """
    orders = (
        Order.objects.select_related("statement__salesrep", "statement__customer")
        .all()
        .order_by("-order_date")
    )

    commission_rate = Decimal("0.10")  # 10% commission
    total_commission = Decimal("0")
    order_data = []

    for order in orders:
        if order.statement and order.statement.total_amount:
            commission = order.statement.total_amount * commission_rate
            total_commission += commission

            order_data.append(
                {
                    "order_id": order.order_id,
                    "order_date": order.order_date,
                    "sales_rep": (
                        f"{order.statement.salesrep.first_name} "
                        f"{order.statement.salesrep.last_name}"
                    ),
                    "customer": order.statement.customer.name,
                    "order_amount": round(order.statement.total_amount, 2),
                    "commission": round(commission, 2),
                }
            )

    return Response(
        {
            "orders": order_data,
            "total_orders": len(order_data),
            "total_commission": round(total_commission, 2),
        }
    )
