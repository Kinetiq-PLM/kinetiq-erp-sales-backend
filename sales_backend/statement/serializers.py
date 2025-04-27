from rest_framework import serializers
from .models import *
from customer.serializers import *
from django.shortcuts import get_object_or_404, get_list_or_404
from misc.human_resources.models import Employees
from django.forms import model_to_dict


class StatementItemSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )
    product = serializers.PrimaryKeyRelatedField(queryset=Pricing.objects.all())
    inventory_item = serializers.PrimaryKeyRelatedField(
        queryset=InventoryItem.objects.all()
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
        p = data.pop("pricing")
        product: Pricing = get_object_or_404(Pricing, pk=p) if p else None

        data["product"] = (
            {
                "product_id": product.item.id,
                "product_name": product.item.item_name,
                "description": product.item.item_description,
                # "policy_id": product.policy_id,
                "selling_price": product.item_price,
                # "stock_level": product.stock_level,
                # "warranty_period": product.warranty_period,
            }
            if p
            else None
        )
        return data


class StatementSerializer(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employees.objects.all())

    class Meta:
        model = Statement
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        c = data.pop("customer")
        data["customer"] = (
            CustomerSerializer(Customer.objects.get(pk=c)).data if c else None
        )
        s = data.pop("salesrep")
        data["salesrep"] = (
            model_to_dict(
                Employees.objects.get(pk=s),
                fields=[field.name for field in Employees._meta.fields],
            )
            if s
            else None
        )
        return data

    def get_items(self, obj):
        items = StatementItem.objects.filter(statement=obj)
        return StatementItemSerializer(items, many=True).data


class StatementItemViewSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    total_price = serializers.DecimalField(
        max_digits=10, decimal_places=2, read_only=True
    )
    product = serializers.PrimaryKeyRelatedField(queryset=Pricing.objects.all())

    class Meta:
        model = StatementItemView
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        p = data.pop("product")
        product = get_object_or_404(Pricing, pk=p) if p else None  # baka need ichange
        data["product"] = (
            {
                "product_id": product.item.id,
                "product_name": product.item.item_name,
                "description": product.item.item_description,
                # "policy_id": product.policy_id,
                "selling_price": product.item_price,
                # "stock_level": product.stock_level,   # dapat sa inventory_item to
                # "warranty_period": product.warranty_period,
            }
            if p
            else None
        )
        return data
