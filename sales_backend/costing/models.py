from django.db import models
from datetime import datetime
from misc.mrp.models import NonProjectOrderPricing, Pricing
from misc.project_management.models import ExternalProjectCostManagement
from misc.admin.models import ItemMasterData


class ProductPricing(models.Model):
    class DemandLevel(models.TextChoices):
        VERY_HIGH = "Very High"
        HIGH = "High"
        MEDIUM = "Medium"
        LOW = "Low"
        SEASONAL = "Seasonal"

    product_id = models.CharField(primary_key=True, max_length=255, blank=True)
    admin_product = models.ForeignKey(ItemMasterData, models.CASCADE)
    pricing = models.ForeignKey(Pricing, models.CASCADE)
    markup_percentage = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    selling_price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    demand_level = models.TextField(choices=DemandLevel, default=DemandLevel.LOW)

    class Meta:
        managed = False
        db_table = '"sales"."product_pricing"'
