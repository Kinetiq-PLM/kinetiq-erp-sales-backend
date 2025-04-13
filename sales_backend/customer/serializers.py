from rest_framework import serializers
from .models import *
from misc.admin.models import BusinessPartnerMaster
from django.forms import model_to_dict


class CustomerSerializer(serializers.ModelSerializer):
    partner = serializers.PrimaryKeyRelatedField(
        queryset=BusinessPartnerMaster.objects.all(), allow_null=True, required=False
    )

    class Meta:
        model = Customer
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if instance.partner:
            data["partner"] = model_to_dict(
                instance.partner,
                fields=[field.name for field in BusinessPartnerMaster._meta.fields],
            )
        return data
