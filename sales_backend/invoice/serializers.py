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
        data["order"] = DeliveryNoteSerializer(
            get_object_or_404(DeliveryNote, pk=instance.delivery_note.delivery_note_id)
        ).data
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
        data["delivery_note"] = DeliveryNoteSerializer(
            get_object_or_404(DeliveryNote, pk=instance.delivery_note.delivery_note_id)
        ).data
        return data
