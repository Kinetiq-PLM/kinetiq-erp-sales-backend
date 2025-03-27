from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from .models import Order  # Import your model
from delivery.models import ShippingDetails

# Store previous values before saving
old_values = {}


@receiver(pre_save, sender=Order)
def store_old_values(sender, instance, **kwargs):
    """Store the old values of goods_issue_id and rework_id before saving"""
    if instance.pk:  # Ensure instance exists in the DB
        old_instance = sender.objects.get(pk=instance.pk)
        old_values[instance.pk] = {
            "goods_issue_id": old_instance.goods_issue_id,
            "rework_id": old_instance.rework_id,
        }


@receiver(post_save, sender=Order)
def check_field_changes(sender, instance, **kwargs):
    """Check if goods_issue_id or rework_id changed from None to a value"""
    if instance.pk in old_values:
        old_data = old_values.pop(instance.pk)
        old_goods_issue = old_data["goods_issue_id"]
        old_rework = old_data["rework_id"]
        new_goods_issue = instance.goods_issue_id
        new_rework = instance.rework_id

        # Check if goods_issue_id changed from None to a value
        if old_goods_issue is None and new_goods_issue is not None:
            instance.order_status = Order.Status.DELIVERED
            instance.save(update_fields=["order_status"])

            try:
                shipping_details = ShippingDetails.objects.get(
                    order_id=instance.order_id
                )
                shipping_details.delivery_status = ShippingDetails.Status.DELIVERED
                shipping_details.save(update_fields=["delivery_status"])
            except ShippingDetails.DoesNotExist:
                pass  # Handle missing ShippingDetails case if necessary

        # Check if rework_id changed from None to a value
        if old_rework is None and new_rework is not None:
            instance.order_status = Order.Status.CANCELLED
            instance.save(update_fields=["order_status"])

            try:
                shipping_details = ShippingDetails.objects.get(
                    order_id=instance.order_id
                )
                shipping_details.delivery_status = ShippingDetails.Status.RETURNED
                shipping_details.save(update_fields=["delivery_status"])
            except ShippingDetails.DoesNotExist:
                pass  # Handle missing ShippingDetails case if necessary
