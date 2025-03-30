from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from django.db import transaction
from rest_framework import status
from quotation.models import Quotation
from datetime import date
from dateutil.relativedelta import relativedelta


class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all().order_by("-order_date")
    serializer_class = OrderSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        order_status = params.get("order_status")
        order_type = params.get("order_type")
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
        filters = {}
        if order_status:
            filters["order_status"] = order_status
        if order_type:
            filters["order_type"] = order_type
        if period:
            filters["order_date__range"] = (start_date, end_date)

        return Response(
            self.serializer_class(self.queryset.filter(**filters), many=True).data
        )

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
                    data = {"statement": statement, **order_data}
                    quotation = Quotation.objects.filter(pk=quotation_id)
                    # set quotation as approved
                    if quotation.exists():
                        quotation = quotation.get()
                        data["quotation"] = quotation
                        quotation.status = Quotation.Status.APPROVED
                        quotation.save()

                    order = Order.objects.create(**data)

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
