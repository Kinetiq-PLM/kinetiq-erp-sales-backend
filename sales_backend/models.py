# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BlanketAgreement(models.Model):
    agreement_id = models.CharField(primary_key=True, max_length=255)
    statement_id = models.CharField(max_length=255, blank=True, null=True)
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    description = models.TextField(blank=True, null=True)
    signed_date = models.DateTimeField(blank=True, null=True)
    agreement_method = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'blanket_agreement'


class CampaignContacts(models.Model):
    contact_id = models.CharField(primary_key=True, max_length=255)
    campaign_id = models.CharField(max_length=255, blank=True, null=True)
    response_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    customer = models.ForeignKey('Customers', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'campaign_contacts'


class Campaigns(models.Model):
    campaign_id = models.CharField(primary_key=True, max_length=255)
    campaign_name = models.CharField(max_length=255, blank=True, null=True)
    type = models.TextField(blank=True, null=True)  # This field type is a guess.
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'campaigns'


class Customers(models.Model):
    customer_id = models.CharField(primary_key=True, max_length=255)
    gl_account_id = models.CharField(max_length=255, blank=True, null=True)
    partner_id = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    email_address = models.CharField(unique=True, max_length=255, blank=True, null=True)
    phone_number = models.CharField(max_length=20, blank=True, null=True)
    address_line1 = models.CharField(max_length=255, blank=True, null=True)
    address_line2 = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    postal_code = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=100, blank=True, null=True)
    customer_type = models.TextField(blank=True, null=True)  # This field type is a guess.
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    debt = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    contact_person = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customers'


class Leads(models.Model):
    lead_id = models.CharField(primary_key=True, max_length=255)
    salesrep_id = models.CharField(max_length=255, blank=True, null=True)
    lead_name = models.CharField(max_length=255, blank=True, null=True)
    lead_email = models.CharField(unique=True, max_length=255, blank=True, null=True)
    lead_phonenum = models.CharField(max_length=20, blank=True, null=True)
    source = models.TextField(blank=True, null=True)  # This field type is a guess.
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'leads'


class Opportunities(models.Model):
    opportunity_id = models.CharField(primary_key=True, max_length=255)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    partner_id = models.CharField(max_length=255, blank=True, null=True)
    salesrep_id = models.CharField(max_length=255, blank=True, null=True)
    estimated_value = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    expected_closed_date = models.DateField(blank=True, null=True)
    stage = models.TextField(blank=True, null=True)  # This field type is a guess.
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    description = models.TextField(blank=True, null=True)
    reason_lost = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'opportunities'


class Orders(models.Model):
    order_id = models.CharField(primary_key=True, max_length=255)
    statement_id = models.CharField(max_length=255, blank=True, null=True)
    quotation_id = models.CharField(max_length=255, blank=True, null=True)
    rework_id = models.CharField(max_length=255, blank=True, null=True)
    goods_issue_id = models.CharField(max_length=255, blank=True, null=True)
    order_date = models.DateTimeField(blank=True, null=True)
    order_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    order_total_amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    order_type = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'orders'


class Payments(models.Model):
    payment_id = models.CharField(primary_key=True, max_length=255)
    order_id = models.CharField(max_length=255, blank=True, null=True)
    payment_method = models.TextField(blank=True, null=True)  # This field type is a guess.
    payment_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    payment_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'payments'


class ProductPricing(models.Model):
    product_id = models.CharField(max_length=255, blank=True, null=True)
    admin_product_id = models.CharField(max_length=255, blank=True, null=True)
    markup_percentage = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    selling_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    demand_level = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'product_pricing'


class Quotation(models.Model):
    quotation_id = models.CharField(primary_key=True, max_length=255)
    statement_id = models.CharField(max_length=255, blank=True, null=True)
    agreement_id = models.CharField(max_length=255, blank=True, null=True)
    date_issued = models.DateTimeField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'quotation'


class Receipt(models.Model):
    receipt_id = models.CharField(primary_key=True, max_length=255)
    shipping_id = models.CharField(max_length=255, blank=True, null=True)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    payments_id = models.CharField(max_length=255, blank=True, null=True)
    policy_id = models.CharField(max_length=255, blank=True, null=True)
    date_signed = models.DateField(blank=True, null=True)
    signed_docu = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'receipt'


class RenewalWarranty(models.Model):
    renewal_id = models.CharField(primary_key=True, max_length=255)
    order_id = models.CharField(max_length=255, blank=True, null=True)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    payments_id = models.CharField(max_length=255, blank=True, null=True)
    service_request_id = models.CharField(max_length=255, blank=True, null=True)
    original_warranty_start = models.DateField(blank=True, null=True)
    original_warranty_end = models.DateField(blank=True, null=True)
    renewal_warranty_start = models.DateField(blank=True, null=True)
    renewal_warranty_end = models.DateField(blank=True, null=True)
    renewal_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    renewal_fee = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'renewal_warranty'


class Return(models.Model):
    return_id = models.CharField(primary_key=True, max_length=255)
    statement = models.ForeignKey('Statement', models.DO_NOTHING, blank=True, null=True)
    shipping = models.ForeignKey('ShippingDetails', models.DO_NOTHING, blank=True, null=True)
    return_date = models.DateTimeField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    remarks = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'return'


class SalesCosting(models.Model):
    sales_costing_id = models.CharField(primary_key=True, max_length=255)
    non_project_costing_id = models.CharField(max_length=255, blank=True, null=True)
    project_resources_id = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sales_costing'


class SalesInvoices(models.Model):
    invoice_id = models.CharField(primary_key=True, max_length=255)
    order_id = models.CharField(max_length=255, blank=True, null=True)
    invoice_date = models.DateTimeField(blank=True, null=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    invoice_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    payment_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    due_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sales_invoices'


class ShippingDetails(models.Model):
    shipping_id = models.CharField(primary_key=True, max_length=255)
    order_id = models.CharField(max_length=255, blank=True, null=True)
    operational_cost_id = models.CharField(max_length=255, blank=True, null=True)
    shipment_id = models.CharField(max_length=255, blank=True, null=True)
    shipping_method = models.TextField(blank=True, null=True)  # This field type is a guess.
    tracking_num = models.CharField(unique=True, max_length=50, blank=True, null=True)
    shipping_date = models.DateTimeField(blank=True, null=True)
    estimated_delivery = models.DateTimeField(blank=True, null=True)
    delivery_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    statement = models.ForeignKey('Statement', models.DO_NOTHING, blank=True, null=True)
    delivery_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shipping_details'


class Statement(models.Model):
    statement_id = models.CharField(primary_key=True, max_length=255)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    salesrep_id = models.CharField(max_length=255, blank=True, null=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    discount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    type = models.TextField(blank=True, null=True)  # This field type is a guess.
    total_tax = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'statement'


class StatementItem(models.Model):
    statement_item_id = models.CharField(primary_key=True, max_length=255)
    statement_id = models.CharField(max_length=255, blank=True, null=True)
    sales_costing_id = models.CharField(max_length=255, blank=True, null=True)
    product_id = models.CharField(max_length=255, blank=True, null=True)
    item_md_id = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    discount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    tax_amount = models.IntegerField(blank=True, null=True)
    return_reason = models.TextField(blank=True, null=True)
    return_action = models.TextField(blank=True, null=True)  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'statement_item'


class Ticket(models.Model):
    ticket_id = models.CharField(primary_key=True, max_length=255)
    customer_id = models.CharField(max_length=255, blank=True, null=True)
    salesrep_id = models.CharField(max_length=255, blank=True, null=True)
    subject = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    status = models.TextField(blank=True, null=True)  # This field type is a guess.
    priority = models.TextField(blank=True, null=True)  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ticket'


class TicketConvo(models.Model):
    convo_id = models.CharField(primary_key=True, max_length=255)
    ticket_id = models.CharField(max_length=255, blank=True, null=True)
    content = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ticket_convo'
