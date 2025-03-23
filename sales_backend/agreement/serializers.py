from rest_framework import serializers
from .models import *
from statement.serializers import Statement, StatementSerializer


class BlanketAgreementSerializer(serializers.ModelSerializer):
    statement = serializers.SerializerMethodField()

    class Meta:
        model = BlanketAgreement
        fields = "__all__"

    def get_statement(self, obj):
        if obj.statement:
            stmt = Statement.objects.get(pk=obj.statement.statement_id)
            return StatementSerializer(stmt).data
        return None
