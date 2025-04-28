from rest_framework import serializers
from .models import *
from misc.mrp.models import Pricing
from misc.inventory.models import InventoryItem
from django.forms import model_to_dict
from misc.urls import InventoryItemSerializer


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
        # inventory_items: InventoryItem = InventoryItem.objects.filter(item_md=product.item.item_id) # pag naayus na ung inventory_item kc wala pa ngayon siya item_id
        # total_stock = sum([item.current_quantity for item in inventory_items])
        # warehouses = [item.warehouse.warehouse_id for item in inventory_items]

        data.pop("pricing")
        data["product_pricing_id"] = instance.product_id
        data["product_id"] = product.item.item_id
        data["selling_price"] = instance.selling_price
        # data['inventory_items'] = InventoryItemSerializer(inventory_items, many=True).data
        # data["stock_level"] = total_stock

        # inventory_items contains all the warehouses of the product
        # in frontend, a dropdown will be provided for the warehouses
        # and statement_item's inventory_item_id will be set based on
        # the selected warehouse

        # for each inventory_item, get the warehouse name and set value to id

        return data
