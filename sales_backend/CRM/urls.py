from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r"campaigns", views.CampaignsViewSet)
router.register(r"campaign-contacts", views.CampaignContactsViewSet)
router.register(r"opportunities", views.OpportunitiesViewSet)
router.register(r"ticket", views.TicketViewSet)
router.register(r"ticket-convo", views.TicketConvoViewSet)


urlpatterns = [
    path("", include(router.urls)),
    path("reporting/conversion", views.get_customer_type_report),
    path("reporting/dashboard", views.get_dashboard_stats),
]
