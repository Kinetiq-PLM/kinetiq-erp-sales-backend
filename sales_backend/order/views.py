from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from django.db import transaction
from rest_framework import status
from quotation.models import Quotation
from misc.project_management.models import ExternalProjectRequest


class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all().order_by("-order_date")
    serializer_class = OrderSerializer

    def create(self, request, *args, **kwargs):
        """
        inputs:
        {
            required:
                order_data: {
                    rework,
                    quotation_id,
                    goods_issue,
                    order_date,
                    order_status,
                    order_total_amount (optional, auto generated),
                    order_type,
                    items (see statement_items): [ product_id, quantity, unit_price, markup_percentage ]
                }

                statement_data: {
                    customer,
                    salesrep,
                    total_amount,
                    discount,
                    type,
                    items (see statement_items): [ product_id, quantity, unit_price, markup_percentage ]
                },
        }
        """
        print(request.data)
        order_data = request.data.pop("order_data", {})
        items_data = order_data.pop("items", [])
        statement_data = request.data.pop("statement_data", {})
        try:
            with transaction.atomic():
                quotation_id = order_data.pop("quotation_id", None)

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

                    order = Order.objects.create(
                        statement=statement,
                        quotation=Quotation.objects.get(pk=quotation_id),
                        **order_data,
                    )

                    # if project based, create an external project request
                    # if statement.type == Statement.Type.PROJECT_BASED:
                    #     ExternalProjectRequest.objects.create(
                    #         ext_project_name=
                    #     )
                    # if non-project based, get bill of materials

                    return Response(
                        OrderSerializer(order).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)

        ## TODO: Raise Sales Order to Project Management
        ## TODO: update stocks
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)
