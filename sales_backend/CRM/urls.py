from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r"campaigns", views.CampaignsViewSet)
router.register(r"campaign-contacts", views.CampaignContactsViewSet)
router.register(r"leads", views.LeadsViewSet)
router.register(r"opportunities", views.OpportunitiesViewSet)
router.register(r"ticket", views.TicketViewSet)
router.register(r"ticket-convo", views.TicketConvoViewSet)


urlpatterns = [path("", include(router.urls))]
