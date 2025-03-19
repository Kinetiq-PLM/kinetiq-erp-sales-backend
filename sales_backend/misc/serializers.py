from rest_framework import serializers
from .models import *


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = "__all__"


class PoliciesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Policies
        fields = "__all__"


class ChartOfAccountsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChartOfAccounts
        fields = "__all__"


class GeneralLedgerAccountsSerializer(serializers.ModelSerializer):
    class Meta:
        model = GeneralLedgerAccounts
        fields = "__all__"


class BusinessPartnerMasterSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusinessPartnerMaster
        fields = "__all__"


class ReworkOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReworkOrder
        fields = "__all__"


class GoodsIssueSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsIssue
        fields = "__all__"


class NonProjectOrderPricingSerializer(serializers.ModelSerializer):
    class Meta:
        model = NonProjectOrderPricing
        fields = "__all__"


class RawMaterialSerializer(serializers.ModelSerializer):
    class Meta:
        model = RawMaterials
        fields = "__all__"


class BOMSerializer(serializers.ModelSerializer):
    class Meta:
        model = BOM
        fields = "__all__"


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = "__all__"
