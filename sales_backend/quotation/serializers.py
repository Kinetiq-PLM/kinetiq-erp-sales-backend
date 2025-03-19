from rest_framework import serializers
from .models import *
from statement.serializers import StatementSerializer
from django.shortcuts import get_object_or_404


class QuotationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Quotation
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["statement"] = StatementSerializer(
            get_object_or_404(Statement, pk=instance.statement.statement_id)
        ).data
        return data
