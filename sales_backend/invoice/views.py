from django.shortcuts import get_object_or_404
from .serializers import *
from rest_framework import viewsets
from rest_framework.request import Request
from rest_framework.response import Response
from order.serializers import Order
from rest_framework import status
from django.db import transaction


class SalesInvoicesViewSet(viewsets.ModelViewSet):
    queryset = SalesInvoices.objects.all()
    serializer_class = SalesInvoicesSerializer

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            order_id,
            invoice_date (optional default order_date),
            total_amount (optional default order_total_amount),
            invoice_status (default 'Pending'),
            payment_status (default 'Unpaid'),
            due_date
        }
        """
        order_id = request.data.pop("order_id")
        order: Order = get_object_or_404(Order, pk=order_id)
        invoice_date = request.data.pop("invoice_date", order.order_date)
        total_amount = request.data.pop("total_amount", order.order_total_amount)
        invoice = SalesInvoices.objects.create(
            order_id=order.order_id,
            invoice_date=invoice_date,
            total_amount=total_amount,
            **request.data
        )

        return Response(
            SalesInvoicesSerializer(invoice).data, status=status.HTTP_201_CREATED
        )
