from rest_framework import serializers
from .models import *
from statement.serializers import *
from quotation.serializers import *
from agreement.serializers import *


class OrderSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    quotation = serializers.PrimaryKeyRelatedField(
        queryset=Quotation.objects.all(), allow_null=True, required=False
    )
    agreement = serializers.PrimaryKeyRelatedField(
        queryset=BlanketAgreement.objects.all(), allow_null=True, required=False
    )

    class Meta:
        model = Order
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["statement"] = StatementSerializer(
            get_object_or_404(Statement, pk=instance.statement.statement_id)
        ).data
        data["quotation_id"] = data.pop("quotation")
        data["agreement_id"] = data.pop("agreement")
        return data


class OrderViewSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    quotation = serializers.PrimaryKeyRelatedField(
        queryset=Quotation.objects.all(), allow_null=True, required=False
    )
    agreement = serializers.PrimaryKeyRelatedField(
        queryset=BlanketAgreement.objects.all(), allow_null=True, required=False
    )

    class Meta:
        model = OrderView
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["statement"] = StatementSerializer(
            get_object_or_404(Statement, pk=instance.statement.statement_id)
        ).data
        data["quotation_id"] = data.pop("quotation")
        return data
