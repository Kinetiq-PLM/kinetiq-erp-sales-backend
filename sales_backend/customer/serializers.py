from rest_framework import serializers
from .models import *


class CustomerSerializer(serializers.ModelSerializer):
    updated_at = serializers.DateTimeField(required=False)

    class Meta:
        model = Customer
        exclude = ["gl_account"]
