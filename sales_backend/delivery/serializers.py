from .models import *
from rest_framework import serializers
from order.serializers import *
from django.shortcuts import get_object_or_404
from misc.distribution.models import ShippingCost


class DeliveryNoteSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    shipping_fee = serializers.SerializerMethodField()

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

                shipping_fee = float(
                    ShippingCost.objects.get(
                        pk=delivery.shipment.shipping_cost_id
                    ).total_shipping_cost
                )
        if shipping_fee < 0:
            shipping_fee = 0.0
        return shipping_fee
