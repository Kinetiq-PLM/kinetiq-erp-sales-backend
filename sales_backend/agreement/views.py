from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from django.db import transaction
from statement.serializers import *
from rest_framework import status
from datetime import date
from dateutil.relativedelta import relativedelta
from rest_framework.decorators import action
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from textwrap import wrap
from utils import *
from django.http import HttpResponse
from datetime import datetime


class BlanketAgreementViewSet(viewsets.ModelViewSet):
    queryset = AgreementView.objects.all().order_by("-start_date")
    serializer_class = BlanketAgreementSerializer

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        period = params.get("period")
        method = params.get("agreement_method")
        start_date = date.today()
        end_date = date.today()
        match period:
            case "month":
                start_date = date.today() - relativedelta(months=1)
            case "year":
                start_date = date.today() - relativedelta(years=1)
            case "all":
                start_date = datetime.fromtimestamp(0).date()
            case "day":
                pass
            case other:
                if other is not None:
                    return Response(
                        {"error": "invalid period"}, status=status.HTTP_400_BAD_REQUEST
                    )

        filtered = {}
        if status:
            filtered["status"] = status
        if period:
            filtered["start_date__range"] = (start_date, end_date)
        if method:
            filtered["agreement_method"] = method

        return Response(
            AgreementViewSerializer(self.queryset.filter(**filtered), many=True).data
        )

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            statement_data: {
                customer,
                salesrep,
                total_amount,
                discount,
                type,
                total_tax,
                items (see statement_items): [
                    product,
                    quantity,
                    unit_price,
                    total_price,
                    markup_percentage (optional),
                    demand_level (default 'Low'),
                    discount,
                    tax_amount
                ]
            },
            agreement_data: {
                status,
                start_date,
                end_date,
                description,
                agreement_method
            },
        }
        """

        agreement_data = request.data.pop("agreement_data", {})
        statement_data = request.data.pop("statement_data", {})
        items_data = statement_data.pop("items", [])

        try:
            with transaction.atomic():
                statement_serializer = StatementSerializer(
                    data=statement_data, context={"items": items_data}
                )
                if statement_serializer.is_valid():
                    statement: Statement = statement_serializer.save()
                    for item_data in items_data:
                        item_data["statement"] = statement.statement_id
                        item_serializer = StatementItemSerializer(data=item_data)
                        if item_serializer.is_valid():
                            item_serializer.save()
                        else:
                            raise Exception(item_serializer.errors)

                    agreement = BlanketAgreement.objects.create(
                        statement=statement, **agreement_data
                    )

                    return Response(
                        BlanketAgreementSerializer(agreement).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        agreement = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="agreement_{agreement.agreement_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # agreement Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(colors.black)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        formatted_signed_date = agreement.signed_date.strftime("%B %d, %Y")

        pdf.setFont("Inter-Regular", 16)
        gap = height - 30
        pdf.drawString(((width - 80) / 2) - 45, gap, "BLANKET AGREEMENT")
        gap -= 35
        pdf.setFont("Inter-Regular", 10)
        pdf.drawString(
            left,
            gap,
            f"This Agreement is made on {formatted_signed_date} between:",
        )
        gap -= 15

        table_data = [
            ["Customer:", "Seller:"],
            [
                Paragraph(
                    f"{agreement.statement.customer.name}<br/>{agreement.statement.customer.address_line1} {agreement.statement.customer.address_line2}",
                    style=style,
                ),
                Paragraph(
                    "Kinetiq Company<br/>1975 Street Address of Company, NCR, Philippines",
                    style=style,
                ),
            ],
        ]

        col_width = (width - 60) / len(table_data[0])
        max_width = 350
        table = Table(table_data, colWidths=[col_width] * len(table_data[0]))
        table.setStyle(
            TableStyle(
                [
                    ("TEXTCOLOR", (0, 0), (-1, 0), colors.black),
                    ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                    ("FONTNAME", (0, 0), (-1, -1), "Inter-Regular"),
                    ("FONTNAME", (0, 0), (-1, 0), "Inter-Bold"),
                    ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                ]
            )
        )
        table.wrapOn(pdf, 400, 600)
        gap -= table._height
        table.drawOn(pdf, left - 5, gap)

        gap -= 30

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"1. PURPOSE",
        )
        gap -= 20
        p = Paragraph(
            '<font size="10">This Agreement sets forth the terms under which the Buyer may procure goods/services from the Supplier as needed.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 20

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"2. TERM",
        )
        gap -= 20
        formatted_start_date = agreement.start_date.strftime("%B %d, %Y")
        formatted_end_date = agreement.end_date.strftime("%B %d, %Y")
        p = Paragraph(
            f'<font size="10">This Agreement shall be effective from {formatted_start_date} to {formatted_end_date}, unless terminated earlier.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)

        gap -= 20

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"3. PRICING",
        )
        gap -= 20

        p = Paragraph(
            f'<font size="10">The goods/services shall be provided at the following rates:</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 15

        items = [
            [
                Paragraph(
                    f"{item['product']['product_name']}<br /><font color='#787878'>{item['product']['description']}</font>",
                    style=style,
                ),
                Paragraph(str(item["quantity"]), style=style),
                Paragraph("{0:,.2f}".format(float(item["discount"])), style=style),
                Paragraph(
                    (
                        "-"
                        if item["special_requests"]
                        else "{0:,.2f}".format(float(item["unit_price"]))
                    ),
                    style=style,
                ),
                Paragraph(
                    "{0:,.2f}".format(
                        float(item["total_price"]) - float(item["discount"])
                    ),
                    style=style,
                ),
            ]
            for item in StatementSerializer(agreement.statement).get_items(
                agreement.statement
            )
        ]
        max_items_first_page = 6
        max_items_rest = 12
        num_pages = 1
        if len(items) > max_items_first_page:
            num_pages = 1 + (
                (len(items) - max_items_first_page) // max_items_rest
                + (1 if (len(items) - max_items_first_page) % max_items_rest else 0)
            )

        page = 0
        next_section_y = 0
        start_index = page * max_items_first_page
        end_index = start_index + max_items_first_page
        agreement_data = [
            [
                "Item & Description",
                "QTY",
                "Discount",
                "Unit Price",
                "Total",
            ],
            *items[start_index:end_index],
        ]
        agreement_table = Table(agreement_data, colWidths=[285, 40, 50, 80, 80])
        agreement_table.setStyle(
            TableStyle(
                [
                    ("BACKGROUND", (0, 0), (-1, 0), accent_color),
                    ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
                    ("FONTNAME", (0, 0), (-1, -1), "Inter-Regular"),
                    ("FONTSIZE", (0, 0), (-1, -1), 9),
                    ("TOPPADDING", (0, 0), (-1, -1), 10),
                    ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
                    ("GRID", (0, 0), (-1, -1), 0.5, colors.black),
                    ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                    ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                ]
            )
        )
        agreement_table_width, agreement_table_height = agreement_table.wrap(
            width, height
        )
        gap -= agreement_table._height
        agreement_table.drawOn(
            pdf,
            left,
            gap,
        )
        page += 1

        if num_pages == 1 and len(items) >= 5:
            pdf.setFont("Inter-Regular", 11)
            p = Paragraph(
                f'<font size="11"><i>(Continued)</i></font>',
                style=style,
            )
            p.wrapOn(pdf, width, height)
            p.drawOn(pdf, ((width - 60) / 2 - 5), gap - 50)
            draw_page(pdf, page, num_pages + 1)
        else:
            draw_page(pdf, page, num_pages)

        while page < num_pages:
            pdf.showPage()
            # next_y = draw_agreement_header(pdf)
            start_index = end_index
            end_index = start_index + max_items_rest
            agreement_data = [
                [
                    "Product ID",
                    "Item & Description",
                    "QTY",
                    "Discount",
                    "Unit Price",
                    "Total",
                ],
                *items[start_index:end_index],
            ]

            agreement_table = Table(agreement_data, colWidths=[80, 215, 30, 50, 80, 80])
            agreement_table.setStyle(
                TableStyle(
                    [
                        ("BACKGROUND", (0, 0), (-1, 0), accent_color),
                        ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
                        ("FONTNAME", (0, 0), (-1, -1), "Inter-Regular"),
                        ("FONTSIZE", (0, 0), (-1, -1), 9),
                        ("TOPPADDING", (0, 0), (-1, -1), 10),
                        ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
                        ("GRID", (0, 0), (-1, -1), 1, colors.black),
                        ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                    ]
                )
            )
            if len(agreement_data) > 1:
                agreement_table_width, agreement_table_height = agreement_table.wrap(
                    width, height
                )
                agreement_table.drawOn(
                    pdf, left, (height * 0.95) - agreement_table._height
                )
            page += 1
            if agreement_table._height >= 700:
                draw_page(pdf, page, num_pages + 1)
            else:
                draw_page(pdf, page, num_pages)

        next_section_y = (
            height - agreement_table._height - 75 if num_pages > 1 else (gap - 30)
        )
        if agreement_table._height >= 700 or (num_pages == 1 and len(items) >= 5):
            next_section_y = height * 0.95
            num_pages += 1
            pdf.showPage()
            draw_page(pdf, page + 1, num_pages)

        gap = next_section_y
        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"4. ORDERING",
        )
        gap -= 20

        p = Paragraph(
            f'<font size="10">Orders shall be placed by the Buyer via <b>{agreement.agreement_method}</b> method, referencing this Agreement Number <b>{"".join(agreement.agreement_id.split("-")[2:])}</b>.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 20

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"5. DELIVERY",
        )
        gap -= 20

        p = Paragraph(
            f'<font size="10">All deliveries must be made to <b>{agreement.statement.customer.address_line1} {agreement.statement.customer.address_line2}</b>.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 20

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"6. TERMINATION",
        )
        gap -= 20

        p = Paragraph(
            f'<font size="10">This agreement is not subject to termination by either party for convenience.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 20

        pdf.setFont("Inter-Bold", 11)
        pdf.setFillColor(accent_color)
        pdf.drawString(
            left,
            gap,
            f"6. CONFIDENTIALITY",
        )
        gap -= 20

        p = Paragraph(
            f'<font size="10">Both parties agree to maintain confidentiality of shared information.</font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)
        gap -= 40

        p = Paragraph(
            f'<font size="11"><i>IN WITNESS WHEREOF, the parties have executed this Agreement as of the date first above written.</i></font>',
            style=style,
        )
        p.wrapOn(pdf, width, height)
        p.drawOn(pdf, left, gap)

        table_data = [
            ["Customer Representative", "Seller Representative"],
            [
                Paragraph(
                    f"""
                    <b>Signature:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>______________<br/>
                    <b>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><u>{agreement.statement.customer.contact_person}</u><br/>
                    <b>Date Signed:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><u>{formatted_signed_date}</u>""",
                    style=style,
                ),
                Paragraph(
                    f"""
                    <b>Signature:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>______________<br/>
                    <b>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><u>{agreement.statement.salesrep.first_name} {agreement.statement.salesrep.last_name}</u><br/>
                    <b>Date Signed:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><u>{formatted_signed_date}</u>""",
                    style=style,
                ),
            ],
        ]

        col_width = (width - 60) / len(table_data[0])
        table = Table(table_data, colWidths=[col_width + 90, col_width - 90])
        table.setStyle(
            TableStyle(
                [
                    ("TEXTCOLOR", (0, 0), (-1, 0), accent_color),
                    ("FONTSIZE", (0, 0), (-1, -1), 11),
                    ("FONTSIZE", (0, 0), (-1, 0), 12),
                    ("ALIGN", (1, 0), (-1, -1), "LEFT"),
                    ("FONTNAME", (0, 0), (-1, -1), "Inter-Regular"),
                    ("FONTNAME", (0, 0), (-1, 0), "Inter-Bold"),
                    ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                ]
            )
        )
        table.wrapOn(pdf, 400, 600)
        gap -= table._height + 15
        table.drawOn(pdf, left - 5, gap)

        # Save the PDF
        pdf.save()
        return response
