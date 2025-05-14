# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BudgetAllocation(models.Model):
    budget_allocation_id = models.CharField(primary_key=True, max_length=255)
    budget_approvals = models.ForeignKey(
        "BudgetApprovals", models.DO_NOTHING, blank=True, null=True
    )
    total_budget = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    total_spent = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    total_remaining_budget = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    allocated_budget = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    total_allocated_spent = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    allocated_remaining_budget = models.DecimalField(
        max_digits=15, decimal_places=2, blank=True, null=True
    )
    status = models.CharField(max_length=20, blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField()

    class Meta:
        managed = False
        db_table = '"finance"."budget_allocation"'


class BudgetApprovals(models.Model):
    budget_approvals_id = models.CharField(primary_key=True, max_length=255)
    validation = models.ForeignKey(
        "BudgetValidations", models.DO_NOTHING, blank=True, null=True
    )
    amount_requested = models.DecimalField(max_digits=15, decimal_places=2)
    validated_amount = models.DecimalField(max_digits=15, decimal_places=2)
    validated_by = models.CharField(max_length=255)
    approved_by = models.CharField(max_length=255)
    approval_date = models.DateField()
    remarks = models.CharField(max_length=20, blank=True, null=True)
    approval_status = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"finance"."budget_approvals"'


class BudgetRequestForm(models.Model):
    budget_request_id = models.CharField(primary_key=True, max_length=255)
    dept_id = models.CharField(max_length=255, blank=True, null=True)
    amount_requested = models.DecimalField(max_digits=15, decimal_places=2)
    requestor_name = models.CharField(max_length=100)
    requested_date = models.DateField()
    expected_start_usage_period = models.DateField()
    expected_end_usage_period = models.DateField()
    urgency_level_request = models.CharField(max_length=20)
    reason_for_request = models.TextField()
    expense_breakdown_period = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"finance"."budget_request_form"'


class BudgetReturnsForm(models.Model):
    budget_return_id = models.CharField(primary_key=True, max_length=255)
    dept_id = models.CharField(max_length=255, blank=True, null=True)
    budget_request = models.ForeignKey(
        BudgetRequestForm, models.DO_NOTHING, blank=True, null=True
    )
    returner_name = models.CharField(max_length=255)
    return_date = models.DateField()
    returned_amount = models.DecimalField(max_digits=15, decimal_places=2)
    total_amount_requested = models.DecimalField(max_digits=15, decimal_places=2)
    reason_returned = models.CharField(max_length=50)
    expense_history_breakdown = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"finance"."budget_returns_form"'


class BudgetSubmission(models.Model):
    budget_submission_id = models.CharField(primary_key=True, max_length=255)
    dept_id = models.CharField(max_length=255, blank=True, null=True)
    submitter_name = models.CharField(max_length=255)
    date_submitted = models.DateField()
    proposed_total_budget = models.DecimalField(max_digits=12, decimal_places=2)
    start_usage_period = models.DateField()
    end_usage_period = models.DateField()
    expense_breakdown = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"finance"."budget_submission"'


class BudgetValidations(models.Model):
    validation_id = models.CharField(primary_key=True, max_length=255)
    budget_submission = models.ForeignKey(
        BudgetSubmission, models.DO_NOTHING, blank=True, null=True
    )
    budget_request = models.ForeignKey(
        BudgetRequestForm, models.DO_NOTHING, blank=True, null=True
    )
    budget_return = models.ForeignKey(
        BudgetReturnsForm, models.DO_NOTHING, blank=True, null=True
    )
    validation_date = models.DateField(blank=True, null=True)
    validated_by = models.CharField(max_length=255, blank=True, null=True)
    validation_status = models.CharField(max_length=10, blank=True, null=True)
    remarks = models.CharField(max_length=20, blank=True, null=True)
    comments = models.CharField(max_length=100, blank=True, null=True)
    amount_requested = models.DecimalField(max_digits=15, decimal_places=2)
    final_approved_amount = models.DecimalField(
        max_digits=12, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"finance"."budget_validations"'
