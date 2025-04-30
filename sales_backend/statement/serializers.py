from rest_framework import serializers
from .models import *
from customer.serializers import *
from django.shortcuts import get_object_or_404, get_list_or_404
from misc.human_resources.models import Employees
from django.forms import model_to_dict
from misc.urls import InventoryItemSerializer


class StatementItemSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )
    # product = serializers.PrimaryKeyRelatedField(queryset=Pricing.objects.all())
    inventory_item = serializers.PrimaryKeyRelatedField(
        queryset=InventoryItem.objects.all()
    )

    class Meta:
        model = StatementItem
        exclude = [
            "additional_service_id",
            "created_at",
            "return_reason",
            "return_action",
        ]

    def create(self, validated_data):
        validated_data["total_price"] = (
            validated_data["quantity"] * validated_data["unit_price"]
        )
        return super().create(validated_data)

    def to_representation(self, instance):
        data = super().to_representation(instance)
        p = data.pop("inventory_item")
        inventory_item = get_object_or_404(InventoryItem, pk=p) if p else None
        # data.pop("product")
        data["inventory_item"] = (
            InventoryItemSerializer(inventory_item).data if inventory_item else None
        )
        return data


class StatementSerializer(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employees.objects.all())

    class Meta:
        model = Statement
        exclude = ["created_at"]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["customer"] = CustomerSerializer(instance.customer).data
        data["salesrep"] = {
            "employee_id": instance.salesrep.employee_id,
            "first_name": instance.salesrep.first_name,
            "last_name": instance.salesrep.last_name,
        }
        return data

    def get_items(self, obj):
        # The prefetch_related above makes this efficient
        items = obj.statementitem_set.all()
        return StatementItemSerializer(items, many=True).data


class StatementItemViewSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )
    # product = serializers.PrimaryKeyRelatedField(queryset=Pricing.objects.all())
    inventory_item = serializers.PrimaryKeyRelatedField(
        queryset=InventoryItem.objects.all()
    )

    inventory_item_details = serializers.SerializerMethodField()

    class Meta:
        model = StatementItemView
        exclude = [
            "additional_service_id",
            "created_at",
            "return_reason",
            "return_action",
        ]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        # data.pop("product")
        data["inventory_item"] = (
            InventoryItemSerializer(instance.inventory_item).data
            if instance.inventory_item
            else None
        )
        return data
