from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from datetime import datetime
from django.db import transaction
from rest_framework import status


class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def create(self, request, *args, **kwargs):
        """
        inputs:
        {
            order_data: {
                rework,
                goods_issue,
                order_date,
                order_status,
                order_total_amount,
                order_type
            }
        }
        """
        items_data = request.data.pop("items", [])

        try:
            with transaction.atomic():

                statement_serializer = StatementSerializer(
                    data=request.data, context={"items": items_data}
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
                    order = Order.objects.create(**order_info)

                    return Response(
                        OrderSerializer(order).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)
