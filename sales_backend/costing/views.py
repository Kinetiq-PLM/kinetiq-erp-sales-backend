from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response


class SalesCostingViewSet(viewsets.ModelViewSet):
    queryset = SalesCosting.objects.all()
    serializer_class = SalesCostingSerializer


class ProductPricingViewSet(viewsets.ModelViewSet):
    queryset = ProductPricing.objects.filter(
        admin_product__item_status="Active"
    ).order_by("admin_product__product_name")
    serializer_class = ProductPricingSerializer

    def list(self, request, *args, **kwargs):
        params = request.query_params
        product = params.get("admin_product")
        filters = {}
        if product:
            filters["admin_product_id"] = product

        return Response(
            self.serializer_class(self.queryset.filter(**filters), many=True).data
        )
