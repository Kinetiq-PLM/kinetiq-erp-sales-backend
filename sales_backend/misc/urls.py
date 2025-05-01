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
        fields = [
            "employee_id",
            "first_name",
            "last_name",
            "position_id",
            "dept_id",
            "is_supervisor",
        ]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["name"] = f"{data['first_name']} {data['last_name']}"
        return data


class EmployeesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Employees.objects.all()
    serializer_class = EmployeesSerializer

    def list(self, request: Request) -> Response:
        request_data = request.query_params
        filters = {}
        if request_data.get("position_id"):
            filters["position_id__in"] = (
                request_data.get("position_id").split(",")
                if request_data.get("position_id")
                else []
            )

        serializer = self.serializer_class(self.queryset.filter(**filters), many=True)
        return Response(serializer.data)


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
router.register("employee", EmployeesViewSet, basename="employee")
urlpatterns = [path("", include(router.urls))]
