# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BillingReceipt(models.Model):
    billing_receipt_id = models.CharField(primary_key=True, max_length=255)
    delivery_receipt_id = models.CharField(max_length=255, blank=True, null=True)
    sales_invoice_id = models.CharField(max_length=255, blank=True, null=True)
    service_billing_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."billing_receipt"'


class Carrier(models.Model):
    carrier_id = models.CharField(primary_key=True, max_length=255)
    carrier_name = models.TextField()
    service_type = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    carrier_count = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."carrier"'


class DeliveryOrder(models.Model):
    delivery_order_id = models.CharField(primary_key=True, max_length=255)
    order_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    content_id = models.CharField(max_length=255, blank=True, null=True)
    is_project_based = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    is_partial_delivery = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    service_order_id = models.CharField(max_length=255, blank=True, null=True)
    production_request_id = models.CharField(max_length=255, blank=True, null=True)
    stock_transfer_id = models.CharField(max_length=255, blank=True, null=True)
    sales_order_id = models.CharField(max_length=255, blank=True, null=True)
    approval_request_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."delivery_order"'


class DeliveryReceipt(models.Model):
    delivery_receipt_id = models.AutoField(primary_key=True)
    delivery_date = models.DateField(blank=True, null=True)
    received_by = models.IntegerField()
    signature = models.TextField()
    receipt_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    shipment_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = '"distribution"."delivery_receipt"'


class FailedShipment(models.Model):
    failed_shipment_id = models.CharField(primary_key=True, max_length=255)
    failure_date = models.DateField(blank=True, null=True)
    failure_reason = models.TextField()
    resolution_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    shipment_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."failed_shipment"'


class GoodsIssue(models.Model):
    goods_issue_id = models.CharField(primary_key=True, max_length=255)
    issue_date = models.DateField(blank=True, null=True)
    issued_by = models.IntegerField()
    billing_receipt_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."goods_issue"'


class LogisticsApprovalRequest(models.Model):
    approval_request_id = models.CharField(primary_key=True, max_length=255)
    request_date = models.DateField(blank=True, null=True)
    approval_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    approval_date = models.DateField(blank=True, null=True)
    approved_by = models.CharField(max_length=255)
    delivery_order_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"distribution"."logistics_approval_request"'


class OperationalCost(models.Model):
    operational_cost_id = models.CharField(primary_key=True, max_length=255)
    additional_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_operational_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    shipping_cost_id = models.CharField(max_length=255, blank=True, null=True)
    packing_cost_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."operational_cost"'


class PackingCost(models.Model):
    packing_cost_id = models.CharField(primary_key=True, max_length=255)
    material_cost = models.DecimalField(max_digits=10, decimal_places=2)
    labor_cost = models.DecimalField(max_digits=10, decimal_places=2)
    total_packing_cost = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = '"distribution"."packing_cost"'


class PackingList(models.Model):
    packing_list_id = models.CharField(primary_key=True, max_length=255)
    packed_by = models.CharField(max_length=255)
    packing_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    packing_type = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    total_items_packed = models.IntegerField(blank=True, null=True)
    packing_cost_id = models.CharField(max_length=255, blank=True, null=True)
    picking_list_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"distribution"."packing_list"'


class PickingList(models.Model):
    picking_list_id = models.CharField(primary_key=True, max_length=255)
    warehouse_id = models.CharField(max_length=255, blank=True, null=True)
    picked_by = models.CharField(max_length=255)
    picked_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    picked_date = models.DateField(blank=True, null=True)
    approval_request_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"distribution"."picking_list"'


class Rejection(models.Model):
    rejection_id = models.CharField(primary_key=True, max_length=255)
    rejection_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    rejection_reason = models.TextField()
    rejection_date = models.DateField(blank=True, null=True)
    delivery_receipt_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"distribution"."rejection"'


class ReworkOrder(models.Model):
    rework_id = models.CharField(primary_key=True, max_length=255)
    assigned_to = models.CharField(max_length=255)
    rework_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    rework_date = models.DateField(blank=True, null=True)
    expected_completion = models.DateTimeField(blank=True, null=True)
    rejection_id = models.CharField(max_length=255, blank=True, null=True)
    failed_shipment_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"distribution"."rework_order"'


class ShipmentDetails(models.Model):
    shipment_id = models.CharField(primary_key=True, max_length=255)
    carrier_id = models.CharField(max_length=255)
    shipment_date = models.DateField(blank=True, null=True)
    shipment_status = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    tracking_number = models.CharField(max_length=100)
    estimated_arrival_date = models.DateTimeField(blank=True, null=True)
    actual_arrival_date = models.DateTimeField(blank=True, null=True)
    failed_shipment_id = models.CharField(max_length=255, blank=True, null=True)
    packing_list_id = models.CharField(max_length=255)
    shipping_cost_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"distribution"."shipment_details"'


class ShippingCost(models.Model):
    shipping_cost_id = models.CharField(primary_key=True, max_length=255)
    packing_list_id = models.CharField(max_length=255, blank=True, null=True)
    cost_per_kg = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    cost_per_km = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    weight_kg = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    distance_km = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_shipping_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"distribution"."shipping_cost"'
