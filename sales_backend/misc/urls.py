from .admin.models import ItemMasterData, Warehouse
from rest_framework import viewsets
from rest_framework.routers import DefaultRouter
from django.urls import path, include
from rest_framework import serializers
from .human_resources.models import Employees
from rest_framework.request import Request
from rest_framework.response import Response
from .admin.models import BusinessPartnerMaster
from .inventory.models import InventoryItem


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = ItemMasterData
        fields = ["item_id", "item_name", "item_status", "item_description"]


class ProductsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ItemMasterData.objects.filter(item_type="Product")
    serializer_class = ProductSerializer


class EmployeesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employees
        fields = ["employee_id", "first_name", "last_name"]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["name"] = f"{data['first_name']} {data['last_name']}"
        return data


class EmployeesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Employees.objects.all()
    serializer_class = EmployeesSerializer


class WarehouseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Warehouse
        fields = ["warehouse_id", "warehouse_name"]  # keep only what you need


class InventoryItemSerializer(serializers.ModelSerializer):
    warehouse = WarehouseSerializer(read_only=True)
    item = serializers.SerializerMethodField()

    class Meta:
        model = InventoryItem
        fields = ["inventory_item_id", "item", "current_quantity", "warehouse"]

    def get_item(self, obj):
        return {
            "item_id": obj.item.item_id,
            "item_name": obj.item.item_name,
            "item_description": obj.item.item_description,
        }


router = DefaultRouter()
router.register("product", ProductsViewSet)
router.register("employee", EmployeesViewSet)
urlpatterns = [path("", include(router.urls))]
