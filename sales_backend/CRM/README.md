# Quotation

## CREATE A CAMPAIGN (/api/sales/crm/campaigns/)

Perform a **POST** request to /api/sales/crm/campaigns/. Provided below is a sample format for the request body:

```
{
    "type": "Email",
    "status": "Planned",
    "campaign_name": "Exclusive Discount for Companies",
    "start_date": "2025-03-04",
    "end_date":  "2025-03-04",
}

```

## CREATE A CAMPAIGN CONTACT (/api/sales/crm/campaign-contacts/)

Perform a **POST** request to /api/sales/crm/campaign-contacts/. Provided below is a sample format for the request body:

```
{
    "campaign_id": 5,
    "contacts": [
        {
            "lead_id": 3,
            "response_status": "Pending"
        },
        {
            "lead_id": 4,
            "response_status": "Pending"
        }
    ]
}

```
