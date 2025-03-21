from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *


class ShippingDetailsViewSet(viewsets.ModelViewSet):
    queryset = ShippingDetails.objects.all()
    serializer_class = ShippingDetailsSerializer
