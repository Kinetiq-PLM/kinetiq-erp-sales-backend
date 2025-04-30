from django.db import models
from misc.accounting.models import GeneralLedgerAccounts
from django.utils import timezone

# Create your models here.


class Customer(models.Model):
    class Type(models.TextChoices):
        LEAD = "Lead"
        PROSPECT = "Prospect"
        CLIENT = "Client"

    class Status(models.TextChoices):
        ACTIVE = "Active"
        INACTIVE = "Inactive"
        BLOCKED = "Blocked"

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
    updated_at = models.DateTimeField(blank=True, default=timezone.now)

    class Meta:
        managed = False
        db_table = '"sales"."customers"'

    def save(self, *args, **kwargs):
        if not self.pk:
            # on insert, leave updated_at at its default (now)
            super().save(*args, **kwargs)
        else:
            # on update, set updated_at explicitly
            self.updated_at = timezone.now()
            super().save(*args, **kwargs)
