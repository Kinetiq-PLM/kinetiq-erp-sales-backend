# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ContractualWorkerRequest(models.Model):
    request_id = models.CharField(primary_key=True, max_length=255)
    intrnl_project_id = models.CharField(max_length=255)
    dept_id = models.CharField(max_length=255)
    job_title = models.CharField(max_length=50)
    job_description = models.TextField(blank=True, null=True)
    required_position = models.CharField(max_length=50)
    employment_type = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"project_management"."contractual_worker_request"'


class ExternalProjectCostManagement(models.Model):
    project_resources_id = models.CharField(primary_key=True, max_length=255)
    project_id = models.CharField(max_length=255)
    cost_id = models.CharField(max_length=255)
    project_budget_approval = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_cost_management"'


class ExternalProjectDetails(models.Model):
    project_id = models.CharField(primary_key=True, max_length=255)
    ext_project_request_id = models.CharField(max_length=255)
    project_status = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_details"'


class ExternalProjectLabor(models.Model):
    project_labor_id = models.CharField(primary_key=True, max_length=255)
    project_id = models.CharField(max_length=255)
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_labor"'


class ExternalProjectRequest(models.Model):
    ext_project_request_id = models.CharField(primary_key=True, max_length=255)
    ext_project_name = models.CharField(max_length=50)
    ext_project_description = models.TextField(blank=True, null=True)
    approval_id = models.CharField(max_length=255)
    item_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_request"'


class ExternalProjectTaskList(models.Model):
    task_id = models.CharField(primary_key=True, max_length=255)
    project_id = models.CharField(max_length=255)
    task_description = models.TextField(blank=True, null=True)
    task_status = models.TextField()  # This field type is a guess.
    task_deadline = models.DateField()
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_task_list"'


class ExternalProjectTracking(models.Model):
    project_tracking_id = models.CharField(primary_key=True, max_length=255)
    project_id = models.CharField(max_length=255)
    project_milestone = models.TextField()  # This field type is a guess.
    start_date = models.DateField()
    estimated_end_date = models.DateField()
    project_warranty_id = models.CharField(max_length=255)
    project_issue = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_tracking"'


class ExternalProjectWarranty(models.Model):
    project_warranty_id = models.CharField(primary_key=True, max_length=255)
    project_id = models.CharField(max_length=255)
    warranty_coverage_yr = models.IntegerField()
    warranty_start_date = models.DateField()
    warranty_end_date = models.DateField()

    class Meta:
        managed = False
        db_table = '"project_management"."external_project_warranty"'


class InternalProjectDetails(models.Model):
    intrnl_project_id = models.CharField(primary_key=True, max_length=255)
    project_request_id = models.CharField(max_length=255)
    intrnl_project_status = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"project_management"."internal_project_details"'


class InternalProjectLabor(models.Model):
    intrnl_project_labor_id = models.CharField(primary_key=True, max_length=255)
    intrnl_project_id = models.CharField(max_length=255)
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"project_management"."internal_project_labor"'


class InternalProjectRequest(models.Model):
    project_request_id = models.CharField(primary_key=True, max_length=255)
    project_name = models.CharField(max_length=50)
    project_description = models.TextField(blank=True, null=True)
    request_date = models.DateField()
    request_valid_date = models.DateField()
    request_starting_date = models.DateField()
    approval_id = models.CharField(max_length=255)
    employee_id = models.CharField(max_length=255)
    dept_id = models.CharField(max_length=255)
    project_type = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"project_management"."internal_project_request"'


class InternalProjectTaskList(models.Model):
    intrnl_task_id = models.CharField(primary_key=True, max_length=255)
    intrnl_project_id = models.CharField(max_length=255)
    intrnl_task_description = models.TextField(blank=True, null=True)
    intrnl_task_status = models.TextField()  # This field type is a guess.
    intrnl_task_deadline = models.DateField()
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"project_management"."internal_project_task_list"'


class InternalProjectTracking(models.Model):
    intrnl_project_tracking_id = models.CharField(primary_key=True, max_length=255)
    intrnl_project_id = models.CharField(max_length=255)
    intrnl_start_date = models.DateField()
    intrnl_estimated_end_date = models.DateField()
    intrnl_project_issue = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"project_management"."internal_project_tracking"'
