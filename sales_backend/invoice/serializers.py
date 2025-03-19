from rest_framework import serializers
from .models import *


class SalesInvoicesSerializer(serializers.ModelSerializer):
    customer_name = serializers.CharField(source="order_id.customer_id.name")

    # paid_amount
    # unpaid_amount
    # late by
    class Meta:
        model = SalesInvoices
        fields = "__all__"

    def to_representation(self, instance):
        return super().to_representation(instance)
