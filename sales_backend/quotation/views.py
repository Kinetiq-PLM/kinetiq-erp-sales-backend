from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from django.db import transaction
from statement.serializers import *
from rest_framework import status
from datetime import date
from dateutil.relativedelta import relativedelta


class QuotationViewSet(viewsets.ModelViewSet):
    queryset = Quotation.objects.all().order_by("-date_issued")
    serializer_class = QuotationSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        period = params.get("period")
        start_date = date.today()
        end_date = date.today()
        match period:
            case "month":
                start_date = date.today() - relativedelta(months=1)
            case "year":
                start_date = date.today() - relativedelta(years=1)
            case "all":
                start_date = datetime.fromtimestamp(0).date()
            case "day":
                pass
            case other:
                if other is not None:
                    return Response(
                        {"error": "invalid period"}, status=status.HTTP_400_BAD_REQUEST
                    )

        filtered = {}
        if status:
            filtered["status"] = status
        if period:
            filtered["date_issued__range"] = (start_date, end_date)

        return Response(
            self.serializer_class(self.queryset.filter(**filtered), many=True).data
        )

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            statement_data: {
                customer,
                salesrep,
                total_amount,
                discount,
                type,
                total_tax,
                items (see statement_items): [
                    product,
                    quantity,
                    unit_price,
                    total_price,
                    markup_percentage (optional),
                    demand_level (default 'Low'),
                    discount,
                    tax_amount
                ]
            },
            quotation_data: {
                status
            },
            copy_to: 'Order' | 'Blanket Agreement' | null
        }
        """

        quotation_data = request.data.pop("quotation_data", {})
        statement_data = request.data.pop("statement_data", {})
        items_data = statement_data.pop("items", [])

        try:
            with transaction.atomic():
                statement_serializer = StatementSerializer(
                    data=statement_data, context={"items": items_data}
                )
                if statement_serializer.is_valid():
                    statement: Statement = statement_serializer.save()
                    for item_data in items_data:
                        item_data["statement"] = statement.statement_id
                        item_serializer = StatementItemSerializer(data=item_data)
                        if item_serializer.is_valid():
                            item_serializer.save()
                        else:
                            raise Exception(item_serializer.errors)

                    quotation = Quotation.objects.create(
                        statement=statement, **quotation_data
                    )

                    return Response(
                        QuotationSerializer(quotation).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)
