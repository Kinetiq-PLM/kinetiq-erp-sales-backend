from rest_framework import viewsets
from .serializers import *
from rest_framework.response import Response
from rest_framework.request import Request
from django.db import transaction
from rest_framework import status
from quotation.models import Quotation
from datetime import date
from dateutil.relativedelta import relativedelta
from utils import *
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, Paragraph
from django.http import HttpResponse
from reportlab.lib.styles import getSampleStyleSheet
from rest_framework.request import Request
from textwrap import wrap
from rest_framework.decorators import action
from django.db.models import Prefetch


class OrderViewSet(viewsets.ModelViewSet):
    queryset = OrderView.objects.all().order_by("-order_date")
    serializer_class = OrderSerializer

    def get_optimized_queryset(self):
        """Get a fresh queryset with all required relations"""
        return (
            OrderView.objects.select_related(
                "statement", "statement__salesrep", "statement__customer", "quotation"
            )
            .prefetch_related(
                Prefetch(
                    "statement__statementitem_set",
                    queryset=StatementItem.objects.select_related(
                        "inventory_item"
                    ).all(),
                    to_attr="cached_items",
                )
            )
            .order_by("-order_date")
        )

    def list(self, request: Request, *args, **kwargs):
        params = request.query_params
        order_status = params.get("status")
        order_type = params.get("order_type")
        period = params.get("period")
        start_date = date.today()
        end_date = date.today()
        salesrep = params.get("salesrep")

        # Handle period filtering
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

        # Start with an optimized queryset using select_related
        queryset = self.get_optimized_queryset()

        # Build filters
        filters = {}
        if order_status:
            filters["completion_status__in"] = order_status.split(",")
        if order_type:
            filters["order_type"] = order_type
        if period:
            filters["order_date__range"] = (start_date, end_date)
        if salesrep:
            s = Employees.objects.get(pk=salesrep)
            if not s.is_supervisor:
                filters["statement__salesrep__employee_id"] = salesrep

        # Apply filters and serialize
        filtered_queryset = queryset.filter(**filters)
        serializer = OrderViewSerializer(filtered_queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = OrderView.objects.all()
        order = get_object_or_404(queryset, pk=pk)
        serializer = OrderViewSerializer(order)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        """
        inputs:
        {
            required:
                order_data: {
                    rework,
                    quotation_id,
                    goods_issue,
                    order_date,
                    order_status,
                    order_total_amount (optional, auto generated),
                    order_type,
                    items (see statement_items): [ product_id, quantity, unit_price, markup_percentage ]
                }

                statement_data: {
                    customer,
                    salesrep,
                    total_amount,
                    discount,
                    type,
                    items (see statement_items): [ product_id, quantity, unit_price, markup_percentage ]
                },
        }
        """
        order_data = request.data.pop("order_data", {})
        items_data = order_data.pop("items", [])
        for item in items_data:
            item["quantity_to_deliver"] = 0

        statement_data = request.data.pop("statement_data", {})

        try:
            with transaction.atomic():
                quotation_id = order_data.pop("quotation_id", None)

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
                    data = {"statement": statement, **order_data}
                    quotation = Quotation.objects.filter(pk=quotation_id)
                    # set quotation as approved
                    if quotation.exists():
                        quotation = quotation.get()
                        data["quotation"] = quotation
                        quotation.status = Quotation.Status.APPROVED
                        quotation.save()

                    order = Order.objects.create(**data)

                    return Response(
                        OrderSerializer(order).data,
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    raise Exception(statement_serializer.errors)

        ## TODO: Raise Sales Order to Project Management
        ## TODO: update stocks
        except Exception as err:
            return Response({"error": str(err)}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=True, methods=["get"])
    def document(self, request, pk=None):
        order = self.get_object()
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = (
            f'attachment; filename="order_{order.order_id}.pdf"'
        )
        pdf = canvas.Canvas(response, pagesize=A4)
        width, height = A4
        accent_color = hex_to_rgb("#469fc2")
        right = width - 30
        left = 30
        height -= 20

        # order Details Table
        styles = getSampleStyleSheet()
        style = styles["BodyText"]

        def draw_page(pdf, page_num, total_pages):
            pdf.setFont("Inter-Regular", 10)
            pdf.drawString(
                (width - 60) / 2, height - 805, f"Page {page_num} of {total_pages}"
            )

        def draw_order_header(pdf):
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

            # order Header
            pdf.setStrokeColor(hex_to_rgb("#d2d2d2"))  # Set line color (black)
            pdf.setLineWidth(1)  # Set line thickness

            # Draw horizontal line from (x1, y1) to (x2, y2)
            pdf.line(30, height - 135, 250, height - 135)
            pdf.line(360, height - 135, right, height - 135)
            pdf.setFont("Inter-Regular", 14)
            pdf.drawString((width - 80) / 2, height - 140, "SALES ORDER")

            # order Number
            pdf.setFont("Inter-Regular", 10)
            pdf.setFillColor(hex_to_rgb("#469fc2"))
            pdf.drawRightString(right, height - 175, "Sales Order#")
            pdf.setFont("Inter-Bold", 12)
            pdf.setFillColor(colors.black)
            pdf.drawRightString(
                right, height - 190, "-".join(order.order_id.split("-")[2:])
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
            wrapped_lines = wrap(order.statement.customer.name, width=max_width)
            temp = y_pos = height - 205

            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            pdf.setFont("Inter-Regular", 10)

            wrapped_lines = wrap(order.statement.customer.address_line1, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{order.statement.customer.address_line2} {order.statement.customer.postal_code}, {order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(order.statement.customer.email_address, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(order.statement.customer.phone_number, width=30)
            for line in wrapped_lines:
                pdf.drawString(bill_to, y_pos, line)
                y_pos -= line_height

            y_pos = temp
            wrapped_lines = wrap(order.statement.customer.address_line1, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(
                f"{order.statement.customer.address_line2} {order.statement.customer.postal_code}, {order.statement.customer.country}",
                width=30,
            )
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(order.statement.customer.email_address, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height

            wrapped_lines = wrap(order.statement.customer.phone_number, width=30)
            for line in wrapped_lines:
                pdf.drawString(ship_to, y_pos, line)
                y_pos -= line_height
            formatted_order_date = order.order_date.strftime("%d %B %Y")

            table_data = [
                ["Salesperson", "Type", "Status", "Order Date"],
                [
                    Paragraph(
                        f"{order.statement.salesrep.first_name} {order.statement.salesrep.last_name}",
                        style=style,
                    ),
                    Paragraph(order.order_type, style=style),
                    Paragraph(order.completion_status, style=style),
                    Paragraph(formatted_order_date, style=style),
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

        next_y = draw_order_header(pdf)

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
            for item in StatementSerializer(order.statement).get_items(order.statement)
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
            # next_y = draw_order_header(pdf)
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
                order_table._height - ((len(items) - 1) * 38)
                if len(items) == 4
                else (
                    order_table._height - 10
                    if len(items) == 3
                    else (
                        (height * 0.27) + order_table._height
                        if len(items) == 1
                        else (height * 0.10) + order_table._height
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
        pdf.drawRightString(
            right,
            next_section_y,
            "{0:,.2f}".format(float(order.statement.subtotal)),
        )

        pdf.drawString(
            400,
            next_section_y - 15,
            f"Sales Tax",
        )
        pdf.drawRightString(
            right,
            next_section_y - 15,
            "{0:,.2f}".format(float(order.statement.total_tax)),
        )
        pdf.drawString(
            400,
            next_section_y - 30,
            f"Total Discount",
        )
        pdf.drawRightString(
            right,
            next_section_y - 30,
            "{0:,.2f}".format(float(order.statement.discount)),
        )

        pdf.setFillColor(hex_to_rgb("#eff8f9"))  # Set background color
        pdf.rect(
            395,
            next_section_y - 60,
            175,
            23,
            fill=True,
            stroke=0,
        )  # Draw background box
        pdf.setFont("Inter-Bold", 12)
        pdf.setFillColor(accent_color)
        pdf.drawString(400, next_section_y - 52, "Total (PHP)")
        pdf.drawRightString(
            right,
            next_section_y - 52,
            "{0:,.2f}".format(float(order.statement.total_amount)),
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
