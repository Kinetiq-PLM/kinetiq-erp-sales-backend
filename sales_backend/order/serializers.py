from rest_framework import serializers
from .models import *
from statement.serializers import *
from misc.serializers import *


class OrderSerializer(serializers.ModelSerializer):
    statement = serializers.PrimaryKeyRelatedField(queryset=Statement.objects.all())

    class Meta:
        model = Order
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["statement"] = StatementSerializer(
            get_object_or_404(Statement, instance.statement)
        ).data
