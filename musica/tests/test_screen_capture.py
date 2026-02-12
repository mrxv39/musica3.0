# ruta: tests/test_screen_capture.py
import numpy as np
import importlib


def test_capture_region_bgr_returns_bgr_without_alpha(monkeypatch):
    sc = importlib.import_module("musica.core.screen_capture")

    # Fake MSS
    class _FakeGrab:
        def __init__(self):
            # BGRA 2x3
            self._arr = np.zeros((2, 3, 4), dtype=np.uint8)
            self._arr[:, :, 0] = 10  # B
            self._arr[:, :, 1] = 20  # G
            self._arr[:, :, 2] = 30  # R
            self._arr[:, :, 3] = 255 # A

        # NumPy 2.0 expects __array__(dtype=..., copy=...)
        def __array__(self, dtype=None, copy=None):
            arr = self._arr
            if dtype is not None:
                arr = arr.astype(dtype)
            if copy:
                arr = arr.copy()
            return arr

    class _FakeMSS:
        def __enter__(self):
            return self

        def __exit__(self, exc_type, exc, tb):
            return False

        def grab(self, monitor):
            return _FakeGrab()

    class _FakeMSSModule:
        def mss(self):
            return _FakeMSS()

    monkeypatch.setattr(sc, "mss", _FakeMSSModule())

    region = (100, 200, 103, 202)
    res = sc.capture_region_bgr(region)

    assert res.region == region
    assert res.bgr.shape == (2, 3, 3)
    assert res.bgr.dtype == np.uint8
    assert (res.bgr[:, :, 0] == 10).all()
    assert (res.bgr[:, :, 1] == 20).all()
    assert (res.bgr[:, :, 2] == 30).all()


def test_capture_region_bgr_rejects_invalid_region():
    sc = importlib.import_module("musica.core.screen_capture")

    for bad in [(0, 0, 0, 10), (0, 0, 10, 0), (-1, 0, 10, 10)]:
        try:
            sc._validate_region(bad)
        except Exception:
            pass
        else:
            raise AssertionError(f"Expected error for region={bad}")
