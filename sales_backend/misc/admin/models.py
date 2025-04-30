# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuditLog(models.Model):
    log_id = models.CharField(primary_key=True, max_length=255)
    user = models.ForeignKey("Users", models.DO_NOTHING, blank=True, null=True)
    action = models.TextField()
    timestamp = models.DateTimeField(blank=True, null=True)
    ip_address = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."audit_log"'


class BusinessPartnerMaster(models.Model):
    partner_id = models.CharField(primary_key=True, max_length=255)
    partner_name = models.CharField(max_length=255)
    category = models.TextField(blank=True, null=True)  # This field type is a guess.
    contact_info = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."business_partner_master"'


class Currency(models.Model):
    currency_id = models.CharField(primary_key=True, max_length=255)
    currency_name = models.CharField(max_length=255)
    exchange_rate = models.DecimalField(max_digits=15, decimal_places=6)
    is_active = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."currency"'


class ItemMasterData(models.Model):
    item_id = models.CharField(primary_key=True, max_length=255)
    item_name = models.CharField(max_length=255)
    item_type = models.TextField(blank=True, null=True)  # This field type is a guess.
    unit_of_measure = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    item_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    manage_item_by = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    preferred_vendor = models.CharField(max_length=255, blank=True, null=True)
    purchasing_uom = models.TextField(
        blank=True, null=True
    )  # This field type is a guess.
    items_per_purchase_unit = models.IntegerField(blank=True, null=True)
    purchase_quantity_per_package = models.IntegerField(blank=True, null=True)
    sales_uom = models.TextField(blank=True, null=True)  # This field type is a guess.
    items_per_sale_unit = models.IntegerField(blank=True, null=True)
    sales_quantity_per_package = models.IntegerField(blank=True, null=True)
    item_description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."item_master_data"'


class Notifications(models.Model):
    notifications_id = models.CharField(primary_key=True, max_length=255)
    module = models.CharField()
    to_user = models.ForeignKey("Users", models.DO_NOTHING, blank=True, null=True)
    message = models.TextField()
    notifications_status = models.TextField()  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."notifications"'


class Policies(models.Model):
    policy_id = models.CharField(primary_key=True, max_length=255)
    policy_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    effective_date = models.DateField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."policies"'


class RolesPermission(models.Model):
    role_id = models.CharField(primary_key=True, max_length=255)
    role_name = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    permissions = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."roles_permission"'


class Users(models.Model):
    user_id = models.CharField(primary_key=True, max_length=255)
    employee_id = models.CharField(unique=True, max_length=255, blank=True, null=True)
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
    vendor_code = models.CharField(primary_key=True, max_length=255)
    application_reference = models.CharField(max_length=255, blank=True, null=True)
    vendor_name = models.CharField(max_length=255)
    contact_person = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = '"admin"."vendor"'


class Warehouse(models.Model):
    warehouse_id = models.CharField(primary_key=True, max_length=255)
    warehouse_location = models.CharField(max_length=255)
    warehouse_name = models.CharField(max_length=50, blank=True, null=True)
    warehouse_manager = models.CharField(max_length=255, blank=True, null=True)
    contact_no = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"admin"."warehouse"'
