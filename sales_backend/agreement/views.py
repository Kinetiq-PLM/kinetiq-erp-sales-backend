from rest_framework import viewsets
from .serializers import *


class BlanketAgreementViewSet(viewsets.ModelViewSet):
    queryset = BlanketAgreement.objects.all().order_by("-start_date")
    serializer_class = BlanketAgreementSerializer
