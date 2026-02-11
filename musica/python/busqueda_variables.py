import cv2
import numpy as np
import mss
import time
import pytesseract
from PIL import Image
import re
import threading
import queue
import os
import sys
import json
def capture_and_process(region, scale_percent, whitelist, config, result_key, result_queue, save_path, zoom_factor=2):
    try:
        # Validar y asegurar que los valores de la región son enteros
        region = tuple(map(int, region))
        
        with mss.mss() as sct:
            monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
            sct_img = sct.grab(monitor)
            imagen_np = np.array(sct_img)
        
        # Convertir la imagen de BGRA a escala de grises
        imagen_gris = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2GRAY)
        
        # Redimensionar la imagen si es necesario
        if scale_percent != 100:
            width = int(imagen_gris.shape[1] * scale_percent / 100)
            height = int(imagen_gris.shape[0] * scale_percent / 100)
            imagen_gris_resized = cv2.resize(imagen_gris, (width, height), interpolation=cv2.INTER_CUBIC)
        else:
            imagen_gris_resized = imagen_gris.copy()
        
        # Ampliar la imagen para mejorar la detección del punto
        width_zoom = int(imagen_gris_resized.shape[1] * zoom_factor)
        height_zoom = int(imagen_gris_resized.shape[0] * zoom_factor)
        imagen_zoom = cv2.resize(imagen_gris_resized, (width_zoom, height_zoom), interpolation=cv2.INTER_CUBIC)
        
        # Guardar la imagen capturada para verificación
        pil_image_zoom = Image.fromarray(imagen_zoom)
        image_path = os.path.join(save_path, f"{result_key}.png")
        pil_image_zoom.save(image_path)
        
        # Realizar OCR en la imagen ampliada para P2_stack y P3_stack
        if result_key in ['P2_stack', 'P3_stack']:
            # Aplicar umbralización leve
            _, imagen_umbral = cv2.threshold(imagen_gris_resized, 170, 255, cv2.THRESH_BINARY)
            
            # Redimensionar y ampliar la imagen umbralizada
            imagen_umbral_zoom = cv2.resize(imagen_umbral, (width_zoom, height_zoom), interpolation=cv2.INTER_CUBIC)
            
            # Convertir la imagen umbralizada y ampliada a PIL.Image
            pil_image_umbral_zoom = Image.fromarray(imagen_umbral_zoom)
            
            # Realizar OCR en la imagen umbralizada y ampliada
            texto_ocr = pytesseract.image_to_string(pil_image_umbral_zoom, config=config)
        else:
            # Realizar OCR directamente en la imagen ampliada sin umbralización para otras variables
            texto_ocr = pytesseract.image_to_string(pil_image_zoom, config=config)
        
        # Aplicar la whitelist si se proporciona
        if whitelist:
            texto_ocr = re.sub(rf'[^{whitelist}]', '', texto_ocr)
        
        # Guardar el resultado en la cola
        result = {result_key: texto_ocr.strip()}
        result_queue.put(result)
    except Exception as e:
        print(f"Error capturing or processing region {region}: {e}")



def buscar_imagen_en_area(imagen_a_buscar, imagen_fuente, umbral=0.9):
    if imagen_a_buscar is None:
        print("Error: La imagen a buscar no pudo ser cargada.")
        return False, None
    
    img_gray = cv2.cvtColor(imagen_fuente, cv2.COLOR_BGR2GRAY)
    template = cv2.cvtColor(imagen_a_buscar, cv2.COLOR_BGR2GRAY)
    res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)
    loc = np.where(res >= umbral)
    if len(loc[0]) > 0:
        return True, list(zip(*loc[::-1]))[0]  # Coordenadas (x, y) de la primera coincidencia
    else:
        return False, None

def encontrar_primera_imagen(ruta_imagen_a_buscar, region_primera_imagen):
    encontrada_primera = False
    ubicacion_primera_rel = None

    while not encontrada_primera:
        with mss.mss() as sct:
            monitor = {"top": region_primera_imagen[1], "left": region_primera_imagen[0], "width": region_primera_imagen[2], "height": region_primera_imagen[3]}
            sct_img = sct.grab(monitor)
            imagen_np = np.array(sct_img)
        
        imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)
        imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
        
        if imagen_a_buscar is None:
            print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar}")
            return None
        
        encontrada_primera, ubicacion_primera_rel = buscar_imagen_en_area(imagen_a_buscar, imagen_bgr)

        if not encontrada_primera:
            print("La primera imagen no fue encontrada. Intentando nuevamente...")
        else:
            # Calcular la ubicación absoluta en la pantalla
            ubicacion_primera_abs = (ubicacion_primera_rel[0] + region_primera_imagen[0], ubicacion_primera_rel[1] + region_primera_imagen[1])
            return ubicacion_primera_abs
    
    return None  # Retornar None si no se encontró la imagen

def encontrar_imagen(ruta_imagen_a_buscar, region, result_queue, result_key):
    encontrada = False
    ubicacion = None


    while not encontrada:
        with mss.mss() as sct:
            monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
            sct_img = sct.grab(monitor)
            imagen_np = np.array(sct_img)
        
        imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)
        # me he saltado ruta_imagen_a_buscar pq al pasarle la ruta llamando a la funcion pierde la integrida la ruta, si hay que pasar mas imagenes a buscar tendre que arreglarlo cuando llamamos aesta funcion
        imagen_a_buscar = cv2.imread(ruta_imagen_dealer) 
        
        if imagen_a_buscar is None:
            print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar}")
            return None
        
        encontrada, ubicacion = buscar_imagen_en_area(imagen_a_buscar, imagen_bgr)

        if encontrada:
            # Calcular la ubicación absoluta en la pantalla
            ubicacion = (ubicacion[0] + region[0], ubicacion[1] + region[1])
            result_queue.put((result_key, ubicacion))
            return ubicacion
    
    return None  # Retornar None si no se encontró la imagen

   

if __name__ == "__main__":
    inicio = time.time()
     # Leer los valores de la región desde los argumentos de la línea de comandos
    if len(sys.argv) != 9:
        print("Uso: python your_script.py <top> <left> <width> <height>")
        sys.exit(1)
    
    top = int(sys.argv[1])
    left = int(sys.argv[2])
    width = int(sys.argv[3])
    height = int(sys.argv[4])
    mesa = int(sys.argv[5])
    posx = int(sys.argv[6])
    posy = int(sys.argv[7])
    ruta_imagen_a_buscar = sys.argv[8]

    top = top -50
    left = left-50
    width = width-50
    height = height-50
    region_primera_imagen = (top, left, width, height)

    # Crear una carpeta para guardar las imágenes de las regiones
    save_path = f'img\\captured_regions_{mesa}'
    os.makedirs(save_path, exist_ok=True)

    ubicacion_primera = encontrar_primera_imagen(ruta_imagen_a_buscar, region_primera_imagen)

   


    if ubicacion_primera is not None:

        
        
        x_primera, y_primera = ubicacion_primera


        print(posx)
        print(x_primera)

        print(posx-x_primera)
        P1_dealer = 1
        P2_dealer = 0
        P3_dealer = 1

     # Evaluar la condición sobre x
        if 100 < (posx - x_primera) < 240:
            #print("entramos")
            P1_dealer = 1
            P2_dealer = 0
            P3_dealer = 1
        elif 0 < (posx - x_primera) < 100:
            P1_dealer = 0
            P2_dealer = 1
            P3_dealer = 1
        elif (posx - x_primera) < 0:
            P1_dealer = 1
            P2_dealer = 1
            P3_dealer = 0

        ubicaciones = {"image_1": ubicacion_primera}
        
        

        

        result_queue = queue.Queue()
        threads = []


       
        regions = [
            ((posx - 300, posy - 292, 90, 16), 200, '', '--psm 7', 'P2_name'), 
            ((posx - 300, posy - 273, 70, 18), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'P2_stack'),
            ((posx - 200, posy - 250, 50, 16), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'P2_bet'),
            ((posx + 265, posy - 292, 90, 16), 200, '', '--psm 7', 'P3_name'),
            ((posx + 265, posy - 273, 70, 18), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'P3_stack'),
            ((posx + 205, posy - 250, 50, 16), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'P3_bet'),
            ((posx - 10, posy - 270, 90, 23), 200, '', '--psm 7', 'bote_grande'),
            ((posx + 0, posy - 170, 50, 40), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'bote'),
            ((posx - 105, posy + 0, 72, 42), 100, '0123456789,.', '--psm 7', 'stackefectivo'),
            ((posx + 30, posy - 96, 50, 20), 200, '', '--psm 6 -c tessedit_char_whitelist=0123456789dhsc', 'p1bet'), 
            #((posx + 495, posy + 145, 20, 35), 200, '', '--psm 6 -c tessedit_char_whitelist=23456789AJKQT', 'carta1'),
            #((posx + 547, posy + 145, 20, 35), 200, '', '--psm 7 -c tessedit_char_whitelist=23456789AJKQT', 'carta2'),  
        ]

        for region, scale_percent, whitelist, config, result_key in regions:
            thread = threading.Thread(target=capture_and_process, args=(region, scale_percent, whitelist, config, result_key, result_queue, save_path))
            threads.append(thread)
            thread.start()

        for thread in threads:
            thread.join()

        results = {}
        results["P1_dealer"] = P1_dealer
        results["P2_dealer"] = P2_dealer
        results["P3_dealer"] = P3_dealer

        while not result_queue.empty():
            result = result_queue.get()
            results.update(result)

        for key, value in results.items():
            print(f"{key}: {value}")

        

        print(results)
        '''
        # Generar un diccionario con los resultados
        datos = {variable: results.get(variable, "No encontrado") for variable in [
            "P2_name", "P2_stack", "P2_bet", "P2_dealer", 
            "P3_name", "P3_stack", "P3_bet", "P3_dealer", 
            "stackefectivo", "bote_grande", "bote", "p1bet", "P1_dealer"
        ]}

        # Convertir los datos a formato JSON y imprimirlos
        json_output = json.dumps(datos, indent=4)
        print(json_output)

        '''
        # Guardar los resultados en un archivo de texto

        # Obtén la ruta del directorio actual del script
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Obtén la ruta del directorio padre
        parent_dir = os.path.dirname(current_dir)

        # Construye la ruta completa del archivo .txt en el directorio padre
        output_file_path = os.path.join(parent_dir, f"resultados_{mesa}.txt")


        # Medir el tiempo de escritura
        start_write_time = time.time()
        with open(output_file_path, "w") as file:
            for variable in ["P2_name", "P2_stack", "P2_bet", "P2_dealer", "P3_name", "P3_stack", "P3_bet", "P3_dealer", "stackefectivo", "bote_grande", "bote", "p1bet", "P1_dealer"]:
                file.write(f"{variable}: {results.get(variable, 'No encontrado')}\n")

        tiempo_total = time.time() - inicio
        print("Tiempo total de ejecución:", tiempo_total, "segundos")
        # Imprimir los resultados serializados como JSON en stdout
        print(json.dumps(results))
        sys.stdout.flush()  # Asegura que los datos se envíen inmediatamente

    else:
        print("La primera imagen no fue encontrada. No se puede continuar con el proceso.")
