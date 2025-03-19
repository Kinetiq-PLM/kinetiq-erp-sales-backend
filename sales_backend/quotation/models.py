from django.db import models
from statement.serializers import *


class Quotation(models.Model):
    class Status(models.TextChoices):
        PENDING = "Pending"
        APPROVED = "Approved"
        REJECTED = "Rejected"

    quotation_id = models.BigAutoField(primary_key=True)
    statement = models.ForeignKey(to="statement.Statement", on_delete=models.CASCADE)
    date_issued = models.DateTimeField(auto_now_add=True)
    status = models.TextField(choices=Status, default=Status.PENDING)
