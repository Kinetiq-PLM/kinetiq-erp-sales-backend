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
