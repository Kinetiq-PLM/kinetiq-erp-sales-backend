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
        data["statement"] = StatementSerializer(instance.statement).data
        data["delivery_note"] = DeliveryNoteSerializer(instance.delivery_note).data
        return data
