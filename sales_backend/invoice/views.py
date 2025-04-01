from django.shortcuts import get_object_or_404
from .serializers import *
from rest_framework import viewsets
from rest_framework.request import Request
from rest_framework.response import Response
from django.http import HttpResponse
from order.serializers import Order
from rest_framework import status
from rest_framework.decorators import action
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from textwrap import wrap
from utils import *


class SalesInvoicesViewSet(viewsets.ModelViewSet):
    queryset = SalesInvoices.objects.all().order_by("-invoice_date")
    serializer_class = SalesInvoicesSerializer

    def create(self, request: Request, *args, **kwargs):
        """
        inputs:
        {
            order_id,
            invoice_date (optional default order_date),
            total_amount (optional default order_total_amount),
            invoice_status (default 'Pending'),
            payment_status (default 'Unpaid'),
            due_date
        }
        """
        order_id = request.data.pop("order_id")
        order: Order = get_object_or_404(Order, pk=order_id)
        invoice_date = request.data.pop("invoice_date", order.order_date)
        total_amount = request.data.pop("total_amount", order.order_total_amount)
        invoice = SalesInvoices.objects.create(
            order_id=order.order_id,
            invoice_date=invoice_date,
            total_amount=total_amount,
            **request.data,
        )

        return Response(
            SalesInvoicesSerializer(invoice).data, status=status.HTTP_201_CREATED
        )

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        invoice = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="invoice_{invoice.invoice_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # Order Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        def draw_invoice_header(pdf):
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

            # Invoice Header
            pdf.setStrokeColor(hex_to_rgb("#d2d2d2"))  # Set line color (black)
            pdf.setLineWidth(1)  # Set line thickness

            # Draw horizontal line from (x1, y1) to (x2, y2)
            pdf.line(30, height - 135, 250, height - 135)
            pdf.line(370, height - 135, right, height - 135)
            pdf.setFont("Inter-Regular", 14)
            pdf.drawString((width - 80) / 2, height - 140, "SALES INVOICE")

            # Invoice Number
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawRightString(right, height - 175, "Invoice#")
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(colors.black)
            pdf.drawRightString(
                right, height - 190, "-".join(invoice.invoice_id.split("-")[2:])
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
            wrapped_lines = wrap(invoice.order.statement.customer.name, width=max_width)
            temp = y_pos = height - 205

            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            pdf.setFont("Inter-Regular", 10)

            wrapped_lines = wrap(
                invoice.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{invoice.order.statement.customer.address_line2} {invoice.order.statement.customer.postal_code}, {invoice.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                invoice.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                invoice.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            y_pos = temp
            wrapped_lines = wrap(
                invoice.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{invoice.order.statement.customer.address_line2} {invoice.order.statement.customer.postal_code}, {invoice.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                invoice.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                invoice.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height
            formatted_invoice_date = invoice.invoice_date.strftime("%d %B %Y")
            formatted_due_date = invoice.due_date.strftime("%d %B %Y")
            table_data = [
                ["Invoice Date", "Payment Terms", "Due Date"],
                [formatted_invoice_date, "Due on Receipt", formatted_due_date],
            ]

            col_width = (width - 60) / 3
            max_width = 350
            table = Table(table_data, colWidths=[col_width, col_width, col_width])
            # table_width, table_height = table.wrap(max_width, ma)
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

        next_y = draw_invoice_header(pdf)

        items = [
            [
                Paragraph(
                    "-".join(item["product"]["product_id"].split("-")[2:]), style=style
                ),
                Paragraph(
                    f"{item['product']['product_name']}<br /><font color='#787878'>{item['product']['description']}</font>",
                    style=style,
                ),
                item["quantity"],
                "{0:,.2f}".format(float(item["discount"])),
                "{0:,.2f}".format(float(item["unit_price"])),
                "{0:,.2f}".format(float(item["total_price"]) - float(item["discount"])),
            ]
            for item in StatementSerializer(invoice.order.statement).get_items(
                invoice.order.statement
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
        order_data = [
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
        order_table = Table(order_data, colWidths=[80, 215, 30, 50, 80, 80])
        order_table.setStyle(
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
        order_table_width, order_table_height = order_table.wrap(500, 500)
        order_table.drawOn(
            pdf,
            left,
            ((height * 0.53) - order_table._height),
        )
        page += 1

        if num_pages == 1 and len(items) >= 5:
            draw_page(pdf, page, num_pages + 1)
        else:
            draw_page(pdf, page, num_pages)

        while page < num_pages:
            pdf.showPage()
            # next_y = draw_invoice_header(pdf)
            start_index = end_index
            end_index = start_index + max_items_rest
            order_data = [
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

            order_table = Table(order_data, colWidths=[80, 215, 30, 50, 80, 80])
            order_table.setStyle(
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
            if len(order_data) > 1:
                order_table_width, order_table_height = order_table.wrap(500, 500)
                order_table.drawOn(pdf, left, (height * 0.95) - order_table._height)
            page += 1
            if order_table._height >= 700:
                draw_page(pdf, page, num_pages + 1)
            else:
                draw_page(pdf, page, num_pages)

        next_section_y = (
            height - order_table._height - 75
            if num_pages > 1
            else (
                order_table._height - ((len(items) - 1) * 32)
                if len(items) == 4
                else (
                    order_table._height
                    if len(items) == 3
                    else (
                        (height * 0.27) + order_table._height
                        if len(items) == 1
                        else (height * 0.15) + order_table._height
                    )
                )
            )
        )
        if order_table._height >= 700 or (num_pages == 1 and len(items) >= 5):
            next_section_y = height * 0.95
            num_pages += 1
            pdf.showPage()
            draw_page(pdf, page + 1, num_pages)
        # Totals Section
        pdf.setFont("Inter-Regular", 10)
        pdf.drawString(400, next_section_y, "Subtotal")
        shipping_fee = float(invoice.total_amount) - float(
            invoice.order.statement.total_amount
        )
        pdf.drawRightString(
            right,
            next_section_y,
            "{0:,.2f}".format(
                float(invoice.order.statement.total_amount)
                - float(invoice.order.statement.total_tax)
                - float(invoice.order.statement.discount)
                - shipping_fee
            ),
        )

        pdf.drawString(
            400,
            next_section_y - 15,
            f"Sales Tax",
        )
        pdf.drawRightString(
            right,
            next_section_y - 15,
            "{0:,.2f}".format(float(invoice.order.statement.total_tax)),
        )
        pdf.drawString(
            400,
            next_section_y - 30,
            f"Shipping Fee",
        )
        pdf.drawRightString(
            right,
            next_section_y - 30,
            "{0:,.2f}".format(shipping_fee),
        )
        pdf.drawString(
            400,
            next_section_y - 45,
            f"Total Discount",
        )
        pdf.drawRightString(
            right,
            next_section_y - 45,
            "{0:,.2f}".format(float(invoice.order.statement.discount)),
        )

        pdf.setFont("Inter-Bold", 10)
        pdf.drawString(400, next_section_y - 60, "Total (PHP)")
        pdf.drawRightString(
            right,
            next_section_y - 60,
            "{0:,.2f}".format(float(invoice.order.statement.total_amount)),
        )

        pdf.setFillColor(hex_to_rgb("#eff8f9"))  # Set background color
        pdf.rect(
            395,
            next_section_y - 95,
            175,
            25,
            fill=True,
            stroke=0,
        )  # Draw background box
        pdf.setFillColor(accent_color)
        pdf.drawString(400, next_section_y - 85, "Balance Due (PHP)")
        pdf.drawRightString(
            right,
            next_section_y - 85,
            (
                "{0:,.2f}".format(float(invoice.order.statement.total_amount))
                if invoice.invoice_status != SalesInvoices.InvoiceStatus.PAID
                else str(0)
            ),
        )

        # Footer
        pdf.setFont("Inter-Regular", 8)
        pdf.setFillColor(colors.black)
        pdf.drawString(left, next_section_y, "Thank you for your business.")

        pdf.setFont("Inter-Regular", 9)

        pdf.drawString(left, next_section_y - 115, "Terms & Conditions")

        pdf.setFont("Inter-Regular", 7)
        pdf.drawString(
            left,
            next_section_y - 130,
            "Full payment is due upon receipt of this invoice. Late payments may incur additional charges or interest as per the applicable laws.",
        )
        # Save the PDF

        pdf.save()
        return response


class PaymentsViewSet(viewsets.ModelViewSet):
    queryset = Payments.objects.all()
    serializer_class = PaymentsSerializer


class ReceiptViewSet(viewsets.ModelViewSet):
    queryset = Receipt.objects.all()
    serializer_class = ReceiptSerializer

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        receipt = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="receipt_{receipt.receipt_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # receipt Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        def draw_receipt_header(pdf):
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

            # receipt Header
            pdf.setStrokeColor(hex_to_rgb("#d2d2d2"))  # Set line color (black)
            pdf.setLineWidth(1)  # Set line thickness

            # Draw horizontal line from (x1, y1) to (x2, y2)
            pdf.line(30, height - 135, 250, height - 135)
            pdf.line(360, height - 135, right, height - 135)
            pdf.setFont("Inter-Regular", 14)
            pdf.drawString((width - 80) / 2, height - 140, "BILLING RECEIPT")

            # receipt Number
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawRightString(right, height - 175, "Receipt#")
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(colors.black)
            pdf.drawRightString(
                right, height - 190, "-".join(receipt.receipt_id.split("-")[2:])
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
            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.name, width=max_width
            )
            temp = y_pos = height - 205

            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            pdf.setFont("Inter-Regular", 10)

            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{receipt.shipping.order.statement.customer.address_line2} {receipt.shipping.order.statement.customer.postal_code}, {receipt.shipping.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            y_pos = temp
            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{receipt.shipping.order.statement.customer.address_line2} {receipt.shipping.order.statement.customer.postal_code}, {receipt.shipping.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                receipt.shipping.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height
            formatted_receipt_date = receipt.created_at.strftime("%d %B %Y")

            table_data = [
                [
                    "Shipping ID",
                    "Payment Terms",
                    "Receipt Date",
                ],
                [
                    Paragraph(
                        receipt.shipping.shipping_id,
                        style=style,
                    ),
                    "Due on Receipt",
                    Paragraph(formatted_receipt_date, style=style),
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

        next_y = draw_receipt_header(pdf)

        items = [
            [
                Paragraph(
                    "-".join(item["product"]["product_id"].split("-")[2:]), style=style
                ),
                Paragraph(
                    f"{item['product']['product_name']}<br /><font color='#787878'>{item['product']['description']}</font>",
                    style=style,
                ),
                item["quantity"],
                "{0:,.2f}".format(float(item["discount"])),
                "{0:,.2f}".format(float(item["unit_price"])),
                "{0:,.2f}".format(float(item["total_price"]) - float(item["discount"])),
            ]
            for item in StatementSerializer(receipt.shipping.order.statement).get_items(
                receipt.shipping.order.statement
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
        receipt_data = [
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
        receipt_table = Table(receipt_data, colWidths=[80, 215, 30, 50, 80, 80])
        receipt_table.setStyle(
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
        receipt_table_width, receipt_table_height = receipt_table.wrap(500, 500)
        receipt_table.drawOn(
            pdf,
            left,
            ((height * 0.53) - receipt_table._height),
        )
        page += 1

        if num_pages == 1 and len(items) >= 5:
            draw_page(pdf, page, num_pages + 1)
        else:
            draw_page(pdf, page, num_pages)

        while page < num_pages:
            pdf.showPage()
            # next_y = draw_receipt_header(pdf)
            start_index = end_index
            end_index = start_index + max_items_rest
            receipt_data = [
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

            receipt_table = Table(receipt_data, colWidths=[80, 215, 30, 50, 80, 80])
            receipt_table.setStyle(
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
            if len(receipt_data) > 1:
                receipt_table_width, receipt_table_height = receipt_table.wrap(500, 500)
                receipt_table.drawOn(pdf, left, (height * 0.95) - receipt_table._height)
            page += 1
            if receipt_table._height >= 700:
                draw_page(pdf, page, num_pages + 1)
            else:
                draw_page(pdf, page, num_pages)

        next_section_y = (
            height - receipt_table._height - 75
            if num_pages > 1
            else (
                receipt_table._height - ((len(items) - 1) * 32)
                if len(items) == 4
                else (
                    receipt_table._height
                    if len(items) == 3
                    else (
                        (height * 0.27) + receipt_table._height
                        if len(items) == 1
                        else (height * 0.15) + receipt_table._height
                    )
                )
            )
        )
        if receipt_table._height >= 700 or (num_pages == 1 and len(items) >= 5):
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
            "{0:,.2f}".format(
                float(receipt.shipping.order.statement.total_amount)
                - float(receipt.shipping.order.statement.total_tax)
                - float(receipt.shipping.order.statement.discount)
            ),
        )

        pdf.drawString(
            400,
            next_section_y - 15,
            f"Sales Tax",
        )
        pdf.drawRightString(
            right,
            next_section_y - 15,
            "{0:,.2f}".format(float(receipt.shipping.order.statement.total_tax)),
        )
        pdf.drawString(
            400,
            next_section_y - 30,
            f"Total Discount",
        )
        pdf.drawRightString(
            right,
            next_section_y - 30,
            "{0:,.2f}".format(float(receipt.shipping.order.statement.discount)),
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
            "{0:,.2f}".format(float(receipt.shipping.order.statement.total_amount)),
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
