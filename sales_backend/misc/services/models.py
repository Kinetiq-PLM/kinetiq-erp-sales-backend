# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AfterAnalysisSched(models.Model):
    analysis_sched_id = models.CharField(primary_key=True, blank=True, max_length=255)
    analysis = models.ForeignKey(
        "ServiceAnalysis", models.DO_NOTHING, blank=True, null=True
    )
    service_date = models.DateField()
    technician = models.ForeignKey(
        "Technician", models.DO_NOTHING, blank=True, null=True
    )
    description = models.TextField(blank=True, null=True)
    service_status = models.TextField()

    class Meta:
        managed = False
        db_table = '"services"."after_analysis_sched"'


class ServiceDeliveryOrder(models.Model):
    delivery_order_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_order_item = models.ForeignKey(
        "ServiceOrderItem", models.DO_NOTHING, blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    customer_address = models.TextField(blank=True, null=True)
    delivery_status = models.TextField()
    delivery_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."delivery_order"'


class ServiceAnalysis(models.Model):
    analysis_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_request = models.ForeignKey(
        "ServiceRequest", models.DO_NOTHING, blank=True, null=True
    )
    analysis_date = models.DateField(blank=True, null=True)
    technician = models.ForeignKey(
        "Technician", models.DO_NOTHING, blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    analysis_status = models.TextField()
    analysis_description = models.TextField(blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    contract_id = models.CharField(max_length=255, blank=True, null=True)
    labor_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"services"."service_analysis"'


class ServiceBilling(models.Model):
    service_billing_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_order_item = models.ForeignKey(
        "ServiceOrderItem", models.DO_NOTHING, blank=True, null=True
    )
    analysis_id = models.CharField(max_length=255, blank=True, null=True)
    service_request = models.ForeignKey(
        "ServiceRequest", models.DO_NOTHING, blank=True, null=True
    )
    charge_type = models.TextField()
    item_name = models.CharField(max_length=255, blank=True, null=True)
    service_billing_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    outsource_fee = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    order_item_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_payable = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    date_paid = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_billing"'


class ServiceCall(models.Model):
    service_call_id = models.CharField(primary_key=True, blank=True, max_length=255)
    date_created = models.DateTimeField(blank=True, null=True)
    service_ticket = models.ForeignKey(
        "ServiceTicket", models.DO_NOTHING, blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    call_type = models.TextField()
    technician = models.ForeignKey(
        "Technician", models.DO_NOTHING, blank=True, null=True
    )
    call_status = models.TextField()
    date_closed = models.DateTimeField(blank=True, null=True)
    contract_no = models.CharField(max_length=255, blank=True, null=True)
    end_date = models.DateField(blank=True, null=True)
    priority_level = models.TextField()
    resolution = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_call"'


class ServiceOrder(models.Model):
    service_order_id = models.CharField(primary_key=True, blank=True, max_length=255)
    analysis = models.ForeignKey(
        ServiceAnalysis, models.DO_NOTHING, blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    order_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_order"'


class ServiceOrderItem(models.Model):
    service_order_item_id = models.CharField(
        primary_key=True, blank=True, max_length=255
    )
    service_order = models.ForeignKey(
        ServiceOrder, models.DO_NOTHING, blank=True, null=True
    )
    principal_item_id = models.CharField(max_length=255, blank=True, null=True)
    item_name = models.CharField(max_length=255, blank=True, null=True)
    item_quantity = models.IntegerField(blank=True, null=True)
    item_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"services"."service_order_item"'


class ServiceReport(models.Model):
    report_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_call = models.ForeignKey(
        ServiceCall, models.DO_NOTHING, blank=True, null=True
    )
    service_ticket = models.ForeignKey(
        "ServiceTicket", models.DO_NOTHING, blank=True, null=True
    )
    service_billing = models.ForeignKey(
        ServiceBilling, models.DO_NOTHING, blank=True, null=True
    )
    technician = models.ForeignKey(
        "Technician", models.DO_NOTHING, blank=True, null=True
    )
    description = models.TextField(blank=True, null=True)
    report_status = models.TextField()
    submission_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_report"'


class ServiceRequest(models.Model):
    service_request_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_call = models.ForeignKey(
        ServiceCall, models.DO_NOTHING, blank=True, null=True
    )
    request_date = models.DateField(blank=True, null=True)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    technician = models.ForeignKey(
        "Technician", models.DO_NOTHING, blank=True, null=True
    )
    request_type = models.TextField()
    request_status = models.TextField()
    request_description = models.TextField(blank=True, null=True)
    request_remarks = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_request"'


class ServiceTicket(models.Model):
    service_ticket_id = models.CharField(primary_key=True, blank=True, max_length=255)
    ticket_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."service_ticket"'


class Technician(models.Model):
    technician_id = models.CharField(primary_key=True, blank=True, max_length=255)
    employee_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"services"."technician"'


class AdditionalService(models.Model):
    class Meta:
        managed = False
        db_table = '"services"."additional_service"'

    additional_service_id = models.CharField(
        primary_key=True, max_length=255, editable=False
    )
    total_fee = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)


class AdditionalServiceType(models.Model):
    class Meta:
        managed = False
        db_table = '"services"."additional_service_type"'

    additional_service_type_id = models.CharField(
        primary_key=True, max_length=255, editable=False
    )
    additional_service = models.ForeignKey(AdditionalService, on_delete=models.CASCADE)
    service_type = models.TextField()
    service_fee = models.DecimalField(max_digits=10, decimal_places=2, null=False)
    duration = models.IntegerField(default=1)
    date_start = models.DateField(auto_now=True)
    status = models.TextField()
    total_service_fee = models.DecimalField(max_digits=10, decimal_places=2, null=False)


class ServiceContract(models.Model):
    class ContractStatusEnum(models.TextChoices):
        PENDING = "Pending"
        ACTIVE = "Active"
        EXPIRED = "Expired"
        TERMINATED = "Terminated"

    class Meta:
        managed = False
        db_table = '"services"."service_contract"'

    contract_id = models.CharField(primary_key=True, max_length=255, editable=False)
    statement_item = models.ForeignKey(
        "statement.StatementItem", on_delete=models.CASCADE
    )
    customer = models.ForeignKey("customer.Customer", on_delete=models.CASCADE)
    product = models.CharField(max_length=255)
    contract_description = models.TextField(blank=True, null=True)
    date_issued = models.DateField(blank=True, null=True)  # alr has a trigger
    end_date = models.DateField(blank=True, null=True)  # alr has a trigger
    contract_status = models.CharField(
        max_length=20,
        choices=ContractStatusEnum.choices,
        default=ContractStatusEnum.PENDING,
    )
    renewal = models.ForeignKey(
        "warranty.RenewalWarranty", on_delete=models.SET_NULL, blank=True, null=True
    )
    additional_service = models.ForeignKey(
        AdditionalService, on_delete=models.SET_NULL, blank=True, null=True
    )
    product_quantity = models.IntegerField(default=1)
    renewal_date = models.DateField(blank=True, null=True)
    renewal_end_date = models.DateField(blank=True, null=True)
