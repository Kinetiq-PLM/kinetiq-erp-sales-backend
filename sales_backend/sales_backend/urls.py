from django.urls import path, include
from statement.views import *

urlpatterns = [
    path(
        "api/sales/",
        include(
            [
                path("agreement/", include("agreement.urls")),
                path("", include("costing.urls")),
                path("customer/", include("customer.urls")),
                path("delivery/", include("delivery.urls")),
                path("", include("invoice.urls")),
                path("order/", include("order.urls")),
                path("quotation/", include("quotation.urls")),
                path("reporting/", include("reporting.urls")),
                path("", include("statement.urls")),
            ]
        ),
    ),
    path("api/crm/", include("CRM.urls")),
    path("api/misc/", include("misc.urls")),
]
