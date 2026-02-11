import sys
import os
from PIL import Image
import pyautogui

def capture_screenshot(x1, y1, x2, y2, output_path):
    # Captura de pantalla
    screenshot = pyautogui.screenshot(region=(x1, y1, x2 - x1, y2 - y1))
    screenshot.save(output_path)

if __name__ == "__main__":
    '''
    if len(sys.argv) != 5:
        print("Uso: python CaptureScreenshot.py <x1> <y1> <x2> <y2>")
        sys.exit(1)
    '''
    # Obtener coordenadas de los argumentos de línea de comandos
    '''
    x1 = int(sys.argv[1])
    y1 = int(sys.argv[2])
    x2 = int(sys.argv[3])
    y2 = int(sys.argv[4])
    '''
    posx = 881
    posy = 1277
    ancho = 776
    alto = 597
    x1 = round(posx - (ancho*0.03608))
    y1 = round(posy - (alto*0.1038))  
    x2 = posx
    y2 = round(posy - (alto*0.0536)) 

    # Directorio del script actual
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(script_dir, "screenshot.png")

    # Capturar la captura de pantalla
    capture_screenshot(x1, y1, x2, y2, output_path)
    print(f"Captura de pantalla guardada en: {output_path}")