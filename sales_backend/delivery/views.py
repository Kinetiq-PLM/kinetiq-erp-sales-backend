from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *


class ShippingDetailsViewSet(viewsets.ModelViewSet):
    queryset = ShippingDetails.objects.all().order_by("-shipping_date")
    serializer_class = ShippingDetailsSerializer

    def create(self, request, *args, **kwargs):
        """
        To Distribution:
            provides the order and the customer account to Distribution,
            to calculate the manpower or for example,
            number of trucks needed for delivery.
            Distribution returns the total cost of logistics to Sales
            to include in the invoice.
        """
        return super().create(request, *args, **kwargs)
