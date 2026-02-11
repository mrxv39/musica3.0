import os
import importlib.util

def _project_root():
    return os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

def test_import_abrir_all():
    root = _project_root()
    path = os.path.join(root, "abrir_all.py")
    spec = importlib.util.spec_from_file_location("abrir_all", path)
    assert spec is not None, f"abrir_all.py not found at {path}"
    assert spec.loader is not None, "spec.loader is None"
    abrir_all = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(abrir_all)

def test_preflight_check_exists():
    root = _project_root()
    preflight_path = os.path.join(root, "scripts", "preflight_check.py")
    assert os.path.isfile(preflight_path), f"Missing: {preflight_path}"

def test_asset_files_exist():
    root = _project_root()
    assets = [
        os.path.join(root, "img", "img_referencia", "time1.bmp"),
        os.path.join(root, "img", "img_referencia", "noboard_negro.png"),
        os.path.join(root, "img", "img_referencia", "dealer2futbol.png"),
        os.path.join(root, "img", "img_referencia", "tantoporciento.png"),
    ]
    for asset in assets:
        assert os.path.isfile(asset), f"Missing asset: {asset}"
