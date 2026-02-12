import importlib
import inspect


def test_worker_v2_contains_exact_time_roi_math():
    mod = importlib.import_module("musica.worker_v2")
    src = inspect.getsource(mod)

    # ROI EXACTO que dijiste que replica musica1.py
    assert "x1p = x1 + 350" in src
    assert "y1p = y1 + 455" in src
    assert "x2p = x2 - 360" in src
    assert "y2p = y2 - 100" in src
