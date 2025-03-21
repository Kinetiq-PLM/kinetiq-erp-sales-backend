from django.db import models
from order.models import Order
from misc.distribution.models import ShipmentDetails


class ShippingDetails(models.Model):
    class Method(models.TextChoices):
        STANDARD = "Standard"
        EXPRESS = "Express"
        OVERNIGHT = "Overnight"
        SAME_DAY = "Same-Day"
        INTERNATIONAL = "International"
        LOCAL = "Local"

    class Status(models.TextChoices):
        PENDING = "Pending"
        SHIPPED = "Shipped"
        DELIVERED = "Delivered"
        RETURNED = "Returned"

    shipping_id = models.CharField(primary_key=True, max_length=255)
    order = models.ForeignKey(to=Order, on_delete=models.CASCADE)
    operational_cost_id = models.CharField(max_length=255)
    shipment_id = models.ForeignKey(to=ShipmentDetails, on_delete=models.CASCADE)
    shipping_method = models.TextField(choices=Method)
    tracking_num = models.CharField(unique=True, max_length=50, blank=True, null=True)
    shipping_date = models.DateTimeField(blank=True, null=True)
    estimated_delivery = models.DateTimeField(blank=True, null=True)
    delivery_status = models.TextField(choices=Status)

    class Meta:
        db_table = '"sales"."shipping_details"'
