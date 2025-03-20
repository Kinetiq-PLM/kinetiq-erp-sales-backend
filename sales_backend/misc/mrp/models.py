# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BillOfMaterials(models.Model):
    bom_id = models.CharField(primary_key=True, max_length=255)
    product_description = models.TextField(blank=True, null=True)
    unit_of_measure = models.CharField(max_length=255, blank=True, null=True)
    specific_notes = models.TextField(blank=True, null=True)
    quantity_of_unit = models.IntegerField(blank=True, null=True)
    cost_per_raw_material = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_cost_of_raw_materials = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"mrp"."bill_of_materials"'


class NonProjectOrderPricing(models.Model):
    non_project_costing_id = models.CharField(primary_key=True, max_length=255)
    quantity = models.IntegerField(blank=True, null=True)
    mrp_base_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    final_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"mrp"."non_project_order_pricing"'


class OverallProduction(models.Model):
    cost_id = models.CharField(primary_key=True, max_length=255)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    bom_id = models.CharField(max_length=255, blank=True, null=True)
    cost_of_raw_materials = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    cost_of_production = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    labor_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    total_mrp_cost = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"mrp"."overall_production"'


class PrincipalItems(models.Model):
    principal_item_id = models.CharField(primary_key=True, max_length=255)
    service_request_id = models.CharField(max_length=255, blank=True, null=True)
    service_order_id = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    item_id = models.CharField(max_length=255, blank=True, null=True)
    unit_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    markup_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    pricing_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"mrp"."principal_items"'
