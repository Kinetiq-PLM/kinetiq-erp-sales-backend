from django.db import models
from misc.accounting.models import GeneralLedgerAccounts

# Create your models here.


class Customer(models.Model):
    class Type(models.TextChoices):
        LEAD = "Lead"
        PROSPECT = "Prospect"
        CLIENT = "Client"

    class Status(models.TextChoices):
        ACTIVE = "Active"
        INACTIVE = "Inactive"

    customer_id = models.CharField(primary_key=True, max_length=255, blank=True)
    gl_account = models.ForeignKey(
        to=GeneralLedgerAccounts, on_delete=models.SET_NULL, null=True, blank=True
    )
    name = models.CharField(max_length=255, default="")
    email_address = models.CharField(max_length=255, unique=True)
    phone_number = models.CharField(max_length=20)
    address_line1 = models.TextField(max_length=255)
    address_line2 = models.TextField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=20)
    country = models.CharField(max_length=100)
    customer_type = models.TextField(choices=Type)
    status = models.TextField(choices=Status)
    contact_person = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"sales"."customers"'
