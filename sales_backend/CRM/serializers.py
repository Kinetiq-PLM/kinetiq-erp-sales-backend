from rest_framework import serializers
from .models import *


class LeadsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Leads
        fields = "__all__"


class CampaignContactsSerializer(serializers.ModelSerializer):
    class Meta:
        model = CampaignContacts
        fields = "__all__"


class CampaignsSerializer(serializers.ModelSerializer):
    contacts = CampaignContactsSerializer(many=True, read_only=True)

    class Meta:
        model = Campaigns
        fields = "__all__"


class OpportunitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Opportunities
        fields = "__all__"


class TicketConvoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TicketConvo
        fields = "__all__"


class TicketSerializer(serializers.ModelSerializer):
    conversations = TicketConvoSerializer(many=True, read_only=True)

    class Meta:
        model = Ticket
        fields = "__all__"
