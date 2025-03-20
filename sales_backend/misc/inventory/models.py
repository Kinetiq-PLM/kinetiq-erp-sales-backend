# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class DeprecationReport(models.Model):
    deprecation_report_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=225)
    content_id = models.CharField(max_length=255)
    quantity = models.IntegerField()
    reported_date = models.DateTimeField()
    status = models.TextField()  # This field type is a guess.
    warehouse_id = models.CharField(max_length=225)
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"inventory"."deprecation_report"'


class InventoryAdjustments(models.Model):
    adjustment_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=255)
    adjustment_type = models.TextField()  # This field type is a guess.
    quantity = models.IntegerField()
    adjustment_date = models.DateTimeField()
    employee_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"inventory"."inventory_adjustments"'


class InventoryCyclicCounts(models.Model):
    inventory_count_id = models.CharField(primary_key=True, max_length=255)
    item_md_id = models.CharField(max_length=255)
    item_onhand = models.IntegerField()
    item_actually_counted = models.IntegerField()
    difference_in_qty = models.IntegerField()
    employee_id = models.CharField(max_length=255)
    status = models.TextField()  # This field type is a guess.
    remarks = models.TextField()
    time_period = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"inventory"."inventory_cyclic_counts"'


class InventoryItem(models.Model):
    inventory_item_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=225)
    content_id = models.IntegerField()
    expiry_date = models.DateField()
    unit_cost = models.DecimalField(max_digits=10, decimal_places=3)
    unit_of_measure = models.CharField(max_length=25)
    item_status = models.TextField()  # This field type is a guess.
    warehouse_id = models.CharField(max_length=225)

    class Meta:
        managed = False
        db_table = '"inventory"."inventory_item"'


class InventoryItemMasterData(models.Model):
    item_md_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=225)
    unit_cost = models.DecimalField(max_digits=10, decimal_places=3)
    minimum_threshold = models.IntegerField()
    maximum_threshold = models.IntegerField()
    total_stock = models.IntegerField()
    stock_on_order = models.IntegerField()
    stock_committed = models.IntegerField()
    available_stock = models.IntegerField()
    last_update = models.DateTimeField()

    class Meta:
        managed = False
        db_table = '"inventory"."inventory_item_master_data"'


class WarehouseMovement(models.Model):
    movement_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=225)
    movement_type = models.TextField()
    quantity = models.IntegerField()
    movement_date = models.DateTimeField()
    destination = models.CharField(max_length=225)
    source = models.CharField(max_length=225)
    reference_id_purchase_order = models.CharField(
        max_length=255, blank=True, null=True
    )
    reference_id_order = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"inventory"."warehouse_movement"'
