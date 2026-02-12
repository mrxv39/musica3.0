# ruta: musica/worker_v2.py
from __future__ import annotations

import sys
from typing import Tuple

from musica.core.time_detect import detect_time


Rect = Tuple[int, int, int, int]


def build_time_roi(x1: int, y1: int, x2: int, y2: int) -> Rect:
    """
    Replica EXACTA de musica1.py:

        x1p = x1 + 350
        y1p = y1 + 455
        x2p = x2 - 360
        y2p = y2 - 100

        region = (x1p, y1p, x2p - x1p, y2p - y1p)
    """
    x1p = x1 + 350
    y1p = y1 + 455
    x2p = x2 - 360
    y2p = y2 - 100

    return (x1p, y1p, x2p - x1p, y2p - y1p)


def main() -> int:
    """
    Uso IDENTICO a musica1.py:

    python -m musica.worker_v2 mesa x1 y1 x2 y2 ...
    Solo usamos x1,y1,x2,y2 para TIME.
    """
    if len(sys.argv) < 6:
        print("Uso:")
        print("python -m musica.worker_v2 mesa x1 y1 x2 y2 ...")
        return 1

    # ignoramos mesa
    x1 = int(sys.argv[2])
    y1 = int(sys.argv[3])
    x2 = int(sys.argv[4])
    y2 = int(sys.argv[5])

    region_time = build_time_roi(x1, y1, x2, y2)

    result = detect_time(region_time=region_time, threshold=0.80)

    if result.found:
        print("TIME ENCONTRADO")
        print(f"Posición absoluta: {result.location_abs}")
        print(f"Score: {result.score:.3f}")
    else:
        print("TIME NO encontrado")
        print(f"Score: {result.score:.3f}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
