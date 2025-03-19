from django.shortcuts import get_object_or_404
from rest_framework import views
from invoice.serializers import SalesInvoices
from rest_framework.response import Response
from rest_framework.request import Request
from order.serializers import Order
from rest_framework import status


class ReminderView(views.APIView):
    def post(self, request: Request):
        invoice_ids = request.data.get("invoice_ids")
        for invoice_id in invoice_ids:
            invoice: SalesInvoices = get_object_or_404(SalesInvoices, pk=invoice_id)
            order: Order = invoice.order_id

            # contact order.customer_id
            print(f"Contacting {order.customer_id.customer_id}...")

        return Response({"success": True}, status=status.HTTP_200_OK)
