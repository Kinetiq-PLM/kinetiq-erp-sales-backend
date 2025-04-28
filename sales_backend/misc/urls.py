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
        fields = "__all__"


class ProductsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ItemMasterData.objects.filter(item_type="Product")
    serializer_class = ProductSerializer


class EmployeesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employees
        fields = "__all__"

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
        exclude = ["warehouse_manager", "contact_no"]


class InventoryItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = InventoryItem
        fields = ["inventory_item_id", "item", "warehouse", "current_quantity"]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["warehouse"] = WarehouseSerializer(instance.warehouse).data
        return data


router = DefaultRouter()
router.register("product", ProductsViewSet)
router.register("employee", EmployeesViewSet)
urlpatterns = [path("", include(router.urls))]
