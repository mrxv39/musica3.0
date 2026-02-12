# ruta: musica/core/time_detect.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Tuple

import cv2
import numpy as np
import mss


Rect = Tuple[int, int, int, int]  # (left, top, width, height)


@dataclass(frozen=True)
class DetectResult:
    found: bool
    location_abs: Optional[Tuple[int, int]]
    score: float


def _resolve_time_template_path(explicit_path: Optional[str] = None) -> Path:
    """
    Localiza time1.bmp en rutas conocidas del repo.
    Prioridad:
      1) explicit_path (si viene)
      2) musica/img/img_referencia/time1.bmp (al lado del paquete)
      3) ./img/img_referencia/time1.bmp (raíz estilo musica1.py)
      4) musica/musica/img/img_referencia/time1.bmp (estructura legacy commit)
    """
    if explicit_path:
        p = Path(explicit_path).expanduser().resolve()
        if p.exists():
            return p
        raise FileNotFoundError(f"time template not found (explicit): {p}")

    here = Path(__file__).resolve()
    pkg_dir = here.parent.parent  # .../musica
    repo_root = pkg_dir.parent     # .../<repo>

    candidates = [
        pkg_dir / "img" / "img_referencia" / "time1.bmp",
        repo_root / "img" / "img_referencia" / "time1.bmp",
        pkg_dir / "musica" / "img" / "img_referencia" / "time1.bmp",   # musica/musica/img...
        repo_root / "musica" / "img" / "img_referencia" / "time1.bmp", # por si acaso
        repo_root / "musica" / "musica" / "img" / "img_referencia" / "time1.bmp",
    ]

    for c in candidates:
        if c.exists():
            return c

    raise FileNotFoundError(
        "time1.bmp not found. Tried:\n" + "\n".join(str(c) for c in candidates)
    )


def _capture_bgr(region: Rect) -> np.ndarray:
    left, top, width, height = region
    if width <= 0 or height <= 0:
        raise ValueError(f"Invalid region: {region}")

    with mss.mss() as sct:
        monitor = {"left": left, "top": top, "width": width, "height": height}
        sct_img = sct.grab(monitor)
        img = np.array(sct_img)  # BGRA
        # BGRA -> BGR
        return cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)


def detect_time(
    *,
    region_time: Rect,
    threshold: float = 0.80,
    template_path: Optional[str] = None,
) -> DetectResult:
    """
    Detecta la plantilla time1.bmp dentro de region_time.
    Devuelve:
      - found True/False
      - location_abs (x,y) top-left del match en coordenadas absolutas de pantalla
      - score (max_val)
    """
    tpl_path = _resolve_time_template_path(template_path)

    template_bgr = cv2.imread(str(tpl_path), cv2.IMREAD_COLOR)
    if template_bgr is None:
        raise FileNotFoundError(f"cv2.imread failed for template: {tpl_path}")

    src_bgr = _capture_bgr(region_time)

    src_gray = cv2.cvtColor(src_bgr, cv2.COLOR_BGR2GRAY)
    tpl_gray = cv2.cvtColor(template_bgr, cv2.COLOR_BGR2GRAY)

    # matchTemplate exige que el template sea <= src en ambas dimensiones
    if tpl_gray.shape[0] > src_gray.shape[0] or tpl_gray.shape[1] > src_gray.shape[1]:
        return DetectResult(False, None, 0.0)

    res = cv2.matchTemplate(src_gray, tpl_gray, cv2.TM_CCOEFF_NORMED)
    _min_val, max_val, _min_loc, max_loc = cv2.minMaxLoc(res)

    if max_val >= threshold:
        abs_x = region_time[0] + int(max_loc[0])
        abs_y = region_time[1] + int(max_loc[1])
        return DetectResult(True, (abs_x, abs_y), float(max_val))

    return DetectResult(False, None, float(max_val))
