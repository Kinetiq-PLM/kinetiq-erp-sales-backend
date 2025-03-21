from rest_framework import serializers
from .models import *
from customer.serializers import *
from decimal import Decimal
from django.shortcuts import get_object_or_404, get_list_or_404
from misc.human_resources.models import Employees


class StatementItemSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )
    product = serializers.SerializerMethodField()

    class Meta:
        model = StatementItem
        fields = "__all__"

    def create(self, validated_data):
        validated_data["total_price"] = (
            validated_data["quantity"] * validated_data["unit_price"]
        )
        return super().create(validated_data)

    def get_product(self, obj):
        return {
            "product_id": obj.product.product_id,
            "product_name": obj.product.product_name,
            "description": obj.product.description,
            "selling_price": obj.product.selling_price,
            "stock_level": obj.product.stock_level,
            "warranty_period": obj.product.warranty_period,
            "policy_id": obj.product.policy_id,
        }


class StatementSerializer(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employees.objects.all())

    class Meta:
        model = Statement
        fields = "__all__"

    def to_internal_value(self, data):
        items = self.context.get("items", [])
        total = Decimal(0)
        for item in items:
            total += item["quantity"] * item["unit_price"]

        data["total_amount"] = total
        return super().to_internal_value(data)

    def get_items(self, obj):
        return StatementItemSerializer(
            get_list_or_404(StatementItem, statement=obj), many=True
        ).data
