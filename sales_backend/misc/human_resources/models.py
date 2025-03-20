# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AttendanceTracking(models.Model):
    attendance_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255)
    time_in = models.DateTimeField()
    time_out = models.DateTimeField()
    work_hours = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    status = models.CharField(max_length=20)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.attendance_tracking"


class Candidates(models.Model):
    candidate_id = models.CharField(primary_key=True, max_length=255)
    job_id = models.CharField(max_length=255)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(unique=True, max_length=100)
    phone = models.CharField(max_length=20, blank=True, null=True)
    resume = models.TextField(blank=True, null=True)
    employment_type = models.CharField(max_length=20)
    contract_duration = models.SmallIntegerField(blank=True, null=True)
    status = models.CharField(max_length=20, blank=True, null=True)
    date_applied = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.candidates"


class Departments(models.Model):
    dept_id = models.CharField(primary_key=True, max_length=255)
    dept_name = models.CharField(unique=True, max_length=100)

    class Meta:
        managed = False
        db_table = "human_resources.departments"


class EmployeePerformance(models.Model):
    performance_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255)
    immediate_superior_id = models.CharField(max_length=255)
    rating = models.IntegerField()
    review_date = models.DateField(blank=True, null=True)
    comments = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.employee_performance"


class EmployeeSalary(models.Model):
    salary_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255)
    base_salary = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    contract_pay_type = models.CharField(max_length=20, blank=True, null=True)
    contract_pay_rate = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_hours_worked = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_contract_pay = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    effective_date = models.DateField()

    class Meta:
        managed = False
        db_table = "human_resources.employee_salary"


class Employees(models.Model):
    employee_id = models.CharField(primary_key=True, max_length=255)
    dept_id = models.CharField(max_length=255)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(unique=True, max_length=100)
    phone = models.CharField(max_length=20, blank=True, null=True)
    job_title = models.CharField(max_length=100, blank=True, null=True)
    employment_type = models.CharField(max_length=20)
    status = models.CharField(max_length=20)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.employees"


class Interviews(models.Model):
    interview_id = models.CharField(primary_key=True, max_length=255)
    candidate_id = models.CharField(max_length=255)
    interviewer_id = models.CharField(max_length=255)
    interview_date = models.DateTimeField()
    status = models.CharField(max_length=20, blank=True, null=True)
    feedback = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.interviews"


class JobPosting(models.Model):
    job_id = models.CharField(primary_key=True, max_length=255)
    request_id = models.CharField(max_length=255, blank=True, null=True)
    dept_id = models.CharField(max_length=255)
    position = models.CharField(max_length=100)
    description = models.TextField()
    requirements = models.TextField()
    employment_type = models.CharField(max_length=20)
    contract_duration = models.SmallIntegerField(blank=True, null=True)
    contract_rate = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    contract_pay_type = models.CharField(max_length=20, blank=True, null=True)
    status = models.CharField(max_length=20, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.job_posting"


class LeaveRequests(models.Model):
    leave_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255)
    dept_id = models.CharField(max_length=255)
    immediate_superior_id = models.CharField(max_length=255)
    management_approval_id = models.CharField(max_length=255, blank=True, null=True)
    leave_type = models.CharField(max_length=20)
    start_date = models.DateField()
    end_date = models.DateField()
    total_days = models.IntegerField(blank=True, null=True)
    is_paid = models.BooleanField()
    status = models.CharField(max_length=50, blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.leave_requests"


class Payroll(models.Model):
    payroll_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255)
    employment_type = models.CharField(max_length=20)
    base_salary = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    work_days = models.IntegerField(blank=True, null=True)
    contract_pay_type = models.CharField(max_length=20, blank=True, null=True)
    contract_pay_rate = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_hours_worked = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_contract_pay = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    payment_date = models.DateField()
    payment_status = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.payroll"


class WorkforceAllocation(models.Model):
    allocation_id = models.CharField(primary_key=True, max_length=255)
    requesting_dept_id = models.CharField(max_length=255)
    employee_id = models.CharField(max_length=255)
    current_dept_id = models.CharField(max_length=255)
    reason = models.TextField()
    approval_status = models.CharField(max_length=20, blank=True, null=True)
    status = models.CharField(max_length=20, blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    approval_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "human_resources.workforce_allocation"
