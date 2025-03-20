"""
URL configuration for sales_backend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

import pkgutil
import importlib
from django.contrib import admin
from django.urls import path, include
from django.apps import apps

app_config = apps.get_app_config("misc")
for module_info in pkgutil.iter_modules(app_config.module.__path__):
    module_name = f"{app_config.name}.{module_info.name}"
    # Import the submodule dynamically
    module = importlib.import_module(module_name)

    # If the submodule has a 'models' attribute (models.py exists)
    if hasattr(module, "models"):
        # Get all model classes in the submodule
        for model_name in dir(module.models):
            model = getattr(module.models, model_name)
            # Ensure it's a Django model before registering
            if isinstance(model, type) and hasattr(model, "_meta"):
                admin.site.register(model)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/sales/agreement/", include("agreement.urls")),
    path("api/sales/crm/", include("CRM.urls")),
    path("api/sales/costing/", include("costing.urls")),
    path("api/sales/customer/", include("customer.urls")),
    path("api/sales/delivery/", include("delivery.urls")),
    path("api/sales/dunning/", include("dunning.urls")),
    path("api/sales/invoice/", include("invoice.urls")),
    path("api/sales/order/", include("order.urls")),
    path("api/sales/quotation/", include("quotation.urls")),
    path("api/sales/reporting/", include("reporting.urls")),
]
