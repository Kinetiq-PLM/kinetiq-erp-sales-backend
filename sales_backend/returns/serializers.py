from rest_framework import serializers
from .models import *
from statement.serializers import *
from delivery.serializers import *


class ReturnSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())
    delivery_note = serializers.PrimaryKeyRelatedField(
        queryset=DeliveryNote.objects.all()
    )

    class Meta:
        model = Return
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        s = data.pop("statement")
        data["statement"] = (
            StatementSerializer(Statement.objects.get(pk=s)).data if s else None
        )
        d = data.pop("delivery_note")
        data["delivery_note"] = (
            DeliveryNoteSerializer(DeliveryNote.objects.get(pk=d)).data if d else None
        )
        return data
