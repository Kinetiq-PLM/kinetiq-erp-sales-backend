from rest_framework import serializers
from .models import *
from order.serializers import *
from django.shortcuts import get_object_or_404


class SalesInvoicesSerializer(serializers.ModelSerializer):
    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all())

    class Meta:
        model = SalesInvoices
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["order"] = OrderSerializer(
            get_object_or_404(Order, pk=instance.order.order_id)
        ).data
        return data
