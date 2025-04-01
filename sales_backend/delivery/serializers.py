from .models import *
from rest_framework import serializers
from order.serializers import *
from django.shortcuts import get_object_or_404


class DeliveryNoteSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())

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
