from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r"statement", views.StatementViewSet)
router.register(r"statement-item", views.StatementItemViewSet)
# urlpatterns = [path("", views.StatementListCreateView.as_view()),
#                path("<int:pk>", views.StatementRetrieveUpdateDestroyView.as_view()),
#                path("item/", include(item_router.urls))]

urlpatterns = [
    path("", include(router.urls)),
]
