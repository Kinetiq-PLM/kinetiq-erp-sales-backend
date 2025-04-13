from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework import status
from django.shortcuts import get_object_or_404
from django.db import transaction


class CampaignsViewSet(viewsets.ModelViewSet):
    queryset = Campaigns.objects.all().order_by("-end_date")
    serializer_class = CampaignsSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        filter = {}
        if status:
            filter["status__in"] = status.split(",")

        campaigns = CampaignStatusView.objects.filter(**filter).order_by("-end_date")
        return Response(CampaignStatusViewSerializer(campaigns, many=True).data)

    def create(self, request, *args, **kwargs):
        created = Campaigns.objects.create(**request.data)
        return Response(
            CampaignStatusViewSerializer(
                get_object_or_404(CampaignStatusView, pk=created.campaign_id)
            ).data
        )

    def update(self, request: Request, *args, **kwargs):
        """inputs:
        {
            contacts: [customer_id]
        }
        """
        contacts = request.data.get("contacts", [])
        remove = request.data.get("remove", [])
        try:
            with transaction.atomic():
                campaign = self.get_object()
                for contact in contacts:
                    exists = CampaignContacts.objects.filter(
                        campaign=campaign, customer=contact
                    ).exists()
                    if not exists:
                        contact_serializer = CampaignContactsSerializer(
                            data={
                                "customer": contact,
                                "campaign": campaign.campaign_id,
                            }
                        )
                        if contact_serializer.is_valid():
                            contact_serializer.save()
                        else:
                            raise Exception(contact_serializer.errors)
                for contact in remove:
                    c = CampaignContacts.objects.filter(
                        campaign=campaign, customer=contact
                    )
                    if c.exists():
                        c.delete()

                campaign.refresh_from_db()
                return Response(CampaignsSerializer(campaign).data)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)


class CampaignContactsViewSet(viewsets.ModelViewSet):
    queryset = CampaignContacts.objects.all()
    serializer_class = CampaignContactsSerializer


class OpportunitiesViewSet(viewsets.ModelViewSet):
    queryset = Opportunities.objects.all()
    serializer_class = OpportunitiesSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        customer = params.get("customer")
        filtered = {}
        if customer:
            filtered["customer__customer_id"] = customer

        return Response(
            self.serializer_class(self.queryset.filter(**filtered), many=True).data
        )


class TicketViewSet(viewsets.ModelViewSet):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer


class TicketConvoViewSet(viewsets.ModelViewSet):
    queryset = TicketConvo.objects.all()
    serializer_class = TicketConvoSerializer
