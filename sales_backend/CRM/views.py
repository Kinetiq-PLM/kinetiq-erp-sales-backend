from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework import status
from django.shortcuts import get_object_or_404
from django.db import transaction
from dateutil.relativedelta import relativedelta
from django.db.models import Count
from datetime import datetime, date, time
from django.utils.timezone import make_aware
from rest_framework.decorators import api_view
from django.db.models import Q, Count, Avg, Sum


class CampaignsViewSet(viewsets.ModelViewSet):
    queryset = Campaigns.objects.all().order_by("-end_date")
    serializer_class = CampaignsSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        filter = {}
        if status:
            filter["status__in"] = status.split(",")

        campaigns = CampaignStatusView.objects.filter(**filter).order_by("-end_date")
        return Response(CampaignStatusViewSerializer(campaigns, many=True).data)

    def create(self, request, *args, **kwargs):
        created = Campaigns.objects.create(**request.data)
        return Response(
            CampaignStatusViewSerializer(
                get_object_or_404(CampaignStatusView, pk=created.campaign_id)
            ).data
        )

    def update(self, request: Request, *args, **kwargs):
        """inputs:
        {
            contacts: [customer_id]
        }
        """
        contacts = request.data.get("contacts", [])
        remove = request.data.get("remove", [])
        try:
            with transaction.atomic():
                campaign = self.get_object()
                for contact in contacts:
                    exists = CampaignContacts.objects.filter(
                        campaign=campaign, customer=contact
                    ).exists()
                    if not exists:
                        contact_serializer = CampaignContactsSerializer(
                            data={
                                "customer": contact,
                                "campaign": campaign.campaign_id,
                            }
                        )
                        if contact_serializer.is_valid():
                            contact_serializer.save()
                        else:
                            raise Exception(contact_serializer.errors)
                for contact in remove:
                    c = CampaignContacts.objects.filter(
                        campaign=campaign, customer=contact
                    )
                    if c.exists():
                        c.delete()

                campaign.refresh_from_db()
                return Response(CampaignsSerializer(campaign).data)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)


class CampaignContactsViewSet(viewsets.ModelViewSet):
    queryset = CampaignContacts.objects.all()
    serializer_class = CampaignContactsSerializer


class OpportunitiesViewSet(viewsets.ModelViewSet):
    queryset = Opportunities.objects.all()
    serializer_class = OpportunitiesSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        customer = params.get("customer")
        salesrep = params.get("salesrep")
        filtered = {"is_archived": False}
        if customer:
            filtered["customer__customer_id"] = customer
        if salesrep:
            s = Employees.objects.get(pk=salesrep)
            if not s.is_supervisor:
                filtered["salesrep__employee_id"] = salesrep
        return Response(
            self.serializer_class(self.queryset.filter(**filtered), many=True).data
        )


class TicketViewSet(viewsets.ModelViewSet):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        salesrep = params.get("salesrep")
        filtered = {}
        if salesrep:
            s = Employees.objects.get(pk=salesrep)
            if not s.is_supervisor:
                filtered["salesrep__employee_id"] = salesrep

        return Response(
            self.serializer_class(self.queryset.filter(**filtered), many=True).data
        )


class TicketConvoViewSet(viewsets.ModelViewSet):
    queryset = TicketConvo.objects.all()
    serializer_class = TicketConvoSerializer


@api_view(["GET"])
def get_customer_type_report(request: Request):
    """
    Get counts of customers by type (Lead, Client, Prospect) over time.

    Query parameters:
    - period (required): 'day', 'month', 'year', 'all'

    Returns:
    {
        "start_date": date,
        "end_date": date,
        "customer_data": [
            {
                "date": str,
                "leads": int,
                "clients": int,
                "prospects": int,
                "total": int,
                "opportunities": int,
                "won": int
            }
        ],
        "totals": {
            "leads": int,
            "clients": int,
            "prospects": int,
            "total": int,
            "opportunities": int,
            "won": int
        },
        "average_value": float,
        "total_profit": float
    }
    """
    params = request.query_params
    start_date = date.today()
    end_date = date.today()
    end_date_inclusive = make_aware(datetime.combine(end_date, time.max))

    # Set date range based on period
    group_by_month = False
    match params.get("period"):
        case "month":
            start_date = date.today() - relativedelta(months=1)
        case "year":
            start_date = date.today() - relativedelta(years=1)
            group_by_month = True
        case "all":
            start_date = datetime.fromtimestamp(0).date()
            group_by_month = True
        case "day":
            pass
        case other:
            return Response(
                {"error": "invalid period"}, status=status.HTTP_400_BAD_REQUEST
            )

    # Get overall opportunity stats
    opportunity_stats = Opportunities.objects.filter(
        starting_date__range=(start_date, end_date_inclusive)
    ).aggregate(
        average_value=Avg("estimated_value"), total_profit=Sum("gross_profit_total")
    )

    # Get customers within date range
    customers = Customer.objects.filter(
        updated_at__range=(start_date, end_date_inclusive)
    )

    if group_by_month:
        customers = customers.extra(
            select={"month": "DATE_TRUNC('month', updated_at)"}
        ).values("month", "customer_type")
    else:
        customers = customers.values("updated_at__date", "customer_type")

    customers = customers.annotate(count=Count("customer_id")).order_by(
        "month" if group_by_month else "updated_at__date"
    )

    # Get opportunities within date range
    opportunities = Opportunities.objects.filter(
        starting_date__range=(start_date, end_date_inclusive)
    )

    if group_by_month:
        opportunities = opportunities.extra(
            select={"month": "DATE_TRUNC('month', starting_date)"}
        ).values("month")
    else:
        opportunities = opportunities.values("starting_date__date")

    opportunities = opportunities.annotate(
        opportunities=Count("opportunity_id"),
        won=Count("opportunity_id", filter=Q(stage="Closed") & Q(status="Won")),
    ).order_by("month" if group_by_month else "starting_date__date")

    # Initialize data structure
    data = {}
    totals = {
        "leads": 0,
        "clients": 0,
        "prospects": 0,
        "total": 0,
        "opportunities": 0,
        "won": 0,
    }

    # Aggregate customer data by date
    for customer in customers:
        date_key = customer["month" if group_by_month else "updated_at__date"]
        str_date = str(date_key.date() if group_by_month else date_key)

        if str_date not in data:
            data[str_date] = {
                "leads": 0,
                "clients": 0,
                "prospects": 0,
                "total": 0,
                "opportunities": 0,
                "won": 0,
            }

        customer_type = customer["customer_type"].lower() + "s"
        count = customer["count"]
        data[str_date][customer_type] = count
        data[str_date]["total"] += count

        # Update totals
        totals[customer_type] += count
        totals["total"] += count

    # Aggregate opportunities data
    for opportunity in opportunities:
        date_key = opportunity["month" if group_by_month else "starting_date__date"]
        str_date = str(date_key.date() if group_by_month else date_key)

        if str_date not in data:
            data[str_date] = {
                "leads": 0,
                "clients": 0,
                "prospects": 0,
                "total": 0,
                "opportunities": 0,
                "won": 0,
            }

        data[str_date]["opportunities"] = opportunity["opportunities"]
        data[str_date]["won"] = opportunity["won"]

        # Update totals
        totals["opportunities"] += opportunity["opportunities"]
        totals["won"] += opportunity["won"]

    # Format data for line graph
    customer_data = []
    current_date = start_date

    while current_date <= end_date:
        if group_by_month:
            str_date = str(date(current_date.year, current_date.month, 1))
            current_date += relativedelta(months=1)
        else:
            str_date = str(current_date)
            current_date += relativedelta(days=1)

        if str_date in data:
            customer_data.append({"date": str_date, **data[str_date]})
        else:
            customer_data.append(
                {
                    "date": str_date,
                    "leads": 0,
                    "clients": 0,
                    "prospects": 0,
                    "total": 0,
                    "opportunities": 0,
                    "won": 0,
                }
            )

    return Response(
        {
            "start_date": start_date,
            "end_date": end_date_inclusive,
            "customer_data": customer_data,
            "totals": totals,
            "average_value": round(opportunity_stats["average_value"] or 0, 2),
            "total_profit": round(opportunity_stats["total_profit"] or 0, 2),
        }
    )


@api_view(["GET"])
def get_dashboard_stats(request: Request):
    """
    Get dashboard statistics including:
    - Total leads and prospects
    - Total opportunities and closed opportunities
    - Active campaigns

    Returns:
    {
        "leads_count": int,
        "prospects_count": int,
        "total_opportunities": int,
        "closed_opportunities": int,
        "active_campaigns": [
            {
                "campaign_id": str,
                "campaign_name": str,
                "type": str,
                "start_date": datetime,
                "end_date": datetime,
                "status": str
            }
        ]
    }
    """
    # Get leads and prospects count
    customer_stats = (
        Customer.objects.filter(customer_type__in=["Lead", "Prospect"])
        .values("customer_type")
        .annotate(count=Count("customer_id"))
    )

    # Convert to dictionary for easy access
    customer_counts = {
        stat["customer_type"].lower() + "s_count": stat["count"]
        for stat in customer_stats
    }

    # Get opportunity stats
    opportunity_stats = Opportunities.objects.aggregate(
        total_opportunities=Count("opportunity_id"),
        closed_opportunities=Count("opportunity_id", filter=Q(stage="Closed")),
    )

    # Get active campaigns
    active_campaigns_count = CampaignStatusView.objects.filter(status="Active").count()

    return Response(
        {
            "leads_count": customer_counts.get("leads_count", 0),
            "prospects_count": customer_counts.get("prospects_count", 0),
            "total_opportunities": opportunity_stats["total_opportunities"],
            "closed_opportunities": opportunity_stats["closed_opportunities"],
            "active_campaigns_count": active_campaigns_count,
        }
    )
