import os
import zipfile
from pathlib import Path

# Configuración
ROOT_DIR = Path(__file__).resolve().parent
OUTPUT_ZIP = ROOT_DIR / "musica_no_images.zip"

# Tamaño máximo por carpeta (100 MB)
MAX_FOLDER_SIZE = 100 * 1024 * 1024


def get_folder_size(folder: Path) -> int:
    """
    Calcula el tamaño total de una carpeta incluyendo TODO (imágenes incluidas).
    """
    total_size = 0
    for root, dirs, files in os.walk(folder):
        for file in files:
            file_path = Path(root) / file
            try:
                if file_path.exists():
                    total_size += file_path.stat().st_size
            except OSError:
                continue
    return total_size


def main():
    if OUTPUT_ZIP.exists():
        OUTPUT_ZIP.unlink()

    with zipfile.ZipFile(OUTPUT_ZIP, "w", zipfile.ZIP_DEFLATED) as zf:

        # 🔹 Primero añadimos archivos sueltos en la raíz
        for item in ROOT_DIR.iterdir():
            if item.is_file() and item.name != OUTPUT_ZIP.name:
                print(f"📄 Añadiendo archivo raíz: {item.name}")
                zf.write(item, item.relative_to(ROOT_DIR))

        # 🔹 Luego procesamos carpetas
        for item in ROOT_DIR.iterdir():
            if not item.is_dir():
                continue

            folder_size = get_folder_size(item)

            if folder_size > MAX_FOLDER_SIZE:
                print(f"⛔ Saltando carpeta (>100MB): {item.name} ({folder_size/1024/1024:.2f} MB)")
                continue

            print(f"📦 Comprimiendo carpeta: {item.name} ({folder_size/1024/1024:.2f} MB)")

            for root, dirs, files in os.walk(item):
                root_path = Path(root)

                for file in files:
                    file_path = root_path / file

                    arcname = file_path.relative_to(ROOT_DIR)
                    zf.write(file_path, arcname)

    print(f"\n✅ ZIP creado correctamente:")
    print(f"   {OUTPUT_ZIP}")


if __name__ == "__main__":
    main()
