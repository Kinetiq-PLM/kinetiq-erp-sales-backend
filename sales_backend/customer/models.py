from django.db import models

# Create your models here.


class Customer(models.Model):
    class Type(models.TextChoices):
        LEAD = "Lead"
        PROSPECT = "Prospect"
        CLIENT = "Client"

    class Status(models.TextChoices):
        ACTIVE = "Active"
        INACTIVE = "Inactive"

    customer_id = models.BigAutoField(primary_key=True)
    gl_account = models.ForeignKey(
        to="misc.GeneralLedgerAccounts", on_delete=models.SET_NULL, null=True
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
    debt = models.DecimalField(max_digits=10, decimal_places=2, default=0)
