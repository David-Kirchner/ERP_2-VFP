"""Convert Space Alloys logo PNG to VFP9-compatible ICO."""
from __future__ import annotations

import os
from pathlib import Path

from PIL import Image

ROOT = Path(r"E:\VFP\ERP_2")
SRC = Path(
    r"C:\Users\talkt\.cursor\projects\e-VFP-ERP-2\assets"
    r"\c__Users_talkt_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_"
    r"SpaceAlloysUSA-Americas-NB-b5c51d9d-cdef-4440-acba-dd411810d7cd.png"
)
OUT_MEM = ROOT / "MEM" / "Company_Icon.ico"
OUT_ICO = ROOT / "ICO" / "SpaceAlloysUSA.ico"
OUT_PREVIEW = ROOT / "MEM" / "Company_Icon_32preview.png"
SIZES = [(16, 16), (24, 24), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)]


def make_transparent_square(img: Image.Image) -> Image.Image:
    rgba = img.convert("RGBA")
    w, h = rgba.size
    side = min(w, h)
    left = (w - side) // 2
    top = (h - side) // 2
    rgba = rgba.crop((left, top, left + side, top + side))

    pixels = rgba.load()
    for y in range(rgba.height):
        for x in range(rgba.width):
            r, g, b, a = pixels[x, y]
            if r > 240 and g > 240 and b > 240:
                pixels[x, y] = (r, g, b, 0)
    return rgba


def main() -> None:
    if not SRC.is_file():
        raise SystemExit(f"Source image not found: {SRC}")

    icon_img = make_transparent_square(Image.open(SRC))
    OUT_MEM.parent.mkdir(parents=True, exist_ok=True)
    OUT_ICO.parent.mkdir(parents=True, exist_ok=True)

    for path in (OUT_MEM, OUT_ICO):
        icon_img.save(path, format="ICO", sizes=SIZES)
        print(f"Wrote {path} ({path.stat().st_size} bytes)")

    icon_img.resize((32, 32), Image.Resampling.LANCZOS).save(OUT_PREVIEW)
    print(f"Wrote {OUT_PREVIEW}")


if __name__ == "__main__":
    main()
