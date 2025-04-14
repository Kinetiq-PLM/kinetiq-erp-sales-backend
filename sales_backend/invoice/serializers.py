from rest_framework import serializers
from .models import *
from django.shortcuts import get_object_or_404
from delivery.serializers import *


class PaymentsSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())

    class Meta:
        model = Payments
        fields = "__all__"


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
