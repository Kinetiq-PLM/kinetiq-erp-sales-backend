from rest_framework import viewsets
from .serializers import *


class ReturnViewSet(viewsets.ModelViewSet):
    queryset = Return.objects.all().order_by("-return_date")
    serializer_class = ReturnSerializer
