from rest_framework import serializers
from .models import *
from misc.admin.models import BusinessPartnerMaster


class CustomerSerializer(serializers.ModelSerializer):
    partner = serializers.PrimaryKeyRelatedField(
        queryset=BusinessPartnerMaster.objects.all()
    )

    class Meta:
        model = Customer
        fields = "__all__"
