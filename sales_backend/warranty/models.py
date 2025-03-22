from django.db import models
from order.models import Order
from customer.models import Customer
from invoice.models import Payments


class RenewalWarranty(models.Model):
    class Status(models.TextChoices):
        PENDING = "Pending"
        APPROVED = "Approved"
        REJECTED = "Rejected"

    renewal_id = models.CharField(primary_key=True, max_length=255, blank=True)
    order = models.ForeignKey(Order, models.CASCADE)
    customer = models.ForeignKey(Customer, models.CASCADE)
    product_id = models.CharField(max_length=255)
    payments = models.ForeignKey(Payments, models.CASCADE)
    service_request_id = models.CharField(max_length=255, blank=True, null=True)
    original_warranty_start = models.DateField(blank=True, null=True)
    original_warranty_end = models.DateField(blank=True, null=True)
    renewal_warranty_start = models.DateField(blank=True, null=True)
    renewal_warranty_end = models.DateField(blank=True, null=True)
    renewal_status = models.TextField(choices=Status, default=Status.PENDING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    renewal_fee = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        db_table = '"sales"."renewal_warranty"'
