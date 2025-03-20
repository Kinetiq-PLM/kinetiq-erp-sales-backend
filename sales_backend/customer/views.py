from rest_framework import viewsets
from .serializers import *


class CustomerViewSet(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer

    def create(self, request, *args, **kwargs):
        c_serializer = CustomerSerializer(data=request.data)
        if c_serializer.is_valid():
            c_serializer.save()

        # add customer to business partners master list

        return super().create(request, *args, **kwargs)
