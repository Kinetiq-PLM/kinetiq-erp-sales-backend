from django.db import models
from datetime import datetime
from order.models import Order
from delivery.models import ShippingDetails
from customer.models import Customer


class Payments(models.Model):
    class Method(models.TextChoices):
        CREDIT_CARD = "Credit Card"
        BANK_TRANSFER = "Bank Transfer"
        CASH = "Cash"

    class Status(models.TextChoices):
        PENDING = "Pending"
        COMPLETED = "Completed"
        FAILED = "Failed"

    payment_id = models.CharField(primary_key=True, max_length=255)
    order = models.ForeignKey(Order, models.CASCADE)
    payment_method = models.TextField(choices=Method)
    payment_status = models.TextField(choices=Status)
    payment_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"sales"."payments"'


class SalesInvoices(models.Model):
    class InvoiceStatus(models.TextChoices):
        PENDING = "Pending"
        PAID = "Paid"
        OVERDUE = "Overdue"

    invoice_id = models.CharField(primary_key=True, max_length=255)
    order = models.ForeignKey(
        to="order.Order", on_delete=models.CASCADE, related_name="invoice"
    )
    invoice_date = models.DateTimeField(default=datetime.now())
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    invoice_status = models.TextField(
        choices=InvoiceStatus, default=InvoiceStatus.PENDING
    )
    payment_status = models.TextField(
        choices=Payments.Status, default=Payments.Status.PENDING
    )
    due_date = models.DateField()

    class Meta:
        managed = False
        db_table = '"sales"."sales_invoices"'


class Receipt(models.Model):
    receipt_id = models.CharField(primary_key=True, max_length=255, blank=True)
    shipping = models.ForeignKey(ShippingDetails, models.DO_NOTHING)
    customer = models.ForeignKey(Customer, models.CASCADE)
    payments = models.ForeignKey(Payments, models.DO_NOTHING)
    policy_id = models.CharField(max_length=255)
    date_signed = models.DateField(blank=True, null=True)
    signed_docu = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"sales"."receipt"'
