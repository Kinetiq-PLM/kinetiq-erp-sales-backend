from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from django.db import transaction
from statement.serializers import *
from rest_framework import status


class QuotationViewSet(viewsets.ModelViewSet):
    queryset = Quotation.objects.all()
    serializer_class = QuotationSerializer

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            statement_data: {
                customer,
                salesrep,
                total_amount,
                discount,
                discount_reason,
                type,
                items: []
            },
            quotation_data: {
                status
            }
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
