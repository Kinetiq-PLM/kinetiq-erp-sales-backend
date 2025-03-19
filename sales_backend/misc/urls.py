from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r"employee", views.EmployeeViewSet)
router.register(r"policies", views.PoliciesViewSet)
router.register(r"product", views.ProductViewSet)
router.register(r"chart-of-accounts", views.ChartOfAccountsViewSet)
router.register(r"general-ledger-accounts", views.GeneralLedgerAccountsViewSet)
router.register(r"business-partner-master", views.BusinessPartnerMasterViewSet)
router.register(r"rework-order", views.ReworkOrderViewSet)
router.register(r"goods-issue", views.GoodsIssueViewSet)
router.register(r"bom", views.BOMViewSet)
router.register(r"non-project-order-pricing", views.NonProjectOrderPricingViewSet)
router.register(r"raw-materials", views.RawMaterialsViewSet)

urlpatterns = [path("", include(router.urls))]
