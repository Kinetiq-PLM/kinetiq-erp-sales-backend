from rest_framework import serializers
from .models import *
from statement.serializers import StatementSerializer


class QuotationSerializer(serializers.ModelSerializer):
    statement = StatementSerializer(read_only=True)

    class Meta:
        model = Quotation
        fields = "__all__"


class QuotationViewSerializer(serializers.ModelSerializer):
    statement = StatementSerializer(read_only=True)

    class Meta:
        model = QuotationView
        fields = "__all__"
