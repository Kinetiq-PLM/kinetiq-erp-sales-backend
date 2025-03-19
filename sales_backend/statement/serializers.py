from rest_framework import serializers
from .models import *
from customer.serializers import *
from misc.serializers import *
from decimal import Decimal
from django.shortcuts import get_object_or_404, get_list_or_404


class StatementItemSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )

    class Meta:
        model = StatementItem
        fields = "__all__"

    def create(self, validated_data):
        validated_data["total_price"] = (
            validated_data["quantity"] * validated_data["unit_price"]
        )
        return super().create(validated_data)

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if instance.product:
            data["product"] = ProductSerializer(
                get_object_or_404(Product, pk=instance.product.product_id)
            ).data

        return data


class StatementSerializer(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employee.objects.all())

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

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["customer"] = CustomerSerializer(
            get_object_or_404(Customer, pk=data["customer"])
        ).data
        data["salesrep"] = EmployeeSerializer(
            get_object_or_404(Employee, pk=data["salesrep"])
        ).data

        return data

    def get_items(self, obj):
        return StatementItemSerializer(
            get_list_or_404(StatementItem, statement=obj), many=True
        ).data
