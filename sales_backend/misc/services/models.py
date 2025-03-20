# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AfterAnalysisSched(models.Model):
    analysis_sched_id = models.CharField(primary_key=True, max_length=255)
    service_request_id = models.CharField(max_length=255)
    service_date = models.DateField(blank=True, null=True)
    technician_id = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    service_status = models.TextField()

    class Meta:
        managed = False
        db_table = "services.after_analysis_sched"


class ChatMessage(models.Model):
    message_id = models.CharField(primary_key=True, max_length=255)
    session_id = models.CharField(max_length=255)
    sender_id = models.CharField(max_length=255)
    sender_role = models.TextField()
    message_text = models.TextField()
    timestamp = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.chat_message"


class CommSession(models.Model):
    session_id = models.CharField(primary_key=True, max_length=255)
    technician_id = models.CharField(max_length=255)
    customer_id = models.CharField(max_length=255)
    session_type = models.TextField()
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    status = models.TextField()

    class Meta:
        managed = False
        db_table = "services.comm_session"


class DeliveryOrder(models.Model):
    delivery_order_id = models.CharField(primary_key=True, max_length=255)
    service_purchase_id = models.CharField(max_length=255, blank=True, null=True)
    service_order_id = models.CharField(max_length=255, blank=True, null=True)
    service_billing_id = models.CharField(max_length=255, blank=True, null=True)
    customer_id = models.CharField(max_length=255)
    customer_address = models.TextField(blank=True, null=True)
    delivery_status = models.TextField()
    service_billing_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    delivery_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.delivery_order"


class RenewalHistory(models.Model):
    renewal_id = models.CharField(primary_key=True, max_length=255)
    contract_id = models.CharField(max_length=255)
    customer_id = models.CharField(max_length=255)
    previous_start_date = models.DateField(blank=True, null=True)
    previous_end_date = models.DateField(blank=True, null=True)
    renewal_date = models.DateField(blank=True, null=True)
    date_renewed = models.DateField(blank=True, null=True)
    new_end_date = models.DateField(blank=True, null=True)
    status = models.TextField()

    class Meta:
        managed = False
        db_table = "services.renewal_history"


class ServiceAnalysis(models.Model):
    analysis_id = models.CharField(primary_key=True, max_length=255)
    service_request_id = models.CharField(max_length=255)
    analysis_date = models.DateField(blank=True, null=True)
    technician_id = models.CharField(max_length=255)
    customer_id = models.CharField(max_length=255)
    analysis_description = models.TextField(blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_analysis"


class ServiceBilling(models.Model):
    service_billing_id = models.CharField(primary_key=True, max_length=255)
    service_purchase_id = models.CharField(max_length=255, blank=True, null=True)
    service_order_id = models.CharField(max_length=255, blank=True, null=True)
    service_request_id = models.CharField(max_length=255)
    charge_type = models.TextField()
    product_id = models.CharField(max_length=255, blank=True, null=True)
    warranty_status = models.TextField()
    service_billing_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    billing_status = models.TextField()
    date_paid = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_billing"


class ServiceCall(models.Model):
    service_call_id = models.CharField(primary_key=True, max_length=255)
    date_created = models.DateTimeField(blank=True, null=True)
    customer_id = models.CharField(max_length=255)
    customer_name = models.CharField(max_length=255, blank=True, null=True)
    queue = models.AutoField()
    call_type = models.TextField()
    technician_id = models.CharField(max_length=255)
    call_status = models.TextField()
    date_closed = models.DateTimeField(blank=True, null=True)
    origin = models.TextField()
    contract_id = models.CharField(max_length=255)
    end_date = models.DateField(blank=True, null=True)
    priority_level = models.TextField()
    resolution = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_call"


class ServiceCallHistory(models.Model):
    service_call_id = models.CharField(primary_key=True, max_length=255)
    date_update = models.DateField()
    time_update = models.DateTimeField(blank=True, null=True)
    status = models.TextField()
    description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_call_history"


class ServiceContract(models.Model):
    contract_id = models.CharField(primary_key=True, max_length=255)
    customer_id = models.CharField(max_length=255)
    contract_description = models.TextField(blank=True, null=True)
    start_date = models.DateField(blank=True, null=True)
    end_date = models.DateField(blank=True, null=True)
    termination_date = models.DateField(blank=True, null=True)
    service_type = models.TextField()
    contract_type = models.TextField()
    product_id = models.CharField(max_length=255)
    contract_status = models.TextField()
    active_items = models.IntegerField(blank=True, null=True)
    remarks = models.TextField(blank=True, null=True)
    renewal = models.BooleanField(blank=True, null=True)
    date_renewed = models.DateField(blank=True, null=True)
    date_last_renewed = models.DateField(blank=True, null=True)
    approval_remarks = models.TextField(blank=True, null=True)
    approval_date = models.DateField(blank=True, null=True)
    approved_by = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_contract"


class ServiceCost(models.Model):
    service_cost_id = models.CharField(primary_key=True, max_length=255)
    analysis_id = models.CharField(max_length=255)
    service_billing_id = models.CharField(max_length=255)
    cost_type = models.TextField()
    outsource_fee = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    cost_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "services.service_cost"


class ServiceOrder(models.Model):
    service_order_id = models.CharField(primary_key=True, max_length=255)
    analysis_id = models.CharField(max_length=255)
    customer_id = models.CharField(max_length=255)
    item_id = models.CharField(max_length=255)
    item_name = models.CharField(max_length=255, blank=True, null=True)
    item_availability = models.TextField()
    item_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = "services.service_order"


class ServicePurchase(models.Model):
    service_purchase_id = models.CharField(primary_key=True, max_length=255)
    service_order_id = models.CharField(max_length=255)
    principal_item_id = models.CharField(max_length=255, blank=True, null=True)
    item_id = models.CharField(max_length=255)
    item_name = models.CharField(max_length=255, blank=True, null=True)
    request_date = models.DateField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    markup_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_purchase"


class ServiceReport(models.Model):
    report_id = models.CharField(primary_key=True, max_length=255)
    service_call_id = models.CharField(max_length=255)
    service_billing_id = models.CharField(max_length=255)
    technician_id = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    report_status = models.TextField()
    submission_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_report"


class ServiceRequest(models.Model):
    service_request_id = models.CharField(primary_key=True, max_length=255)
    service_call_id = models.CharField(max_length=255)
    request_date = models.DateField(blank=True, null=True)
    customer_id = models.CharField(max_length=255)
    technician_id = models.CharField(max_length=255)
    request_type = models.TextField()
    request_status = models.TextField()
    contract_type = models.TextField()
    request_description = models.TextField(blank=True, null=True)
    request_remarks = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = "services.service_request"


class ServiceTicket(models.Model):
    service_ticket_id = models.CharField(primary_key=True, max_length=255)

    class Meta:
        managed = False
        db_table = "services.service_ticket"


class Technician(models.Model):
    technician_id = models.CharField(primary_key=True, max_length=255)

    class Meta:
        managed = False
        db_table = "services.technician"
