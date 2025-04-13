from rest_framework import viewsets
from .serializers import *
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework import status
from django.db import transaction
from delivery.serializers import *


class ReturnViewSet(viewsets.ModelViewSet):
    queryset = Return.objects.all().order_by("-return_date")
    serializer_class = ReturnSerializer

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            return_data: {
                delivery_note_id,
                return_date
            }
            statement_data: {
                customer,
                salesrep,
                total_amount,
                discount,
                type,
                return_reason
            },
        }
        """
        return_data = request.data.pop("return_data", {})
        items_data = return_data.pop("items", [])
        statement_data = request.data.pop("statement_data", {})
        for item in items_data:
            item["quantity_to_deliver"] = 0

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

                    return_data["delivery_note"] = get_object_or_404(
                        DeliveryNote, pk=return_data.get("delivery_note")
                    )
                    data = {"statement": statement, **return_data}
                    returns = Return.objects.create(**data)

                    return Response(
                        ReturnSerializer(returns).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)

        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)
