import numpy as np
import importlib


def _load_time_detect_module():
    return importlib.import_module("musica.core.time_detect")


def test_detect_time_found_computes_absolute_location(monkeypatch):
    td = _load_time_detect_module()

    fake_frame = np.zeros((800, 1200, 3), dtype=np.uint8)
    region_time = (520, 210, 1296, 807)

    # Evitar MSS real
    monkeypatch.setattr(td, "_capture_bgr", lambda *_a, **_k: fake_frame)

    # Evitar resolución real de path (da igual cuál sea)
    monkeypatch.setattr(td, "_resolve_time_template_path", lambda *_a, **_k: "FAKE_TIME_TEMPLATE.png")

    # Usar el cv2 REAL, pero parchear solo lo que nos interesa
    real_cv2 = td.cv2

    # Template "leído" (matriz válida)
    monkeypatch.setattr(real_cv2, "imread", lambda *_a, **_k: np.zeros((40, 120, 3), dtype=np.uint8))

    # Resultado dummy para matchTemplate
    monkeypatch.setattr(real_cv2, "matchTemplate", lambda *_a, **_k: np.zeros((10, 10), dtype=np.float32))

    # Fuerza un match fuerte
    monkeypatch.setattr(real_cv2, "minMaxLoc", lambda *_a, **_k: (0.0, 0.953, (0, 0), (361, 470)))

    res = td.detect_time(region_time=region_time, threshold=0.8, template_path=None)

    assert res is not None
    assert res.found is True
    assert abs(res.score - 0.953) < 1e-6
    assert res.location_abs == (520 + 361, 210 + 470)


def test_detect_time_not_found_below_threshold(monkeypatch):
    td = _load_time_detect_module()

    fake_frame = np.zeros((800, 1200, 3), dtype=np.uint8)
    region_time = (520, 210, 1296, 807)

    monkeypatch.setattr(td, "_capture_bgr", lambda *_a, **_k: fake_frame)
    monkeypatch.setattr(td, "_resolve_time_template_path", lambda *_a, **_k: "FAKE_TIME_TEMPLATE.png")

    real_cv2 = td.cv2
    monkeypatch.setattr(real_cv2, "imread", lambda *_a, **_k: np.zeros((40, 120, 3), dtype=np.uint8))
    monkeypatch.setattr(real_cv2, "matchTemplate", lambda *_a, **_k: np.zeros((10, 10), dtype=np.float32))

    # Score bajo
    monkeypatch.setattr(real_cv2, "minMaxLoc", lambda *_a, **_k: (0.0, 0.50, (0, 0), (10, 10)))

    res = td.detect_time(region_time=region_time, threshold=0.8, template_path=None)

    assert res is not None
    assert res.found is False
    assert abs(res.score - 0.50) < 1e-6
