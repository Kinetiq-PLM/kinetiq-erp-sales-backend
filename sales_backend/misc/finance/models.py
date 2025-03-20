# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BudgetApprovals(models.Model):
    validation_id = models.CharField(primary_key=True, max_length=255)
    downpayments = models.DecimalField(
        max_digits=12, decimal_places=2, blank=True, null=True
    )
    approval_status = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = "finance.budget_approvals"


class BudgetValidations(models.Model):
    validation_id = models.CharField(primary_key=True, max_length=255)
    dept_id = models.CharField(max_length=255)
    validation_date = models.DateField()
    validated_by = models.CharField(max_length=255)
    validation_status = models.CharField(max_length=10)
    remarks = models.CharField(max_length=20)
    amount_requested = models.DecimalField(max_digits=12, decimal_places=2)
    final_approved_amount = models.DecimalField(
        max_digits=12, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "finance.budget_validations"
