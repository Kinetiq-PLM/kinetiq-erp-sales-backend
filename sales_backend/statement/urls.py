from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r"statement", views.StatementViewSet, basename="statement")
router.register(
    r"statement-item", views.StatementItemViewSet, basename="statement-item"
)

urlpatterns = [
    path("", include(router.urls)),
]
