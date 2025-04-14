from rest_framework import serializers
from .models import *
from statement.serializers import Statement, StatementSerializer


class BlanketAgreementSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(
        queryset=BlanketAgreement.objects.all()
    )

    class Meta:
        model = BlanketAgreement
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        s = data.pop("statement")
        data["statement"] = (
            StatementSerializer(Statement.objects.get(pk=s)).data if s else None
        )
        return data


class AgreementViewSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=AgreementView.objects.all())

    class Meta:
        model = AgreementView
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        s = data.pop("statement")
        data["statement"] = (
            StatementSerializer(Statement.objects.get(pk=s)).data if s else None
        )
        return data
