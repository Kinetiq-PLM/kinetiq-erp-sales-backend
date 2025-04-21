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
from django.forms import model_to_dict


class QuotationViewSet(viewsets.ModelViewSet):
    queryset = QuotationView.objects.all().order_by("-date_issued")
    serializer_class = QuotationSerializer

    def retrieve(self, request, pk=None):
        queryset = QuotationView.objects.all()
        quotation = get_object_or_404(queryset, pk=pk)
        serializer = QuotationViewSerializer(quotation)
        return Response(serializer.data)

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        status = params.get("status")
        period = params.get("period")
        get_null = params.get("get_null")
        start_date = date.today()
        end_date = date.today()
        salesrep = params.get("salesrep")
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
            filtered["date_issued__range"] = (start_date, end_date)
        if get_null:
            filtered["agreement__isnull"] = True
        if salesrep:
            s = Employees.objects.get(pk=salesrep)
            if not s.is_supervisor:
                filtered["statement__salesrep__employee_id"] = salesrep

        return Response(
            QuotationViewSerializer(self.queryset.filter(**filtered), many=True).data
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
        }
        """

        statement_data = request.data.pop("statement_data", {})
        items_data = statement_data.pop("items", [])
        for item in items_data:
            item["quantity_to_deliver"] = 0

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

                    quotation = Quotation.objects.create(statement=statement)

                    return Response(
                        QuotationSerializer(quotation).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        quotation = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="quotation_{quotation.quotation_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # quotation Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        def draw_quotation_header(pdf):
            pdf.setFont("Inter-Regular", 12)

            # Company Logo (Replace with actual logo path if needed)
            pdf.drawImage(
                logo_path, left, height - 110, preserveAspectRatio=True, height=110
            )
            pdf.setFont("Inter-Bold", 18)
            pdf.drawRightString(right, height - 50, "Kinetiq")
            pdf.setFont("Inter-Regular", 12)
            pdf.drawRightString(right, height - 70, "1975 Street Address Of")
            pdf.drawRightString(right, height - 85, "Company, Metro Manila")
            pdf.drawRightString(right, height - 100, "Philippines")

            # quotation Header
            pdf.setStrokeColor(hex_to_rgb("#d2d2d2"))  # Set line color (black)
            pdf.setLineWidth(1)  # Set line thickness

            # Draw horizontal line from (x1, y1) to (x2, y2)
            pdf.line(30, height - 135, 250, height - 135)
            pdf.line(350, height - 135, right, height - 135)
            pdf.setFont("Inter-Regular", 14)
            pdf.drawString((width - 80) / 2, height - 140, "QUOTATION")

            # quotation Number
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawRightString(right, height - 175, "Quotation#")
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(colors.black)
            pdf.drawRightString(
                right, height - 190, "-".join(quotation.quotation_id.split("-")[2:])
            )

            # Bill To & Ship To
            bill_to = 30
            ship_to = 210
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawString(bill_to, height - 185, "Bill To")
            pdf.drawString(ship_to, height - 185, "Ship To")

            pdf.setFont("Inter-Regular", 12)
            pdf.setFillColor(colors.black)
            max_width = 20
            line_height = 15
            wrapped_lines = wrap(quotation.statement.customer.name, width=max_width)
            temp = y_pos = height - 205

            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            pdf.setFont("Inter-Regular", 10)

            wrapped_lines = wrap(quotation.statement.customer.address_line1, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{quotation.statement.customer.address_line2} {quotation.statement.customer.postal_code}, {quotation.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(quotation.statement.customer.email_address, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(quotation.statement.customer.phone_number, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            y_pos = temp
            wrapped_lines = wrap(quotation.statement.customer.address_line1, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{quotation.statement.customer.address_line2} {quotation.statement.customer.postal_code}, {quotation.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(quotation.statement.customer.email_address, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(quotation.statement.customer.phone_number, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height
            formatted_quotation_date = quotation.date_issued.strftime("%d %B %Y")

            table_data = [
                [
                    "Salesperson",
                    "Date Issued",
                    "Status",
                ],
                [
                    Paragraph(
                        f"{quotation.statement.salesrep.first_name} {quotation.statement.salesrep.last_name}",
                        style=style,
                    ),
                    Paragraph(formatted_quotation_date, style=style),
                    Paragraph(quotation.status, style=style),
                ],
            ]

            col_width = (width - 60) / len(table_data[0])
            max_width = 350
            table = Table(table_data, colWidths=[col_width] * len(table_data[0]))
            table.setStyle(
                TableStyle(
                    [
                        ("BACKGROUND", (0, 0), (-1, 0), accent_color),
                        ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
                        ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                        ("FONTNAME", (0, 0), (-1, -1), "Inter-Regular"),
                        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                        ("TOPPADDING", (0, 0), (-1, -1), 10),
                        ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
                        ("GRID", (0, 0), (-1, -1), 0.5, colors.black),
                    ]
                )
            )

            table.wrapOn(pdf, 400, 600)
            table.drawOn(pdf, left, height - 370)
            next_y = table._height + y_pos
            return next_y

        next_y = draw_quotation_header(pdf)

        items = [
            [
                Paragraph(
                    "-".join(item["product"]["product_id"].split("-")[2:]), style=style
                ),
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
            for item in StatementSerializer(quotation.statement).get_items(
                quotation.statement
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
        quotation_data = [
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
        quotation_table = Table(quotation_data, colWidths=[80, 215, 30, 50, 80, 80])
        quotation_table.setStyle(
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
        quotation_table_width, quotation_table_height = quotation_table.wrap(500, 500)
        quotation_table.drawOn(
            pdf,
            left,
            ((height * 0.53) - quotation_table._height),
        )
        page += 1

        if num_pages == 1 and len(items) >= 5:
            draw_page(pdf, page, num_pages + 1)
        else:
            draw_page(pdf, page, num_pages)

        while page < num_pages:
            pdf.showPage()
            # next_y = draw_quotation_header(pdf)
            start_index = end_index
            end_index = start_index + max_items_rest
            quotation_data = [
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

            quotation_table = Table(quotation_data, colWidths=[80, 215, 30, 50, 80, 80])
            quotation_table.setStyle(
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
            if len(quotation_data) > 1:
                quotation_table_width, quotation_table_height = quotation_table.wrap(
                    500, 500
                )
                quotation_table.drawOn(
                    pdf, left, (height * 0.95) - quotation_table._height
                )
            page += 1
            if quotation_table._height >= 700:
                draw_page(pdf, page, num_pages + 1)
            else:
                draw_page(pdf, page, num_pages)

        next_section_y = (
            height - quotation_table._height - 75
            if num_pages > 1
            else (
                quotation_table._height - ((len(items) - 1) * 32)
                if len(items) == 4
                else (
                    quotation_table._height
                    if len(items) == 3
                    else (
                        (height * 0.27) + quotation_table._height
                        if len(items) == 1
                        else (height * 0.10) + quotation_table._height
                    )
                )
            )
        )
        if quotation_table._height >= 700 or (num_pages == 1 and len(items) >= 5):
            next_section_y = height * 0.95
            num_pages += 1
            pdf.showPage()
            draw_page(pdf, page + 1, num_pages)
        # Totals Section
        pdf.setFont("Inter-Regular", 10)
        pdf.drawString(400, next_section_y, "Subtotal")
        pdf.drawRightString(
            right,
            next_section_y,
            "{0:,.2f}".format(float(quotation.statement.total_amount)),
        )

        pdf.drawString(
            400,
            next_section_y - 15,
            f"Sales Tax",
        )
        pdf.drawRightString(
            right,
            next_section_y - 15,
            "{0:,.2f}".format(float(quotation.statement.total_tax)),
        )
        pdf.drawString(
            400,
            next_section_y - 30,
            f"Total Discount",
        )
        pdf.drawRightString(
            right,
            next_section_y - 30,
            "{0:,.2f}".format(float(quotation.statement.discount)),
        )

        pdf.setFillColor(hex_to_rgb("#eff8f9"))  # Set background color
        pdf.rect(
            395,
            next_section_y - 58,
            175,
            23,
            fill=True,
            stroke=0,
        )  # Draw background box
        pdf.setFont("Inter-Bold", 12)
        pdf.setFillColor(accent_color)
        pdf.drawString(400, next_section_y - 50, "Total (PHP)")
        pdf.drawRightString(
            right,
            next_section_y - 50,
            "{0:,.2f}".format(
                +float(quotation.statement.total_amount)
                + float(quotation.statement.total_tax)
                - float(quotation.statement.discount)
            ),
        )

        # Footer
        pdf.setFont("Inter-Regular", 8)
        pdf.setFillColor(colors.black)
        pdf.drawString(left, next_section_y, "Thank you for your business.")

        pdf.setFont("Inter-Regular", 9)

        pdf.drawString(left, next_section_y - 100, "Terms & Conditions")

        pdf.setFont("Inter-Regular", 7)
        pdf.drawString(
            left,
            next_section_y - 115,
            "Full payment is due upon receipt of this invoice. Late payments may incur additional charges or interest as per the applicable laws.",
        )
        # Save the PDF

        pdf.save()
        return response
