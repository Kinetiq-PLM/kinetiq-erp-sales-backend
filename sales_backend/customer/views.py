from rest_framework import viewsets
from .serializers import *
from django.db import transaction, connection
from rest_framework.response import Response
from rest_framework import status
from rest_framework.request import Request


class CustomerViewSet(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        type = params.get("type").split(",") if params.get("type") else []
        filters = {}
        if status:
            filters["status"] = status
        if type:
            filters["customer_type__in"] = type

        return Response(
            self.serializer_class(self.queryset.filter(**filters), many=True).data
        )

    def create(self, request, *args, **kwargs):
        """
        inputs:
        {
            name,
            email_address,
            phone_number,
            country,
            city,
            postal_code,
            address_line1,
            address_line2,
            customer_type,
            contact_person,
            status (default 'Active')
        }
        """

        try:
            with transaction.atomic():
                # add customer to business partner masterlist
                c_serializer = CustomerSerializer(data=request.data)
                if c_serializer.is_valid():
                    customer: Customer = c_serializer.save()
                    return Response(
                        CustomerSerializer(customer).data,
                        status=status.HTTP_201_CREATED,
                    )

                else:
                    raise Exception(c_serializer.errors)
        except Exception as error:
            return Response({"error": str(error)}, status=status.HTTP_400_BAD_REQUEST)

        return super().create(request, *args, **kwargs)
