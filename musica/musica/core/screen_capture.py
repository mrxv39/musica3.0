# ruta: musica/core/screen_capture.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Tuple

import numpy as np

try:
    import mss
except Exception as e:  # pragma: no cover
    mss = None  # type: ignore


Rect = Tuple[int, int, int, int]  # (x1, y1, x2, y2)


@dataclass(frozen=True)
class CaptureResult:
    bgr: np.ndarray
    region: Rect


def _validate_region(region: Rect) -> None:
    x1, y1, x2, y2 = region
    if not all(isinstance(v, int) for v in region):
        raise TypeError(f"region must be ints: {region}")
    if x2 <= x1 or y2 <= y1:
        raise ValueError(f"invalid region (x2<=x1 or y2<=y1): {region}")
    if x1 < 0 or y1 < 0:
        # Permitimos coordenadas negativas? En este proyecto normalmente no.
        raise ValueError(f"invalid region (negative coords): {region}")


def capture_region_bgr(region: Rect, *, monitor_index: int = 1) -> CaptureResult:
    """
    Captura una región de pantalla y devuelve BGR (uint8).
    NO altera ROIs ni lógica; es solo infraestructura de captura.
    """
    _validate_region(region)

    if mss is None:
        raise RuntimeError("mss is not available (import failed)")

    x1, y1, x2, y2 = region
    w = x2 - x1
    h = y2 - y1

    with mss.mss() as sct:
        # MSS usa dict con left/top/width/height
        monitor = {"left": x1, "top": y1, "width": w, "height": h}

        raw = sct.grab(monitor)  # BGRA
        img = np.array(raw, dtype=np.uint8)

    # BGRA -> BGR (quitamos alfa)
    if img.ndim != 3 or img.shape[2] < 3:
        raise RuntimeError(f"unexpected grab shape: {img.shape}")

    bgr = img[:, :, :3]  # B,G,R
    return CaptureResult(bgr=bgr, region=region)


def capturar_imagen(region: Rect, *, monitor_index: int = 1) -> np.ndarray:
    """
    Alias legacy-friendly: devuelve solo la imagen BGR.
    (Esto será el equivalente limpio de capturar_imagen en musica1.py)
    """
    return capture_region_bgr(region, monitor_index=monitor_index).bgr
