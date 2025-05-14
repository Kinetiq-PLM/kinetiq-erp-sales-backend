from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response


from django.db.models import Sum, Prefetch
from misc.inventory.models import InventoryItem

inventory_qs = InventoryItem.objects.select_related("warehouse")  # JOIN warehouse now


class ProductPricingViewSet(viewsets.ModelViewSet):
    serializer_class = ProductPricingSerializer

    def get_queryset(self):
        return (
            ProductPricing.objects.select_related("admin_product")
            .prefetch_related(
                Prefetch(
                    "admin_product__inventoryitem_set",
                    queryset=InventoryItem.objects.select_related("warehouse"),
                    to_attr="prefetched_inventory",
                )
            )
            .annotate(stock_level=Sum("admin_product__inventoryitem__current_quantity"))
            .order_by("admin_product__item_name")
        )

    def list(self, request, *args, **kwargs):
        params = request.query_params
        product = params.get("admin_product")
        filters = {}
        if product:
            filters["admin_product_id"] = product

        data = self.serializer_class(
            self.get_queryset().filter(**filters), many=True
        ).data
        final = []
        for item in data:
            if item["inventory_items"]:
                final.append(item)

        return Response(final)
