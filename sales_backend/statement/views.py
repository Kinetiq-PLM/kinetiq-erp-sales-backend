from django.shortcuts import render
from .serializers import *
from rest_framework import viewsets


class StatementViewSet(viewsets.ModelViewSet):
    queryset = Statement.objects.all()
    serializer_class = StatementSerializer


class StatementItemViewSet(viewsets.ModelViewSet):
    queryset = StatementItem.objects.all()
    serializer_class = StatementItemSerializer
