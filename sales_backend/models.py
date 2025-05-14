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
    project_id = models.CharField(max_length=255, blank=True, null=True)
    product_mats = models.ForeignKey('ProductMats', models.DO_NOTHING, blank=True, null=True)
    overall_quantity_of_material = models.IntegerField(blank=True, null=True)
    cost_per_raw_material = models.DecimalField(max_digits=10, decimal_places=2)
    total_cost_of_raw_materials = models.DecimalField(max_digits=10, decimal_places=2)
    production_order_detail_id = models.CharField(max_length=255, blank=True, null=True)
    labor_cost = models.ForeignKey('LaborCost', models.DO_NOTHING, blank=True, null=True)
    total_cost = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bill_of_materials'


class LaborCost(models.Model):
    labor_cost_id = models.CharField(primary_key=True, max_length=255)
    labor_id = models.CharField(max_length=255, blank=True, null=True)
    salary_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'labor_cost'


class NonProjectOrderPricing(models.Model):
    non_project_costing_id = models.CharField(primary_key=True, max_length=255)
    final_price = models.DecimalField(max_digits=10, decimal_places=2)
    statement_item_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'non_project_order_pricing'


class Pricing(models.Model):
    price_id = models.CharField(primary_key=True, max_length=255)
    item_id = models.CharField(max_length=255, blank=True, null=True)
    item_price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pricing'


class PrincipalItems(models.Model):
    principal_item_id = models.CharField(primary_key=True, max_length=255)
    service_order_item_id = models.CharField(max_length=255, blank=True, null=True)
    item_id = models.CharField(max_length=255, blank=True, null=True)
    mark_up_price = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'principal_items'


class ProductMats(models.Model):
    product_mats_id = models.CharField(primary_key=True, max_length=255)
    quantity_required = models.DecimalField(max_digits=10, decimal_places=2)
    cost_of_used_materials = models.DecimalField(max_digits=10, decimal_places=2)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    material_id = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product_mats'


class TrackingNpop(models.Model):
    tracking_npop_id = models.CharField(primary_key=True, max_length=255)
    order_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tracking_npop'


class TrackingPrincipal(models.Model):
    tracking_principal_id = models.CharField(primary_key=True, max_length=255)
    service_order_item_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tracking_principal'
