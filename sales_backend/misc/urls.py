from .admin.models import Products
from rest_framework import viewsets
from rest_framework.routers import DefaultRouter
from django.urls import path, include
from rest_framework import serializers
from .human_resources.models import Employees
from rest_framework.request import Request
from rest_framework.response import Response
from .admin.models import BusinessPartnerMaster


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = "__all__"


class ProductsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Products.objects.all()
    serializer_class = ProductSerializer


class EmployeesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employees
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["name"] = f"{data['first_name']} {data['last_name']}"
        return data


class EmployeesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Employees.objects.all()
    serializer_class = EmployeesSerializer


class BusinessPartnerSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusinessPartnerMaster
        fields = "__all__"


class BusinessPartnerViewSet(viewsets.ModelViewSet):
    queryset = BusinessPartnerMaster.objects.all()
    serializer_class = BusinessPartnerSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        category = params.get("category")
        filter = {}
        if category:
            filter["category"] = category

        filtered = self.queryset.filter(**filter)
        return Response(self.serializer_class(filtered, many=True).data)


router = DefaultRouter()
router.register("product", ProductsViewSet)
router.register("employee", EmployeesViewSet)
router.register("business-partners", BusinessPartnerViewSet)
urlpatterns = [path("", include(router.urls))]
