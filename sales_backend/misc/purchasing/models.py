# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BatchInspection(models.Model):
    inspection_id = models.CharField(primary_key=True, max_length=255)
    shipment_id = models.CharField(max_length=255, blank=True, null=True)
    inspection_date = models.DateField(blank=True, null=True)
    employee_id = models.CharField(max_length=255, blank=True, null=True)
    inspection_result = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    remarks = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"purchasing"."batch_inspection"'


class CreditMemo(models.Model):
    credit_memo_id = models.CharField(primary_key=True, max_length=255)
    inspection_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    document_no = models.IntegerField(blank=True, null=True)
    document_date = models.DateField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    due_date = models.DateField(blank=True, null=True)
    total_credit = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    credit_balance = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    dpm_rate = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    dpm_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    applied_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    balance_due = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"purchasing"."credit_memo"'


class PurchaseInvoice(models.Model):
    invoice_id = models.CharField(primary_key=True, max_length=255)
    purchase_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    document_no = models.IntegerField(blank=True, null=True)
    document_date = models.DateField(blank=True, null=True)
    due_date = models.DateField(blank=True, null=True)
    total_credit = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    credit_balance = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    dpm_rate = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    dpm_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    applied_amount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    balance_due = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"purchasing"."purchase_invoice"'


class PurchaseOrder(models.Model):
    purchase_id = models.CharField(primary_key=True, max_length=255)
    quotation_id = models.CharField(max_length=255, blank=True, null=True)
    order_date = models.DateField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    document_date = models.DateField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"purchasing"."purchase_order"'


class PurchaseQuotation(models.Model):
    quotation_id = models.CharField(primary_key=True, max_length=255)
    vendor_code = models.CharField(max_length=255, blank=True, null=True)
    quotation_content_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    document_no = models.IntegerField(blank=True, null=True)
    valid_date = models.DateField(blank=True, null=True)
    document_date = models.DateField(blank=True, null=True)
    required_date = models.DateField(blank=True, null=True)
    total_before_discount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    discount_percent = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    freight = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    tax = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    total_payment = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"purchasing"."purchase_quotation"'


class PurchaseRequests(models.Model):
    request_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(max_length=255, blank=True, null=True)
    approval_id = models.CharField(max_length=255, blank=True, null=True)
    material_id = models.CharField(max_length=255, blank=True, null=True)
    purchase_item = models.CharField(max_length=255, blank=True, null=True)
    purchase_description = models.TextField(blank=True, null=True)
    purchase_quantity = models.IntegerField(blank=True, null=True)
    valid_date = models.DateField(blank=True, null=True)
    document_date = models.DateField(blank=True, null=True)
    required_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"purchasing"."purchase_requests"'


class QuotationContents(models.Model):
    quotation_content_id = models.CharField(primary_key=True, max_length=255)
    request_id = models.CharField(max_length=255, blank=True, null=True)
    unit_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    discount = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    tax_code = models.CharField(max_length=50, blank=True, null=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"purchasing"."quotation_contents"'


class ReceivedShipments(models.Model):
    shipment_id = models.CharField(primary_key=True, max_length=255)
    purchase_id = models.CharField(max_length=255, blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"purchasing"."received_shipments"'


class VendorApplication(models.Model):
    application_reference = models.CharField(primary_key=True, max_length=255)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    company_name = models.CharField(blank=True, null=True)
    tax_number = models.IntegerField(blank=True, null=True)
    contact_person = models.CharField(blank=True, null=True)
    title = models.CharField(blank=True, null=True)
    vendor_address = models.CharField(blank=True, null=True)
    phone = models.BigIntegerField(blank=True, null=True)
    fax = models.BigIntegerField(blank=True, null=True)
    vendor_email = models.CharField(blank=True, null=True)
    tax_exempt = models.BooleanField(blank=True, null=True)
    vendor_website = models.CharField(blank=True, null=True)
    organization_type = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    separate_checks = models.BooleanField(blank=True, null=True)
    purchasing_card = models.BooleanField(blank=True, null=True)
    account_no = models.BigIntegerField(blank=True, null=True)
    routing_no = models.IntegerField(blank=True, null=True)
    requestor = models.CharField(blank=True, null=True)
    date_requested = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"purchasing"."vendor_application"'
