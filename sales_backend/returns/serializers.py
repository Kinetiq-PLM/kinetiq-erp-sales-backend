from rest_framework import serializers
from .models import *
from statement.serializers import *


class ReturnSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())

    class Meta:
        model = Return
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["statement"] = StatementSerializer(
            Statement.objects.get(pk=instance.statement)
        ).data
        return data
