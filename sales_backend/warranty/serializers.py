from .models import *
from rest_framework import serializers


class RenewalWarrantySerializer(serializers.ModelSerializer):
    class Meta:
        model = RenewalWarranty
        fields = "__all__"
