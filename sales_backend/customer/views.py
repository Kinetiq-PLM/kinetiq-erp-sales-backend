from rest_framework import viewsets
from .serializers import *
from django.db import transaction
from rest_framework.response import Response
from rest_framework import status


class CustomerViewSet(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer

    def create(self, request, *args, **kwargs):
        try:
            with transaction.atomic():
                c_serializer = CustomerSerializer(data=request.data)
                if c_serializer.is_valid():
                    customer: Customer = c_serializer.save()

                    # add customer to business partners master list
                    BusinessPartnerMaster.objects.create(
                        partner_name=customer.name,
                        category="customer",
                        contact_info=customer.phone_number,
                    )
                else:
                    raise Exception(c_serializer.errors)
        except Exception as error:
            return Response({"error": str(error)}, status=status.HTTP_400_BAD_REQUEST)

        return super().create(request, *args, **kwargs)
