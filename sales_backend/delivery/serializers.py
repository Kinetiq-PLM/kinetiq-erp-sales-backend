from .models import *
from rest_framework import serializers
from order.serializers import *
from django.shortcuts import get_object_or_404
from misc.distribution.models import OperationalCost
from itertools import zip_longest


class DeliveryNoteSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    shipping_fee = serializers.SerializerMethodField()
    order_fulfillment = serializers.SerializerMethodField()

    class Meta:
        model = DeliveryNote
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if data.get("order"):
            data["order"] = OrderSerializer(
                get_object_or_404(Order, pk=data.pop("order"))
            ).data
        if data.get("statement"):
            data["statement"] = StatementSerializer(
                get_object_or_404(Statement, pk=data.pop("statement"))
            ).data
        return data

    def get_shipping_fee(self, instance):
        delivery = instance
        shipping_fee = 0.0
        if delivery.shipment:
            if delivery.shipment.shipping_cost_id:
                try:
                    shipping_fee = float(
                        OperationalCost.objects.get(
                            shipping_cost_id=delivery.shipment.shipping_cost_id
                        ).total_operational_cost
                    )
                except OperationalCost.DoesNotExist:
                    shipping_fee = 0.00
        if shipping_fee < 0:
            shipping_fee = 0.0
        return shipping_fee

    def get_order_fulfillment(self, instance):
        order_items = StatementSerializer(instance.order.statement).data["items"]
        delivery_items = StatementSerializer(instance.statement).data["items"]
        is_partial = False
        for order, delivery in zip_longest(order_items, delivery_items):
            if delivery is None:
                is_partial = True
            elif order["quantity"] != delivery["quantity"]:
                is_partial = True
        return "Partial" if is_partial else "Full"
