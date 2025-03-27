from django.db import models


class Return(models.Model):
    class Status(models.TextChoices):
        SUCCESS = "Success"
        FAILED = "Failed"
        PENDING = "Pending"

    return_id = models.CharField(primary_key=True, max_length=255)
    statement = models.ForeignKey("Statement", models.CASCADE, blank=True, null=True)
    shipping = models.ForeignKey(
        "ShippingDetails", models.CASCADE, blank=True, null=True
    )
    return_date = models.DateTimeField(blank=True, null=True)
    status = models.TextField(
        choices=Status, default=Status.PENDING
    )  # This field type is a guess.
    remarks = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"sales"."return"'
