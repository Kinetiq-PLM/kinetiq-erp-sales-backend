from django.db import models
from datetime import datetime


class Employee(models.Model):
    employee_id = models.BigAutoField(primary_key=True)
    first_name = models.TextField(max_length=255)
    last_name = models.TextField(max_length=255)
    email = models.TextField(max_length=255)
    phone = models.TextField(max_length=255)
    job_title = models.TextField(max_length=255)


class Policies(models.Model):
    policy_id = models.BigAutoField(primary_key=True)
    policy_name = models.TextField(max_length=255)
    description = models.TextField(max_length=255)
    effective_date = models.DateTimeField(default=datetime.now())


class Product(models.Model):
    product_id = models.BigAutoField(primary_key=True)
    product_name = models.TextField(max_length=255)
    description = models.TextField(max_length=255)
    unit_of_measure = models.TextField(max_length=255, default="kg")
    policy_id = models.ForeignKey(to=Policies, on_delete=models.CASCADE)
    stock = models.IntegerField(default=10)


class ChartOfAccounts(models.Model):
    account_code = models.BigAutoField(primary_key=True)
    account_name = models.TextField(max_length=255)


class GeneralLedgerAccounts(models.Model):
    gl_account_id = models.BigAutoField(primary_key=True)
    account_name = models.TextField(max_length=255)
    account_code = models.ForeignKey(to=ChartOfAccounts, on_delete=models.CASCADE)
    debit = models.DecimalField(max_digits=10, decimal_places=2, default=5000)
    credit = models.DecimalField(max_digits=10, decimal_places=2, default=20000)


class BusinessPartnerMaster(models.Model):
    partner_id = models.AutoField(primary_key=True)
    partner_name = models.CharField(max_length=255)


# from distribution. used to see if order failed
class ReworkOrder(models.Model):
    rework_id = models.AutoField(primary_key=True)
    rework_status = models.TextField()
    rework_date = models.DateTimeField(default=datetime.now())
    expected_completion = models.DateTimeField(default=datetime.now())


# from distribution. used to see if goods have been issued to customer
class GoodsIssue(models.Model):
    goods_issue_id = models.AutoField(primary_key=True)
    issue_date = models.DateTimeField(default=datetime.now(), blank=True, null=True)
    issue_by = models.DateTimeField(default=datetime.now())


# from MRP. used whenever an order is non-project based
class NonProjectOrderPricing(models.Model):
    non_project_costing_id = models.AutoField(primary_key=True)
    order_id = models.ForeignKey(to="order.Order", on_delete=models.CASCADE)
    product_id = models.ForeignKey(
        to="misc.Product", on_delete=models.CASCADE, related_name="unit_price"
    )
    cost_of_raw_materials = models.DecimalField(max_digits=10, decimal_places=2)
    mrp_base_price = models.DecimalField(max_digits=10, decimal_places=2)
    final_price = models.DecimalField(max_digits=10, decimal_places=2)


class RawMaterials(models.Model):
    item_id = models.AutoField(primary_key=True)
    material_name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    unit_of_measure = models.CharField(default="kg")


# from MRP, used whenever an order is project based
class BOM(models.Model):
    bom_id = models.AutoField(primary_key=True)
    product_id = models.ForeignKey(
        to="misc.Product", on_delete=models.CASCADE, related_name="bom"
    )
    material_id = models.ForeignKey(to=RawMaterials, on_delete=models.CASCADE)
    specific_notes = models.TextField(blank=True, null=True)
    quantity_of_unit = models.IntegerField(default=1)
    cost_per_raw_material = models.DecimalField(max_digits=10, decimal_places=2)
    total_cost_of_raw_materials = models.DecimalField(
        max_digits=10, decimal_places=2, default=0
    )
