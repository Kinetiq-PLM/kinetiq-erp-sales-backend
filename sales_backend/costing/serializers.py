from rest_framework import serializers
from .models import *
from misc.mrp.models import Pricing
from misc.inventory.models import InventoryItem
from django.forms import model_to_dict


class SalesCostingSerializer(serializers.ModelSerializer):
    class Meta:
        model = SalesCosting
        fields = "__all__"


class ProductPricingSerializer(serializers.ModelSerializer):
    pricing = serializers.PrimaryKeyRelatedField(queryset=Pricing.objects.all())

    class Meta:
        model = ProductPricing
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        product: Pricing = instance.pricing
        # inventory_item: InventoryItem = InventoryItem.objects.filter(item_md=product.item.item_id) # pag naayus na ung inventory_item kc wala pa ngayon siya item_id
        # total_stock = sum([item.quantity for item in inventory_item])

        data.pop("pricing")
        data["product_pricing_id"] = instance.product_id
        data["product_id"] = product.item.item_id
        data["selling_price"] = instance.selling_price
        # lagay sa serializer ng statement_item pag nag-add is
        # ung inventory_item_id where item_id = item_id and warehouse = warehouse
        # imbis na product_id para may warehouse na rin

        # data["stock_level"] = total_stock
        return data
