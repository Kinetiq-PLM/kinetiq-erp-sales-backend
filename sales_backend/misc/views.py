from rest_framework import viewsets
from .serializers import *


class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer


class PoliciesViewSet(viewsets.ModelViewSet):
    queryset = Policies.objects.all()
    serializer_class = PoliciesSerializer


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ChartOfAccountsViewSet(viewsets.ModelViewSet):
    queryset = ChartOfAccounts.objects.all()
    serializer_class = ChartOfAccountsSerializer


class GeneralLedgerAccountsViewSet(viewsets.ModelViewSet):
    queryset = GeneralLedgerAccounts.objects.all()
    serializer_class = GeneralLedgerAccountsSerializer


class BusinessPartnerMasterViewSet(viewsets.ModelViewSet):
    queryset = BusinessPartnerMaster.objects.all()
    serializer_class = BusinessPartnerMasterSerializer


class ReworkOrderViewSet(viewsets.ModelViewSet):
    queryset = ReworkOrder.objects.all()
    serializer_class = ReworkOrderSerializer


class GoodsIssueViewSet(viewsets.ModelViewSet):
    queryset = GoodsIssue.objects.all()
    serializer_class = GoodsIssueSerializer


class NonProjectOrderPricingViewSet(viewsets.ModelViewSet):
    queryset = NonProjectOrderPricing.objects.all()
    serializer_class = NonProjectOrderPricingSerializer


class RawMaterialsViewSet(viewsets.ModelViewSet):
    queryset = RawMaterials.objects.all()
    serializer_class = RawMaterialSerializer


class BOMViewSet(viewsets.ModelViewSet):
    queryset = BOM.objects.all()
    serializer_class = BOMSerializer
