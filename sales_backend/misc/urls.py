from .admin.models import Products
from rest_framework import viewsets
from rest_framework.routers import DefaultRouter
from django.urls import path, include
from rest_framework.response import Response
from rest_framework import serializers


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = "__all__"


class Products(viewsets.ModelViewSet):
    queryset = Products.objects.all()
    serializer_class = ProductSerializer


router = DefaultRouter()
router.register("product", Products)
urlpatterns = [path("", include(router.urls))]
