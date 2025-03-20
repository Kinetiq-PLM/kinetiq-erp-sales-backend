# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ChartOfAccounts(models.Model):
    account_id = models.CharField(primary_key=True, max_length=255)
    account_name = models.CharField(max_length=255)
    account_type = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = "accounting.chart_of_accounts"


class Currency(models.Model):
    currency_id = models.CharField(primary_key=True, max_length=255)
    currency_name = models.CharField(max_length=255)
    exchange_rate = models.DecimalField(max_digits=15, decimal_places=6)
    is_active = models.BooleanField()

    class Meta:
        managed = False
        db_table = '"accounting"."currency"'


class GeneralLedgerAccounts(models.Model):
    gl_account_id = models.CharField(primary_key=True, max_length=255)
    account_name = models.CharField(max_length=255)
    account_code = models.IntegerField()
    account_id = models.CharField(max_length=255, blank=True, null=True)
    status = models.TextField()  # This field type is a guess.
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"accounting"."general_ledger_accounts"'


class JournalEntries(models.Model):
    journal_id = models.CharField(primary_key=True, max_length=255)
    journal_date = models.DateField()
    description = models.CharField(max_length=255, blank=True, null=True)
    total_debit = models.DecimalField(max_digits=15, decimal_places=2)
    total_credit = models.DecimalField(max_digits=15, decimal_places=2)
    invoice_id = models.CharField(max_length=255, blank=True, null=True)
    currency_id = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = '"accounting"."journal_entries"'


class JournalEntryLines(models.Model):
    entry_line_id = models.CharField(primary_key=True, max_length=255)
    gl_account_id = models.CharField(max_length=255, blank=True, null=True)
    journal_id = models.CharField(max_length=255)
    debit_amount = models.DecimalField(max_digits=15, decimal_places=2)
    credit_amount = models.DecimalField(max_digits=15, decimal_places=2)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = '"accounting"."journal_entry_lines"'
