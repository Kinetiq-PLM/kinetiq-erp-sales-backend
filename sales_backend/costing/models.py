from django.db import models
from datetime import datetime


# contains all necessary pricing for products
class SalesCosting(models.Model):
    sales_costing_id = models.AutoField(primary_key=True)
    non_project_costing = models.ForeignKey(
        to="misc.NonProjectOrderPricing",
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
    )
    bom = models.ForeignKey(
        to="misc.BOM", on_delete=models.SET_NULL, blank=True, null=True
    )
    created_at = models.DateTimeField(default=datetime.now())
    updated_at = models.DateTimeField(auto_now=True)
