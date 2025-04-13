import os
from django.conf import settings
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib import colors

public_path = os.path.join(settings.BASE_DIR, "public")
fonts = os.listdir(os.path.join(public_path, "fonts"))
font_paths = [os.path.join(public_path, "fonts", font) for font in fonts]
for font, path in zip(fonts, font_paths):
    pdfmetrics.registerFont(TTFont(font.split(".")[0], path))
logo_path = os.path.join(public_path, "images", "logo.png")


def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip("#")  # Remove '#' if present
    r, g, b = [int(hex_color[i : i + 2], 16) / 255.0 for i in (0, 2, 4)]
    return colors.Color(r, g, b)
