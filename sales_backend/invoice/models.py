from django.db import models
from datetime import datetime


class SalesInvoices(models.Model):
    class InvoiceStatus(models.TextChoices):
        PENDING = "Pending"
        PAID = "Paid"
        OVERDUE = "Overdue"

    class PaymentStatus(models.TextChoices):
        UNPAID = "Unpaid"
        PAID = "Paid"
        PARTIAL = "Partial"

    invoice_id = models.AutoField(primary_key=True)
    order = models.ForeignKey(
        to="order.Order", on_delete=models.CASCADE, related_name="invoice"
    )
    invoice_date = models.DateTimeField(default=datetime.now())
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    invoice_status = models.TextField(
        choices=InvoiceStatus, default=InvoiceStatus.PENDING
    )
    payment_status = models.TextField(
        choices=PaymentStatus, default=PaymentStatus.UNPAID
    )
    due_date = models.DateField()
