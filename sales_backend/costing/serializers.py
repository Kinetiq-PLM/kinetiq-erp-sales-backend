from rest_framework import serializers
from .models import *
from misc.admin.models import Products


class SalesCostingSerializer(serializers.ModelSerializer):
    class Meta:
        model = SalesCosting
        fields = "__all__"


class ProductPricingSerializer(serializers.ModelSerializer):
    admin_product = serializers.PrimaryKeyRelatedField(queryset=Products.objects.all())

    class Meta:
        model = ProductPricing
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        product = instance.admin_product
        data.pop("admin_product")
        data["product_pricing_id"] = instance.product_id
        data["product_id"] = product.product_id
        data["product_name"] = product.product_name
        data["description"] = product.description
        data["stock_level"] = product.stock_level
        data["warranty_period"] = product.warranty_period
        data["policy_id"] = product.policy_id
        return data
