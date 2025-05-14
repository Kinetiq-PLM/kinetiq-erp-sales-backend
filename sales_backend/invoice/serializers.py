from rest_framework import serializers
from .models import *
from django.shortcuts import get_object_or_404
from delivery.serializers import *
from itertools import zip_longest


class PaymentsSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())

    class Meta:
        model = Payments
        fields = "__all__"


"""
In cases of Partial Delivery, Sales Invoice are only finalized and sent in the final batch of delivery.
Batches of Partial Deliveries prior to the final batch should not have invoices. 
"""


class SalesInvoicesSerializer(serializers.ModelSerializer):
    delivery_note = serializers.PrimaryKeyRelatedField(
        queryset=DeliveryNote.objects.all()
    )

    class Meta:
        model = SalesInvoices
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        d = data.pop("delivery_note")
        data["delivery_note"] = (
            DeliveryNoteSerializer(get_object_or_404(DeliveryNote, pk=d)).data
            if d
            else None
        )
        return data


class SalesInvoicesViewSerializer(serializers.ModelSerializer):
    delivery_note = serializers.PrimaryKeyRelatedField(
        queryset=DeliveryNote.objects.all()
    )
    order_fulfillment = serializers.SerializerMethodField()

    class Meta:
        model = SalesInvoicesView
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        d = data.pop("delivery_note")
        data["delivery_note"] = (
            DeliveryNoteSerializer(get_object_or_404(DeliveryNote, pk=d)).data
            if d
            else None
        )
        return data

    def get_order_fulfillment(self, instance):
        order_items = StatementSerializer(instance.delivery_note.order.statement).data[
            "items"
        ]
        delivery_items = StatementSerializer(instance.delivery_note.statement).data[
            "items"
        ]
        is_partial = False
        for order, delivery in zip_longest(order_items, delivery_items):
            if delivery is None:
                is_partial = True
            elif order["quantity"] != delivery["quantity"]:
                is_partial = True
        return "Partial" if is_partial else "Full"
