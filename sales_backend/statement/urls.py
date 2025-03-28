from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r"statement", views.StatementViewSet)
router.register(r"statement-item", views.StatementItemViewSet)

urlpatterns = [
    path("", include(router.urls)),
]
