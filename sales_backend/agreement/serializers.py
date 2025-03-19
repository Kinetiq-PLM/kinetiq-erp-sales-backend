from rest_framework import serializers
from .models import *


class BlanketAgreementSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlanketAgreement
        fields = "__all__"
