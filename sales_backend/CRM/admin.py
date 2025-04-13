from django.contrib import admin
from .models import *

admin.site.register(CampaignContacts)
admin.site.register(Campaigns, CampaignsAdmin)
admin.site.register(Opportunities)
admin.site.register(Ticket, TicketAdmin)
admin.site.register(TicketConvo)
