from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404


class LeadsViewSet(viewsets.ModelViewSet):
    queryset = Leads.objects.all()
    serializer_class = LeadsSerializer


class CampaignsViewSet(viewsets.ModelViewSet):
    queryset = Campaigns.objects.all()
    serializer_class = CampaignsSerializer


class CampaignContactsViewSet(viewsets.ModelViewSet):
    queryset = CampaignContacts.objects.all()
    serializer_class = CampaignContactsSerializer

    def create(self, request, *args, **kwargs):
        contacts_data = request.data.pop("contacts")
        campaign_id = request.data.pop("campaign_id")
        campaign = get_object_or_404(Campaigns, pk=campaign_id)
        contacts = []
        for contact in contacts_data:
            lead_id = contact.pop("lead_id")
            lead = get_object_or_404(Leads, pk=lead_id)
            data = {**contact, "campaign_id": campaign, "lead_id": lead}
            contacts.append(CampaignContacts(**data))
        created = CampaignContacts.objects.bulk_create(contacts)
        return Response(
            CampaignContactsSerializer(created, many=True).data,
            status=status.HTTP_201_CREATED,
        )


class OpportunitiesViewSet(viewsets.ModelViewSet):
    queryset = Opportunities.objects.all()
    serializer_class = OpportunitiesSerializer


class TicketViewSet(viewsets.ModelViewSet):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer


class TicketConvoViewSet(viewsets.ModelViewSet):
    queryset = TicketConvo.objects.all()
    serializer_class = TicketConvoSerializer
