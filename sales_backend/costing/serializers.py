from rest_framework import serializers
from .models import *


class SalesCostingSerializer(serializers.ModelSerializer):
    class Meta:
        model = SalesCosting
        fields = "__all__"
