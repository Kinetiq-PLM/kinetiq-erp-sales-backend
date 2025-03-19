from django.db import models


class Statement(models.Model):
    class Type(models.TextChoices):
        PROJECT_BASED = "Project Based"
        NON_PROJECT_BASED = "Non-Project Based"
        SERVICE = "Service"

    statement_id = models.BigAutoField(primary_key=True)
    customer = models.ForeignKey(to="customer.Customer", on_delete=models.CASCADE)
    salesrep = models.ForeignKey(to="misc.Employee", on_delete=models.CASCADE)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    discount = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    discount_reason = models.TextField(blank=True, null=True)
    type = models.TextField(choices=Type)


class StatementItem(models.Model):
    class DemandLevel(models.TextChoices):
        LOW = "Low"
        MEDIUM = "Medium"
        HIGH = "High"
        VERY_HIGH = "Very High"
        SEASONAL = "Seasonal"

    statement_item_id = models.BigAutoField(primary_key=True)
    statement = models.ForeignKey(to=Statement, on_delete=models.CASCADE)
    sales_costing = models.ForeignKey(
        to="costing.SalesCosting", on_delete=models.SET_NULL, null=True, blank=True
    )
    product = models.ForeignKey(
        to="misc.Product", on_delete=models.SET_NULL, null=True, blank=True
    )
    quantity = models.IntegerField()
    unit_price = models.DecimalField(max_digits=10, decimal_places=2)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    markup_percentage = models.DecimalField(max_digits=5, decimal_places=2, default=20)
    demand_level = models.TextField(choices=DemandLevel, default=DemandLevel.LOW)
    discount = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    discount_reason = models.TextField(blank=True, null=True)
