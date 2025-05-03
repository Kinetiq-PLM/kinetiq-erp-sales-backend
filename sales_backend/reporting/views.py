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
import calendar


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
    # Get order statements and filter statement items
    order_statements = Order.objects.values_list("statement_id", flat=True)
    filtered_statement_items = StatementItem.objects.filter(
        statement_id__in=order_statements
    ).select_related("inventory_item__item")

    # Get total quantity of all products sold
    total_products = (
        filtered_statement_items.aggregate(total=Sum("quantity"))["total"] or 1
    )

    # Get top products with distinct items
    top_products = (
        filtered_statement_items.values(
            "inventory_item",
            "inventory_item__item__item_name",  # Include item name directly
        )
        .annotate(total_sold=Sum("quantity"))
        .order_by("-total_sold")
    )

    data = {"top_products": []}
    total_percent = 0

    # Get top 3 best-selling products
    for product in top_products[:3]:
        percent = round((product["total_sold"] / total_products) * 100, 2)
        total_percent += percent
        data["top_products"].append(
            {
                "product": product["inventory_item__item__item_name"],
                "percentage": percent,
            }
        )

    # Add "Others" category
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
def get_salesrep_commission(request: Request):
    """
    Get commission history for a specific sales representative over time.

    Query parameters:
    - salesrep (required): Employee ID of the sales representative
    - period (required): 'day', 'month', 'year', 'all'

    Returns:
    {
        "start_date": date,
        "end_date": date,
        "commission_data": [
            {
                "date": str,
                "commission": decimal,
                "sales": decimal
            }
        ],
        "total_commission": decimal,
        "total_sales": decimal
    }
    """
    params = request.query_params
    salesrep_id = params.get("salesrep")

    if not salesrep_id:
        return Response(
            {"error": "salesrep parameter is required"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    start_date = date.today()
    end_date = date.today()
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

    # Set date range based on period
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
            return Response(
                {"error": "invalid period"}, status=status.HTTP_400_BAD_REQUEST
            )

    # Get orders for the sales rep within date range
    orders = Order.objects.filter(
        statement__salesrep_id=salesrep_id,
        order_date__range=(start_date, end_date_inclusive),
    ).select_related("statement")

    commission_rate = Decimal("0.10")
    data = {}
    total_commission = Decimal("0")
    total_sales = Decimal("0")

    # Aggregate data by date
    for order in orders:
        if not order.statement or not order.statement.total_amount:
            continue

        if params.get("period") == "day":
            hour = order.order_date.hour
            str_date = (
                f"{order.order_date.date()}T{hour if hour > 9 else f'0{hour}'}:00:00Z"
            )
        else:
            str_date = str(order.order_date.date())

        if str_date not in data:
            data[str_date] = {"commission": Decimal("0"), "sales": Decimal("0")}

        commission = order.statement.total_amount * commission_rate
        data[str_date]["commission"] += commission
        data[str_date]["sales"] += order.statement.total_amount
        total_commission += commission
        total_sales += order.statement.total_amount

    # Format data for line graph
    commission_data = [
        {
            "date": key,
            "commission": round(data[key]["commission"], 2),
            "sales": round(data[key]["sales"], 2),
        }
        for key in sorted(
            data.keys(),
            key=lambda x: datetime.strptime(
                x, "%Y-%m-%d" if params.get("period") != "day" else "%Y-%m-%dT%H:%M:%SZ"
            ),
        )
    ]

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date_inclusive,
            "commission_data": commission_data,
            "total_commission": round(total_commission, 2),
            "total_sales": round(total_sales, 2),
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


@api_view(["GET"])
def get_salesrep_quota_progress(request: Request):
    """
    Get daily order counts for a sales representative in the current month and compare against quota.

    Query parameters:
    - salesrep (required): Employee ID of the sales representative

    Returns:
    {
        "quota": int,
        "current_total": int,
        "remaining": int,
        "quota_reached": boolean,
        "start_date": date,
        "end_date": date,
        "daily_progress": [
            {
                "date": str,
                "orders": int,
                "cumulative_total": int
            }
        ]
    }
    """
    params = request.query_params
    salesrep_id = params.get("salesrep")

    if not salesrep_id:
        return Response(
            {"error": "salesrep parameter is required"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    # Set date range for current month
    today = date.today()
    start_date = date(today.year, today.month, 1)
    end_date = date(
        today.year + (today.month // 12), ((today.month % 12) + 1), 1
    ) - relativedelta(days=1)
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

    # Get orders for the sales rep within current month
    orders = Order.objects.filter(
        statement__salesrep_id=salesrep_id,
        order_date__range=(start_date, end_date_inclusive),
    ).order_by("order_date")

    # Initialize tracking variables
    monthly_quota = 50
    data = {}
    current_total = 0

    # Aggregate daily orders
    for order in orders:
        str_date = str(order.order_date.date())

        if str_date not in data:
            data[str_date] = {"orders": 0, "cumulative_total": 0}

        data[str_date]["orders"] += 1
        current_total += 1
        data[str_date]["cumulative_total"] = current_total

    # Format data for line graph, including dates with no orders
    daily_progress = []
    current_date = start_date
    running_total = 0

    while current_date <= end_date:
        str_date = str(current_date)
        if str_date in data:
            running_total = data[str_date]["cumulative_total"]
            daily_progress.append(
                {
                    "date": str_date,
                    "orders": data[str_date]["orders"],
                    "cumulative_total": running_total,
                }
            )
        else:
            daily_progress.append(
                {"date": str_date, "orders": 0, "cumulative_total": running_total}
            )
        current_date += relativedelta(days=1)

    return Response(
        {
            "quota": monthly_quota,
            "current_total": current_total,
            "remaining": max(0, monthly_quota - current_total),
            "quota_reached": current_total >= monthly_quota,
            "start_date": start_date,
            "end_date": end_date,
            "daily_progress": daily_progress,
        }
    )


@api_view(["GET"])
def supervisor_commission_view(request: Request):
    params = request.query_params
    today = date.today()
    start_date = today
    end_date = today
    group_by_month = False

    match params.get("period"):
        case "month":
            start_date = date(today.year, today.month, 1)
            end_date = date(
                today.year + (today.month // 12), ((today.month % 12) + 1), 1
            ) - relativedelta(days=1)
        case "year":
            start_date = date(today.year, 1, 1)
            end_date = date(today.year, 12, 31)
            group_by_month = True
        case "all":
            # Get the date of first order instead of epoch time
            first_order = Order.objects.order_by("order_date").first()
            start_date = first_order.order_date.date() if first_order else today
            end_date = today
            group_by_month = True
        case "day":
            pass
        case other:
            return Response(
                {"error": "Invalid period. Use 'day', 'month', 'year', or 'all'"},
                status=status.HTTP_400_BAD_REQUEST,
            )

    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))
    sales_reps = Employees.objects.filter(
        position__position_title="Sales Representative"
    )
    commission_rate = Decimal("0.10")

    # Initialize data structures
    period_data = {}
    sales_rep_names = []
    total_period_commission = Decimal("0")
    total_period_sales = Decimal("0")

    # Initialize data structure based on grouping
    current_date = start_date
    while current_date <= end_date:
        if group_by_month:
            str_date = current_date.strftime("%Y-%m")  # YYYY-MM format for months
            current_date += relativedelta(months=1)
        else:
            str_date = str(current_date)
            current_date += relativedelta(days=1)

        period_data[str_date] = {
            "date": str_date,
            "sales_reps": [],
            "total_commission": Decimal("0"),
            "total_sales": Decimal("0"),
        }

    # Collect data for each sales rep
    for sales_rep in sales_reps:
        sales_rep_name = f"{sales_rep.first_name} {sales_rep.last_name}"
        sales_rep_names.append(sales_rep_name)

        orders = Order.objects.filter(
            statement__salesrep=sales_rep,
            order_date__range=(start_date, end_date_inclusive),
        ).select_related("statement")

        # Process each order
        for order in orders:
            if order.statement and order.statement.total_amount:
                str_date = (
                    order.order_date.strftime("%Y-%m")
                    if group_by_month
                    else str(order.order_date.date())
                )
                amount = order.statement.total_amount
                commission = amount * commission_rate

                # Find or create sales rep entry for this period
                rep_entry = None
                for entry in period_data[str_date]["sales_reps"]:
                    if entry["name"] == sales_rep_name:
                        rep_entry = entry
                        break

                if rep_entry is None:
                    rep_entry = {
                        "name": sales_rep_name,
                        "commission": Decimal("0"),
                        "sales": Decimal("0"),
                    }
                    period_data[str_date]["sales_reps"].append(rep_entry)

                # Update amounts
                rep_entry["commission"] += commission
                rep_entry["sales"] += amount
                period_data[str_date]["total_commission"] += commission
                period_data[str_date]["total_sales"] += amount
                total_period_commission += commission
                total_period_sales += amount

    # Ensure each period has entries for all sales reps
    for data in period_data.values():
        existing_reps = {rep["name"] for rep in data["sales_reps"]}
        for rep_name in sales_rep_names:
            if rep_name not in existing_reps:
                data["sales_reps"].append(
                    {
                        "name": rep_name,
                        "commission": Decimal("0"),
                        "sales": Decimal("0"),
                    }
                )

    # Sort and format data
    sorted_period_data = [
        {
            **data,
            "total_commission": round(data["total_commission"], 2),
            "total_sales": round(data["total_sales"], 2),
            "sales_reps": [
                {
                    **rep,
                    "commission": round(rep["commission"], 2),
                    "sales": round(rep["sales"], 2),
                }
                for rep in data["sales_reps"]
            ],
        }
        for data in sorted(period_data.values(), key=lambda x: x["date"])
    ]

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date,
            "daily_data": sorted_period_data,
            "total_period_commission": round(total_period_commission, 2),
            "total_period_sales": round(total_period_sales, 2),
            "sales_reps": sales_rep_names,
        }
    )


@api_view(["GET"])
def supervisor_quota_view(request: Request):
    """
    Get quota progress for all Sales Representatives for the current month.
    Monthly quota is 50 orders per employee.

    Returns:
    {
        "start_date": date,
        "end_date": date,
        "period_data": [
            {
                "date": str,
                "sales_reps": [
                    {
                        "name": str,
                        "orders": int,
                        "quota": int,
                        "remaining": int,
                        "quota_reached": boolean,
                        "quota_percentage": decimal
                    }
                ],
                "total_orders": int,
                "total_quota": int,
                "total_remaining": int
            }
        ],
        "total_period_orders": int,
        "total_period_quota": int,
        "sales_reps": [str]
    }
    """
    # Set current month date range
    today = date.today()
    start_date = date(today.year, today.month, 1)
    end_date = date(
        today.year + (today.month // 12), ((today.month % 12) + 1), 1
    ) - relativedelta(days=1)
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

    # Constants
    monthly_quota = 50  # Standard monthly quota per sales rep
    sales_reps = Employees.objects.filter(
        position__position_title="Sales Representative"
    )
    total_period_quota = monthly_quota * len(
        sales_reps
    )  # Fixed: Simple integer multiplication

    # Initialize data structures
    period_data = {}
    sales_rep_names = []
    total_period_orders = 0

    # Initialize daily data structure
    current_date = start_date
    while current_date <= end_date:
        str_date = str(current_date)
        days_in_month = calendar.monthrange(current_date.year, current_date.month)[1]
        daily_quota = round(monthly_quota / days_in_month, 2)
        total_daily_quota = daily_quota * len(sales_reps)

        period_data[str_date] = {
            "date": str_date,
            "sales_reps": [],
            "total_orders": 0,
            "total_quota": total_daily_quota,
            "total_remaining": total_daily_quota,
        }
        current_date += relativedelta(days=1)

    # Collect data for each sales rep
    for sales_rep in sales_reps:
        sales_rep_name = f"{sales_rep.first_name} {sales_rep.last_name}"
        sales_rep_names.append(sales_rep_name)

        orders = Order.objects.filter(
            statement__salesrep=sales_rep,
            order_date__range=(start_date, end_date_inclusive),
        ).order_by("order_date")

        # Process orders
        for order in orders:
            str_date = str(order.order_date.date())
            days_in_month = calendar.monthrange(
                order.order_date.year, order.order_date.month
            )[1]
            daily_quota = round(monthly_quota / days_in_month, 2)

            # Find or create sales rep entry
            rep_entry = None
            for entry in period_data[str_date]["sales_reps"]:
                if entry["name"] == sales_rep_name:
                    rep_entry = entry
                    break

            if rep_entry is None:
                rep_entry = {
                    "name": sales_rep_name,
                    "orders": 0,
                    "quota": daily_quota,
                    "remaining": daily_quota,
                    "quota_reached": False,
                    "quota_percentage": 0,
                }
                period_data[str_date]["sales_reps"].append(rep_entry)

            # Update counts
            rep_entry["orders"] += 1
            rep_entry["remaining"] = max(0, rep_entry["quota"] - rep_entry["orders"])
            rep_entry["quota_reached"] = rep_entry["orders"] >= rep_entry["quota"]
            rep_entry["quota_percentage"] = round(
                (rep_entry["orders"] / rep_entry["quota"]) * 100, 2
            )
            period_data[str_date]["total_orders"] += 1
            period_data[str_date]["total_remaining"] = max(
                0,
                period_data[str_date]["total_quota"]
                - period_data[str_date]["total_orders"],
            )
            total_period_orders += 1

    # Ensure each day has entries for all sales reps
    for data in period_data.values():
        existing_reps = {rep["name"] for rep in data["sales_reps"]}
        period_date = datetime.strptime(data["date"], "%Y-%m-%d").date()
        days_in_month = calendar.monthrange(period_date.year, period_date.month)[1]
        daily_quota = round(monthly_quota / days_in_month, 2)

        for rep_name in sales_rep_names:
            if rep_name not in existing_reps:
                data["sales_reps"].append(
                    {
                        "name": rep_name,
                        "orders": 0,
                        "quota": daily_quota,
                        "remaining": daily_quota,
                        "quota_reached": False,
                        "quota_percentage": 0,
                    }
                )

    # Sort and format data
    sorted_period_data = sorted(period_data.values(), key=lambda x: x["date"])

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date,
            "period_data": sorted_period_data,
            "total_period_orders": total_period_orders,
            "total_period_quota": total_period_quota,
            "sales_reps": sales_rep_names,
        }
    )
