# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Assets(models.Model):
    asset_id = models.CharField(primary_key=True, blank=True, max_length=255)
    item = models.ForeignKey("ItemMasterData", models.DO_NOTHING, blank=True, null=True)
    asset_name = models.CharField(max_length=255)
    purchase_date = models.DateField(blank=True, null=True)
    serial_no = models.CharField(max_length=225, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."assets"'


class AuditLog(models.Model):
    log_id = models.CharField(primary_key=True, blank=True, max_length=255)
    user = models.ForeignKey("Users", models.DO_NOTHING, blank=True, null=True)
    action = models.TextField()
    timestamp = models.DateTimeField(blank=True, null=True)
    ip_address = models.CharField(max_length=255, blank=True, null=True)
    suspicious_activity = models.BooleanField(blank=True, null=True)
    security_measures = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."audit_log"'


class BusinessPartnerMaster(models.Model):
    partner_id = models.CharField(primary_key=True, blank=True, max_length=255)
    employee_id = models.CharField(max_length=255, blank=True, null=True)
    vendor_code = models.ForeignKey(
        "Vendor", models.DO_NOTHING, db_column="vendor_code", blank=True, null=True
    )
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    partner_name = models.CharField(max_length=255)
    category = models.TextField(blank=True, null=True)  # This field type is a guess.
    contact_info = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."business_partner_master"'


class ItemMasterData(models.Model):
    item_id = models.CharField(primary_key=True, blank=True, max_length=255)
    item_type = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."item_master_data"'


class Policies(models.Model):
    policy_id = models.CharField(primary_key=True, blank=True, max_length=255)
    policy_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    effective_date = models.DateField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."policies"'


class Products(models.Model):
    product_id = models.CharField(primary_key=True, blank=True, max_length=255)
    item = models.ForeignKey(ItemMasterData, models.DO_NOTHING, blank=True, null=True)
    product_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    selling_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    stock_level = models.IntegerField(blank=True, null=True)
    warranty_period = models.IntegerField(blank=True, null=True)
    policy = models.ForeignKey(Policies, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."products"'


class RawMaterials(models.Model):
    material_id = models.CharField(primary_key=True, blank=True, max_length=255)
    item = models.ForeignKey(ItemMasterData, models.DO_NOTHING, blank=True, null=True)
    material_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    unit_of_measure = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    cost_per_unit = models.DecimalField(
        max_digits=65535, decimal_places=65535, blank=True, null=True
    )

    class Meta:
        managed = False
        db_table = '"admin"."raw_materials"'


class RolesPermission(models.Model):
    role_id = models.CharField(primary_key=True, blank=True, max_length=255)
    role_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    permissions = models.TextField(blank=True, null=True)
    access_level = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."roles_permission"'


class Users(models.Model):
    user_id = models.CharField(primary_key=True, blank=True, max_length=255)
    employee_id = models.CharField(max_length=255, blank=True, null=True)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=255)
    password = models.CharField(max_length=255)
    role = models.ForeignKey(RolesPermission, models.DO_NOTHING, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    type = models.TextField(blank=True, null=True)  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."users"'


class Vendor(models.Model):
    vendor_code = models.CharField(primary_key=True, blank=True, max_length=255)
    application_reference = models.CharField(max_length=255, blank=True, null=True)
    vendor_name = models.CharField(max_length=255)
    contact_person = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."vendor"'


class Warehouse(models.Model):
    warehouse_id = models.CharField(primary_key=True, blank=True, max_length=255)
    warehouse_location = models.CharField(max_length=255)
    stored_materials = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."warehouse"'
