from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import StatementItem
from django.db.models import Sum
from decimal import Decimal


@receiver(post_save, sender=StatementItem)
def update_demand_level(sender, instance, **kwargs):
    # Define threshold levels
    MEDIUM_THRESHOLD = 25
    HIGH_THRESHOLD = 45

    total_sales = StatementItem.objects.aggregate(total=Sum("quantity"))["total"] or 0
    if total_sales > 0:  # Avoid division by zero
        # Get total quantity of the specific product sold
        product_sales = (
            StatementItem.objects.filter(product_id=instance.product_id).aggregate(
                total=Sum("quantity")
            )["total"]
            or 0
        )

        # Calculate the percentage of this product's sales
        percentage = (product_sales / total_sales) * 100

        # Determine demand level
        if percentage >= HIGH_THRESHOLD:
            new_demand_level = StatementItem.DemandLevel.HIGH
            new_markup = Decimal(60.00)  # High demand → 80% markup
        elif percentage >= MEDIUM_THRESHOLD:
            new_demand_level = StatementItem.DemandLevel.MEDIUM
            new_markup = Decimal(40.00)  # Medium demand → 60% markup
        else:
            new_demand_level = StatementItem.DemandLevel.LOW
            new_markup = Decimal(20.00)  # Low demand → 20% markup

        # Update instance if values have changed
        updates = {}
        if instance.demand_level != new_demand_level:
            updates["demand_level"] = new_demand_level
        if instance.markup_percentage != new_markup:
            updates["markup_percentage"] = new_markup

        # Apply updates if any changes were made
        if updates:
            for key, value in updates.items():
                setattr(instance, key, value)
            instance.save(update_fields=list(updates.keys()))
