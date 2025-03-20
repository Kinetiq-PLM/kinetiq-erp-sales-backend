from django.db import models
from datetime import datetime
from misc.human_resources.models import Employees


class Leads(models.Model):
    class Source(models.TextChoices):
        WEBSITE = "Website"
        REFERRAL = "Referral"
        COLD_CALL = "Cold Call"
        EMAIL = "Email"

    class Status(models.TextChoices):
        NEW = "New"
        CONTACTED = "Contacted"
        QUALIFIED = "Qualified"
        CONVERTED = "Converted"
        LOST = "Lost"

    lead_id = models.CharField(primary_key=True, max_length=255)
    salesrep = models.ForeignKey(
        to="misc.Employee", on_delete=models.SET_NULL, null=True
    )
    lead_name = models.CharField(max_length=255)
    lead_email = models.CharField(max_length=255)
    lead_phonenum = models.CharField(max_length=20)
    source = models.TextField(choices=Source, default=Source.WEBSITE)
    status = models.TextField(choices=Status, default=Status.NEW)

    class Meta:
        db_table = "sales.leads"


class Campaigns(models.Model):
    class Type(models.TextChoices):
        EMAIL = "Email"
        SOCIAL_MEDIA = "Social Media"
        REFERRAL = "Referral"
        ADVERTISEMENT = "Advertisement"

    class Status(models.TextChoices):
        PLANNED = "Planned"
        ACTIVE = "Active"
        COMPLETED = "Completed"

    campaign_id = models.CharField(primary_key=True, max_length=255)
    campaign_name = models.CharField(max_length=255)
    type = models.TextField(choices=Type, default=Type.EMAIL)
    start_date = models.DateTimeField(default=datetime.now())
    end_date = models.DateTimeField(default=datetime.now())
    status = models.TextField(choices=Status, default=Status.ACTIVE)

    class Meta:
        db_table = "sales.campaigns"


class CampaignContacts(models.Model):
    class ResponseStatus(models.TextChoices):
        INTERESTED = "Interested"
        NOT_INTERESTED = "Not Interested"
        PENDING = "Pending"

    contact_id = models.CharField(primary_key=True, max_length=255)
    lead = models.ForeignKey(
        to=Leads, on_delete=models.SET_NULL, null=True, related_name="campaigns"
    )
    campaign = models.ForeignKey(
        to=Campaigns, on_delete=models.CASCADE, related_name="contacts"
    )
    response_status = models.TextField(
        choices=ResponseStatus, default=ResponseStatus.PENDING
    )

    class Meta:
        db_table = "sales.campaign_contacts"


class Opportunities(models.Model):
    class Stage(models.TextChoices):
        PROSPECTING = "Prospecting"
        NEGOTIATION = "Negotiation"
        CLOSED = "Closed"

    class Status(models.TextChoices):
        OPEN = "Open"
        WON = "Won"
        LOST = "Lost"

    opportunity_id = models.CharField(primary_key=True, max_length=255)
    customer = models.ForeignKey(
        to="customer.Customer", on_delete=models.SET_NULL, null=True
    )
    partner = models.ForeignKey(
        to="misc.BusinessPartnerMaster", on_delete=models.SET_NULL, null=True
    )
    salesrep = models.ForeignKey(
        to="misc.Employee", on_delete=models.SET_NULL, null=True
    )
    estimated_value = models.DecimalField(max_digits=10, decimal_places=2)
    expected_closed_date = models.DateTimeField(default=datetime.now())
    stage = models.TextField(choices=Stage)
    status = models.TextField(choices=Status)
    description = models.TextField(blank=True, null=True)
    reason_lost = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(default=datetime.now())

    class Meta:
        db_table = "sales.opportunities"


class Ticket(models.Model):
    class Status(models.TextChoices):
        OPEN = "Open"
        IN_PROGRESS = "In Progress"
        CLOSED = "Closed"

    class Priority(models.TextChoices):
        LOW = "Low"
        MEDIUM = "Medium"
        HIGH = "High"
        URGENT = "Urgent"

    ticket_id = models.CharField(primary_key=True, max_length=255)
    customer = models.ForeignKey(to="customer.Customer", on_delete=models.CASCADE)
    salesrep = models.ForeignKey(to=Employees, on_delete=models.CASCADE, null=True)
    subject = models.CharField(max_length=255)
    description = models.TextField()
    status = models.TextField(choices=Status)
    priority = models.TextField(choices=Priority)
    created_at = models.DateTimeField(default=datetime.now())

    class Meta:
        db_table = "sales.ticket"


class TicketConvo(models.Model):
    convo_id = models.CharField(primary_key=True, max_length=255)
    ticket = models.ForeignKey(
        to=Ticket, on_delete=models.CASCADE, related_name="conversations"
    )
    content = models.CharField(max_length=255)
    created_at = models.DateTimeField(default=datetime.now())

    class Meta:
        db_table = "sales.ticket_convo"
