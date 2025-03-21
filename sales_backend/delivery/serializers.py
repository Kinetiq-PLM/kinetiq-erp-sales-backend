from .models import *
from rest_framework import serializers
from order.serializers import *
from django.shortcuts import get_object_or_404


class ShippingDetailsSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())

    class Meta:
        model = ShippingDetails
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["order"] = OrderSerializer(
            get_object_or_404(Order, pk=data.pop("order"))
        ).data
        return data
