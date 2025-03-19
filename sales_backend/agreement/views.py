from rest_framework import viewsets
from .serializers import *


class BlanketAgreementViewSet(viewsets.ModelViewSet):
    queryset = BlanketAgreement.objects.all()
    serializer_class = BlanketAgreementSerializer
