from django.db import models


class BlanketAgreement(models.Model):
    class Status(models.TextChoices):
        ACTIVE = "Active"
        EXPIRED = "Expired"
        CANCELLED = "Cancelled"

    class Method(models.TextChoices):
        WRITTEN = "Written"
        ORAL = "Oral"
        ELECTRONIC = "Electronic"

    agreement_id = models.CharField(primary_key=True, max_length=255, blank=True)
    statement = models.ForeignKey(to="statement.Statement", on_delete=models.CASCADE)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    status = models.TextField(choices=Status)
    description = models.TextField(null=True, blank=True)
    signed_date = models.DateTimeField(null=True, blank=True)
    agreement_method = models.TextField(choices=Method)

    class Meta:
        managed = False
        db_table = '"sales"."blanket_agreement"'
