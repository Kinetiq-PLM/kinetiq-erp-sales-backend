from django.db import models


class Order(models.Model):
    class Status(models.TextChoices):
        PENDING = "Pending"
        PROCESSED = "Processed"
        SHIPPED = "Shipped"
        DELIVERED = "Delivered"
        CANCELLED = "Cancelled"

    class Type(models.TextChoices):
        DIRECT = "Direct"
        SCHEDULED = "Scheduled"
        OPEN = "Open"
        D3_SAMPLE = "D3 Sample"

    order_id = models.BigAutoField(primary_key=True)
    quotation = models.ForeignKey(
        to="quotation.Quotation", on_delete=models.SET_NULL, null=True, blank=True
    )
    statement = models.ForeignKey(to="statement.Statement", on_delete=models.CASCADE)
    rework_order = models.ForeignKey(
        to="misc.ReworkOrder", on_delete=models.SET_NULL, blank=True, null=True
    )
    goods_issue = models.ForeignKey(
        to="misc.GoodsIssue", on_delete=models.SET_NULL, null=True, blank=True
    )
    order_date = models.DateTimeField(auto_now_add=True)
    order_status = models.TextField(choices=Status, default=Status.PENDING)
    order_total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    order_type = models.TextField(choices=Type)
