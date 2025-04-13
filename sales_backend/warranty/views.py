from django.shortcuts import render
from .serializers import *
from rest_framework import viewsets


class RenewalWarrantyViewset(viewsets.ModelViewSet):
    queryset = RenewalWarranty.objects.all()
    serializer_class = RenewalWarrantySerializer
