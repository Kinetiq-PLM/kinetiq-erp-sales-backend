from django.shortcuts import render
from .serializers import *
from rest_framework import viewsets
from django.db.models import Prefetch


class StatementViewSet(viewsets.ModelViewSet):
    # queryset = Statement.objects.all()
    serializer_class = StatementSerializer

    def get_queryset(self):
        # Optimize by prefetching all related data
        statement_items = StatementItem.objects.select_related("inventory_item")

        return (
            Statement.objects.select_related("customer", "salesrep")
            .prefetch_related(Prefetch("statementitem_set", queryset=statement_items))
            .order_by("-created_at")
        )


class StatementItemViewSet(viewsets.ModelViewSet):
    # queryset = StatementItem.objects.all()
    serializer_class = StatementItemSerializer

    def get_queryset(self):
        return StatementItem.objects.select_related(
            "statement", "inventory_item"
        ).order_by("-created_at")
