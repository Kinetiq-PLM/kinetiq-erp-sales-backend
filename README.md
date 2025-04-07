# Kinetiq ERP Sales Module

## To set up locally:

### Clone the repo

```
$ git clone https://github.com/Kinetiq-PLM/kinetiq-erp-sales-backend
```

### Create and activate virtual environment

```
$ cd kinetiq-erp-sales-backend
$ python -m venv venv
$ source venv/scripts/activate
```

### Install requirements

```
$ pip install -r requirements.txt
```

### Change [sales_backend/settings.py](./sales_backend/sales_backend/settings.py) database credentials

```
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": "kinetiq_revised",
        "USER": <your_username>,
        "PASSWORD": <your_password>,
        "HOST": "localhost",
        "PORT": "<your_psql_port>",
    }
}
```

### Create database

```
$ psql -U <username> -c "CREATE DATABASE kinetiq_revised;"
$ psql -U <username> kinetiq_revised < kinetiq_revised.sql
```

### Create superuser (for admin)

```
$ python manage.py createsuperuser
```

### Run server

```
$ python manage.py runserver
```

# Sales Process Documentation

## Blanket Agreement

- A long-term purchase or sales agreement made with a customer that outlines recurring transactions over a defined period.

## Quotation

- Used to provide buyer with an estimate of the total cost of the purchase
- Does not trigger projects/orders/deliveries
- Status becomes 'Approved' once converted into an order. Becomes 'Expired' after 7 days.

## Order

- A document that records a customer's request to purchase products
- Triggers projects only if customer fills out custom specifications
- Project-based orders are subject to approval (status is retrieved from PM). A record is automatically inserted to PM's external_project_request table.

### To simulate a project order:

- Create a row for PM external_project_details and add the generated external_project_request_id.
- Create a row for management_approvals table, set the status of the approval.
- Add the approval id to the order's external_project_request
- The order view should update as necessary.

## Delivery

- A document used to record the actual shipment of goods to a customer
- Can only be generated from an existing order with a status of 'Open'.
- Supports partial and full delivery
- Delivery status is updated by Distribution through shipment_id.

### To simulate the update of delivery status:

- Create a shipment_detail from the distribution table
- Add its shipment_id to the existing delivery_note
- The delivery_note should now update depending on the delivery status of shipment_details.

## Invoice

- Automatically generated once delivery is submitted
- Contains total cost of the delivery and balance due
