from django.shortcuts import get_object_or_404
from .serializers import *
from rest_framework import viewsets
from rest_framework.request import Request
from rest_framework.response import Response
from order.serializers import Order
from rest_framework import status


class SalesInvoicesViewSet(viewsets.ModelViewSet):
    queryset = SalesInvoices.objects.all()
    serializer_class = SalesInvoicesSerializer

    def create(self, request: Request, *args, **kwargs):
        order_id = request.data.pop("order_id")
        order: Order = get_object_or_404(Order, pk=order_id)
        invoice_date = (
            request.data.pop("invoice_date")
            if request.data.get("invoice_date")
            else order.order_date
        )
        invoice = SalesInvoices.objects.create(
            order_id=order,
            invoice_date=invoice_date,
            total_amount=order.order_total_amount,
            **request.data
        )

        return Response(
            SalesInvoicesSerializer(invoice).data, status=status.HTTP_201_CREATED
        )
