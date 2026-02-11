import sys
import cv2
import numpy as np
import mss
import os
import pytesseract
from PIL import Image

# Ruta de la imagen de referencia
rol = 'img\\img_Ref\\rol.png'

# Directorio donde se guardarán las imágenes capturadas
save_path = 'captured_regions_hud'

# Comprobar si el directorio existe, si no, crearlo
if not os.path.exists(save_path):
    os.makedirs(save_path)

# Configuración para Pytesseract
config = '--psm 7'

# Función para capturar la pantalla y aplicar OCR
def capture_and_ocr(x, y, ancho, alto, mesa):
    # Altura adicional para capturar
    additional_height = 80
    
    # Capturar la pantalla en la región especificada
    with mss.mss() as sct:
        monitor = {"left": x, "top": y, "width": ancho, "height": alto}
        screenshot = sct.grab(monitor)

        # Convertir la imagen capturada a un array de NumPy
        screenshot_np = np.array(screenshot)

        # Convertir la imagen capturada de BGRA a BGR (formato de OpenCV)
        screenshot_bgr = cv2.cvtColor(screenshot_np, cv2.COLOR_BGRA2BGR)

        # Convertir a escala de grises
        imagen_gris = cv2.cvtColor(screenshot_bgr, cv2.COLOR_BGR2GRAY)

        # Redimensionar si se especifica un porcentaje de escala diferente de 100
        scale_percent = 100
        if scale_percent != 100:
            width = int(imagen_gris.shape[1] * scale_percent / 100)
            height = int(imagen_gris.shape[0] * scale_percent / 100)
            imagen_gris = cv2.resize(imagen_gris, (width, height), interpolation=cv2.INTER_CUBIC)

        # Guardar la imagen capturada para verificación
        pil_image = Image.fromarray(imagen_gris)
        image_path = os.path.join(save_path, f"captured_{mesa}.png")
        pil_image.save(image_path)

        # Aplicar OCR a la imagen
        ocr_text = pytesseract.image_to_string(pil_image, config=config)
        return ocr_text

if __name__ == "__main__":
    # Comprobar que se pasan los argumentos correctos
    if len(sys.argv) != 6:
        print("Uso: python buscar_imagen.py <x> <y> <ancho> <alto> <mesa>")
        sys.exit(1)

    # Leer los valores de la región desde los argumentos de la línea de comandos
    x = int(sys.argv[1])
    y = int(sys.argv[2])
    ancho = int(sys.argv[3])
    alto = int(sys.argv[4])
    mesa = sys.argv[5]

    # Capturar y aplicar OCR
    ocr_result = capture_and_ocr(x, y, ancho, alto, mesa)
    
    # Mostrar resultado de OCR
    print(f"Texto OCR encontrado:\n{ocr_result}")
