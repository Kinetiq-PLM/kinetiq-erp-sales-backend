from rest_framework import serializers
from .models import *
from customer.serializers import Customer, CustomerSerializer
from django.shortcuts import get_object_or_404
from misc.urls import EmployeesSerializer, Employees


class LeadsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Leads
        fields = "__all__"


class CampaignContactsSerializer(serializers.ModelSerializer):
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    campaign = serializers.PrimaryKeyRelatedField(queryset=Campaigns.objects.all())

    class Meta:
        model = CampaignContacts
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["customer"] = CustomerSerializer(instance.customer).data
        return data


class CampaignsSerializer(serializers.ModelSerializer):
    contacts = CampaignContactsSerializer(many=True, read_only=True)

    class Meta:
        model = Campaigns
        fields = "__all__"


class CampaignStatusViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = CampaignStatusView
        fields = "__all__"


class OpportunitiesSerializer(serializers.ModelSerializer):
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employees.objects.all())

    class Meta:
        model = Opportunities
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["customer"] = CustomerSerializer(
            get_object_or_404(Customer, pk=data.pop("customer"))
        ).data
        data["salesrep"] = EmployeesSerializer(
            get_object_or_404(Employees, pk=data.pop("salesrep"))
        ).data
        return data


class TicketConvoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TicketConvo
        fields = "__all__"


class TicketSerializer(serializers.ModelSerializer):
    conversations = TicketConvoSerializer(many=True, read_only=True)
    customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
    salesrep = serializers.PrimaryKeyRelatedField(queryset=Employees.objects.all())

    class Meta:
        model = Ticket
        fields = "__all__"
