from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r"costing", views.SalesCostingViewSet)
router.register(r"products", views.ProductPricingViewSet, basename="product-pricing")


urlpatterns = [path("", include(router.urls))]
