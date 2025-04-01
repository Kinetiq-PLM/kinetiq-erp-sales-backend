from rest_framework import serializers
from .models import *
from misc.admin.models import Products
from django.forms import model_to_dict


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
        product_info = model_to_dict(
            product,
            fields=[field.name for field in Products._meta.fields],
        )
        data = {**data, **product_info}
        return data
