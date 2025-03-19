from rest_framework import viewsets
from .serializers import *


class SalesCostingViewSet(viewsets.ModelViewSet):
    queryset = SalesCosting.objects.all()
    serializer_class = SalesCostingSerializer
