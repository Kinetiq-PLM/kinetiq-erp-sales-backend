from django.db import models
from datetime import datetime
from misc.mrp.models import NonProjectOrderPricing
from misc.project_management.models import ExternalProjectCostManagement


# contains all necessary pricing for products
class SalesCosting(models.Model):
    sales_costing_id = models.CharField(primary_key=True, max_length=255, blank=True)
    non_project_costing = models.ForeignKey(
        to=NonProjectOrderPricing,
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
    )
    project_resources = models.ForeignKey(
        to=ExternalProjectCostManagement,
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
    )
    created_at = models.DateTimeField(default=datetime.now())
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = '"sales"."sales_costing"'
