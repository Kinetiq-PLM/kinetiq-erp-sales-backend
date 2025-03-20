from django.db import models
from statement.serializers import *


class Quotation(models.Model):
    class Status(models.TextChoices):
        PENDING = "Pending"
        APPROVED = "Approved"
        REJECTED = "Rejected"

    quotation_id = models.CharField(primary_key=True, max_length=255)
    statement = models.ForeignKey(to="statement.Statement", on_delete=models.CASCADE)
    agreement = models.ForeignKey(
        to="agreement.BlanketAgreement",
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
    )
    date_issued = models.DateTimeField(auto_now_add=True)
    status = models.TextField(choices=Status, default=Status.PENDING)

    class Meta:
        db_table = "sales.quotation"
