from rest_framework import serializers
from .models import *
from misc.urls import InventoryItemSerializer


class ProductPricingSerializer(serializers.ModelSerializer):
    inventory_items = serializers.SerializerMethodField()
    stock_level = serializers.IntegerField(read_only=True)

    class Meta:
        model = ProductPricing
        fields = "__all__"

    product_pricing_id = serializers.CharField(source="pk", read_only=True)
    product_id = serializers.CharField(source="admin_product.item_id", read_only=True)
    product_name = serializers.CharField(
        source="admin_product.item_name", read_only=True
    )
    product_description = serializers.CharField(
        source="admin_product.item_description", read_only=True
    )

    def get_inventory_items(self, obj):
        # obj.admin_product.prefetched_inventory is already in memory
        return InventoryItemSerializer(
            obj.admin_product.prefetched_inventory,
            many=True,
            context=self.context,
        ).data

        # def to_representation(self, instance):
        #     data = super().to_representation(instance)
        #     inventory_items = InventoryItem.objects.filter(
        #         item=instance.admin_product
        #     ).select_related(
        #         "warehouse"
        #     )  # pag naayus na ung inventory_item kc wala pa ngayon siya item_id

        #     total_stock = (
        #         inventory_items.aggregate(total=Sum("current_quantity"))["total"] or 0
        #     )
        #     # warehouses = [item.warehouse.warehouse_id for item in inventory_items]
        #     data.pop("pricing")
        #     data.pop("product_id")
        #     data["product_pricing_id"] = instance.product_id
        #     data["product_id"] = instance.admin_product.item_id
        #     data["product_name"] = instance.admin_product.item_name
        #     data["product_description"] = instance.admin_product.item_description
        #     data["selling_price"] = instance.selling_price
        #     data["inventory_items"] = InventoryItemSerializer(
        #         inventory_items, many=True
        #     ).data
        #     data["stock_level"] = total_stock

        # inventory_items contains all the warehouses of the product
        # in frontend, a dropdown will be provided for the warehouses
        # and statement_item's inventory_item_id will be set based on
        # the selected warehouse

        # for each inventory_item, get the warehouse name and set value to id

        return data
