from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r"invoice", views.SalesInvoicesViewSet)
router.register(r"payment", views.PaymentsViewSet)
router.register(r"receipt", views.ReceiptViewSet)

urlpatterns = [path("", include(router.urls))]
