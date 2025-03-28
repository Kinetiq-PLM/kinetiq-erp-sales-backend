# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ManagementApprovals(models.Model):
    approval_id = models.CharField(primary_key=True, max_length=255)
    request_id = models.CharField(max_length=255)
    external_id = models.CharField(max_length=255)
    decision_date = models.DateField()
    issue_date = models.DateField()
    checked_by = models.CharField(max_length=255)
    checked_date = models.DateField()
    status = models.TextField()  # This field type is a guess.
    due_date = models.DateField()
    remarks = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"management"."management_approvals"'
