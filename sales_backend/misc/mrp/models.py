# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BillOfMaterials(models.Model):
    bom_id = models.CharField(primary_key=True, blank=True, max_length=255)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    material_id = models.CharField(max_length=255, blank=True, null=True)
    product_description = models.TextField()
    unit_of_measure = models.CharField(max_length=255)
    specific_notes = models.TextField(blank=True, null=True)
    quantity_of_unit = models.IntegerField()
    cost_per_raw_material = models.DecimalField(max_digits=10, decimal_places=2)
    total_cost_of_raw_materials = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = '"mrp"."bill_of_materials"'


class NonProjectOrderPricing(models.Model):
    non_project_costing_id = models.CharField(
        primary_key=True, blank=True, max_length=255
    )
    order_id = models.CharField(max_length=255, blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.IntegerField()
    mrp_base_price = models.DecimalField(max_digits=10, decimal_places=2)
    final_price = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = '"mrp"."non_project_order_pricing"'


class OverallProduction(models.Model):
    cost_id = models.CharField(primary_key=True, blank=True, max_length=255)
    production_order_detail_id = models.CharField(max_length=255, blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    bom = models.ForeignKey(BillOfMaterials, models.DO_NOTHING, blank=True, null=True)
    cost_of_raw_materials = models.DecimalField(max_digits=10, decimal_places=2)
    labor_cost = models.DecimalField(max_digits=10, decimal_places=2)
    total_mrp_cost = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = '"mrp"."overall_production"'


class PrincipalItems(models.Model):
    principal_item_id = models.CharField(primary_key=True, blank=True, max_length=255)
    service_request_id = models.CharField(max_length=255, blank=True, null=True)
    service_order_id = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.IntegerField()
    item_id = models.CharField(max_length=255, blank=True, null=True)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2)
    markup_price = models.DecimalField(max_digits=10, decimal_places=2)
    pricing_date = models.DateField()

    class Meta:
        managed = False
        db_table = '"mrp"."principal_items"'
