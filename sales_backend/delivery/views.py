from rest_framework import viewsets
from .serializers import *
from rest_framework.decorators import action
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from textwrap import wrap
from utils import *
from django.http import HttpResponse


class ShippingDetailsViewSet(viewsets.ModelViewSet):
    queryset = ShippingDetails.objects.all().order_by("-shipping_date")
    serializer_class = ShippingDetailsSerializer

    def create(self, request, *args, **kwargs):
        """
        To Distribution:
            provides the order and the customer account to Distribution,
            to calculate the manpower or for example,
            number of trucks needed for delivery.
            Distribution returns the total cost of logistics to Sales
            to include in the invoice.
        """
        return super().create(request, *args, **kwargs)

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        delivery = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="delivery_{delivery.shipping_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # delivery Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        def draw_delivery_header(pdf):
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

            # delivery Header
            pdf.setStrokeColor(hex_to_rgb("#d2d2d2"))  # Set line color (black)
            pdf.setLineWidth(1)  # Set line thickness

            # Draw horizontal line from (x1, y1) to (x2, y2)
            pdf.line(30, height - 135, 250, height - 135)
            pdf.line(360, height - 135, right, height - 135)
            pdf.setFont("Inter-Regular", 14)
            pdf.drawString((width - 80) / 2, height - 140, "SALES ORDER")

            # delivery Number
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawRightString(right, height - 175, "Sales Order#")
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(colors.black)
            pdf.drawRightString(
                right, height - 190, "-".join(delivery.order.order_id.split("-")[2:])
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
                delivery.order.statement.customer.name, width=max_width
            )
            temp = y_pos = height - 205

            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            pdf.setFont("Inter-Regular", 10)

            wrapped_lines = wrap(
                delivery.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{delivery.order.statement.customer.address_line2} {delivery.order.statement.customer.postal_code}, {delivery.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                delivery.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                delivery.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            y_pos = temp
            wrapped_lines = wrap(
                delivery.order.statement.customer.address_line1, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{delivery.order.statement.customer.address_line2} {delivery.order.statement.customer.postal_code}, {delivery.order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                delivery.order.statement.customer.email_address, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                delivery.order.statement.customer.phone_number, width=30
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height
            formatted_delivery_date = (
                delivery.shipping_date.strftime("%d %B %Y")
                if delivery.shipping_date
                else "-"
            )
            formatted_due_date = (
                delivery.estimated_delivery.strftime("%d %B %Y")
                if delivery.estimated_delivery
                else "-"
            )

            table_data = [
                [
                    "Salesperson",
                    "Tracking No.",
                    "Shipping Method",
                    "Payment Terms",
                    "Shipping Date",
                    "Delivery Date",
                ],
                [
                    Paragraph(
                        f"{delivery.order.statement.salesrep.first_name} {delivery.order.statement.salesrep.last_name}",
                        style=style,
                    ),
                    delivery.tracking_num,
                    delivery.shipping_method,
                    "Due on Receipt",
                    Paragraph(formatted_delivery_date, style=style),
                    Paragraph(formatted_due_date, style=style),
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

        next_y = draw_delivery_header(pdf)

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
                "{0:,.2f}".format(float(item["total_price"])),
            ]
            for item in StatementSerializer(delivery.order.statement).get_items(
                delivery.order.statement
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
        delivery_data = [
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
        delivery_table = Table(delivery_data, colWidths=[80, 215, 30, 50, 80, 80])
        delivery_table.setStyle(
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
        delivery_table_width, delivery_table_height = delivery_table.wrap(500, 500)
        delivery_table.drawOn(
            pdf,
            left,
            ((height * 0.53) - delivery_table._height),
        )
        page += 1

        if num_pages == 1 and len(items) >= 5:
            draw_page(pdf, page, num_pages + 1)
        else:
            draw_page(pdf, page, num_pages)

        while page < num_pages:
            pdf.showPage()
            # next_y = draw_delivery_header(pdf)
            start_index = end_index
            end_index = start_index + max_items_rest
            delivery_data = [
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

            delivery_table = Table(delivery_data, colWidths=[80, 215, 30, 50, 80, 80])
            delivery_table.setStyle(
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
            if len(delivery_data) > 1:
                delivery_table_width, delivery_table_height = delivery_table.wrap(
                    500, 500
                )
                delivery_table.drawOn(
                    pdf, left, (height * 0.95) - delivery_table._height
                )
            page += 1
            if delivery_table._height >= 700:
                draw_page(pdf, page, num_pages + 1)
            else:
                draw_page(pdf, page, num_pages)

        next_section_y = (
            height - delivery_table._height - 75
            if num_pages > 1
            else (
                delivery_table._height - ((len(items) - 1) * 40)
                if len(items) == 4
                else (
                    delivery_table._height
                    if len(items) == 3
                    else (
                        (height * 0.27) + delivery_table._height
                        if len(items) == 1
                        else (height * 0.15) + delivery_table._height
                    )
                )
            )
        )
        if delivery_table._height >= 700 or (num_pages == 1 and len(items) >= 5):
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
                float(delivery.order.statement.total_amount)
                - float(delivery.order.statement.total_tax)
                - float(delivery.order.statement.discount)
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
            "{0:,.2f}".format(float(delivery.order.statement.total_tax)),
        )
        pdf.drawString(
            400,
            next_section_y - 30,
            f"Total Discount",
        )
        pdf.drawRightString(
            right,
            next_section_y - 30,
            "{0:,.2f}".format(float(delivery.order.statement.discount)),
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
            "{0:,.2f}".format(float(delivery.order.statement.total_amount)),
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
