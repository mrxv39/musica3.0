import cv2
import numpy as np
import mss
import time
import os
import subprocess
import json
import pytesseract
from concurrent.futures import ThreadPoolExecutor
from queue import Queue
import threading
from PIL import Image
import re
import webcolors
from datetime import datetime
import sys
import db_sqlite
import tkinter as tk





def ejecutar_script_cerrar_popup_simple(mesa):
    start_time = time.time()
    try:
        # Suponiendo que 'cerrar_popup_simple.pyw' está en el mismo directorio
        script_path = './python/cerrar_popup_simple.pyw'
        
        # Construir el comando completo con argumentos
        comando = ['python', script_path, str(mesa)]
        
        # Ejecutar el script en segundo plano y ocultar la ventana
        subprocess.Popen(comando, creationflags=subprocess.CREATE_NO_WINDOW)
        
        print(f'Se ejecutó correctamente el script para la mesa {mesa}.')
        
    except Exception as e:
        print(f'Error al ejecutar el script para la mesa {mesa}: {e}')
    
    end_time = time.time()
    if tiempo:
        print(f"ejecutar_script_cerrar_popup_simple: {end_time - start_time:.4f} segundos")

def ejecutar_script_captura_screenshot_mesa(x1, y1, x2, y2, ruta_base, mesa, quality=10):

    start_time = time.time()
    # Captura de pantalla
    with mss.mss() as sct:
        monitor = {"top": y1, "left": x1, "width": x2-x1, "height": y2-y1}
        sct_img = sct.grab(monitor)
        imagen_np = np.array(sct_img)

    # Convertir la imagen de BGRA a BGR
    imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)


    # Construir la ruta completa del archivo
    save_path = os.path.join(ruta_base, "screenshot_mesa_"+str(mesa)+".png")

    # Guardar la imagen con la calidad especificada
    cv2.imwrite(save_path, imagen_bgr, [cv2.IMWRITE_JPEG_QUALITY, quality])

    return save_path
    end_time = time.time()
    if tiempo:
        print(f"ejecutar_script_captura_screenshot: {end_time - start_time:.4f} segundos")

def ejecutar_script_captura_screenshot(x1, y1, x2, y2, save_img_mesa, quality=60):

    start_time = time.time()
    # Captura de pantalla
    with mss.mss() as sct:
        monitor = {"top": y1, "left": x1, "width": x2-x1, "height": y2-y1}
        sct_img = sct.grab(monitor)
        imagen_np = np.array(sct_img)

    # Convertir la imagen de BGRA a BGR
    imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)

    # Guardar la imagen con la calidad especificada
    cv2.imwrite(save_img_mesa, imagen_bgr, [cv2.IMWRITE_JPEG_QUALITY, quality])

    end_time = time.time()
    if tiempo:
        print(f"ejecutar_script_captura_screenshot: {end_time - start_time:.4f} segundos")

def buscar_imagen_en_area(imagen_a_buscar, imagen_fuente, area_busqueda, umbral=0.80):
    start_time = time.time()
    
    # Cargar las imágenes
    imagen_a_buscar = cv2.imread(imagen_a_buscar, cv2.IMREAD_GRAYSCALE)
    imagen_area = cv2.imread(imagen_fuente)

    # Verificar si las imágenes se cargaron correctamente
    if imagen_a_buscar is None:
        raise ValueError(f"No se pudo cargar la imagen a buscar desde la ruta: {imagen_a_buscar}")
    if imagen_area is None:
        raise ValueError(f"No se pudo cargar la imagen de área desde la ruta: {imagen_fuente}")

    # Convertir la imagen de área a escala de grises si es necesario
    if len(imagen_area.shape) > 2:
        imagen_area_gray = cv2.cvtColor(imagen_area, cv2.COLOR_BGR2GRAY)
    else:
        imagen_area_gray = imagen_area

    # Obtener dimensiones de la imagen a buscar
    h, w = imagen_a_buscar.shape

    # Extraer coordenadas del área de búsqueda
    x_start, y_start, x_end, y_end = area_busqueda
    area_a_buscar = imagen_area_gray[y_start:y_end, x_start:x_end].copy()  # Copia para no modificar la original

    # Realizar la búsqueda de coincidencias dentro del área específica
    result = cv2.matchTemplate(area_a_buscar, imagen_a_buscar, cv2.TM_CCOEFF_NORMED)

    # Encontrar ubicaciones donde la coincidencia supera el umbral
    loc = np.where(result >= umbral)

    # Obtener las coordenadas globales de la esquina superior izquierda
    positions = []
    for pt in zip(*loc[::-1]):
        x_global = pt[0] + x_start
        y_global = pt[1] + y_start
        positions.append((x_global, y_global))

    end_time = time.time()
    if tiempo2:
        print(f"buscar_imagen_en_area: {end_time - start_time:.4f} segundos")
    
    # Devolver True y las posiciones si se encontraron coincidencias
    if positions:
        return True, positions
    else:
        return False, None


def buscar_imagen_en_area2(ruta_imagen_a_buscar, imagen_fuente, umbral=0.83):
    start_time = time.time()

    # Cargar la imagen a buscar desde la ruta especificada
    imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
    if imagen_a_buscar is None or imagen_a_buscar.size == 0:
        print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar} o está vacía.")
        return False, None

    # Usar la técnica de coincidencia de plantillas con imágenes en color BGR
    res = cv2.matchTemplate(imagen_fuente, imagen_a_buscar, cv2.TM_CCOEFF_NORMED)

    # Encontrar las ubicaciones donde la coincidencia es mayor o igual al umbral
    loc = np.where(res >= umbral)

    if len(loc[0]) > 0:
        # Coordenadas (x, y) de la primera coincidencia
        pt = list(zip(*loc[::-1]))[0]
        
        '''
        # Dibuja un rectángulo alrededor del área encontrada
        rectangulo = (pt[0], pt[1], imagen_a_buscar.shape[1], imagen_a_buscar.shape[0])
        cv2.rectangle(imagen_fuente, (rectangulo[0], rectangulo[1]), 
                      (rectangulo[0] + rectangulo[2], rectangulo[1] + rectangulo[3]), 
                      (0, 255, 0), 2)

        # Guarda la imagen fuente con el rectángulo dibujado
        cv2.imwrite('captura_con_rectangulo.png', imagen_fuente)
        '''
        if tiempo2:
            end_time = time.time()
            print(f"buscar_imagen_en_area: {end_time - start_time:.4f} segundos")
        
        return True, pt
    else:
        if tiempo2:
            end_time = time.time()
            print(f"buscar_imagen_en_area: {end_time - start_time:.4f} segundos")
        
        return False, None

def capturar_imagen(region):
    start_time = time.time()
    with mss.mss() as sct:
        monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
        sct_img = sct.grab(monitor)
        imagen_np = np.array(sct_img)
    imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)
    return imagen_bgr

    end_time = time.time()
    if tiempo:
        print(f"capturar_imagen: {end_time - start_time:.4f} segundos")

def encontrar_imagen(ruta_imagen_a_buscar, imagen_bgr, region_imagen):
    start_time = time.time()
    imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
    if imagen_a_buscar is None:
        print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar}")
        return False, None

    encontrada, ubicacion_rel = buscar_imagen_en_area(imagen_a_buscar, imagen_bgr)
    if not encontrada:
        #print(f"La imagen {ruta_imagen_a_buscar} no fue encontrada.")
        return False, None
    else:
        ubicacion_abs = (ubicacion_rel[0] + region_imagen[0], ubicacion_rel[1] + region_imagen[1])
        return True, ubicacion_abs

    end_time = time.time()
    if tiempo2:
        print(f"encontrar_imagen: {end_time - start_time:.4f} segundos")

def encontrar_imagen_con_umbral(ruta_imagen_a_buscar, imagen_bgr, region_imagen, umbral=0.75):
    start_time = time.time()
    
    # Cargar la imagen a buscar
    imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
    if imagen_a_buscar is None:
        print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar}")
        return False, None
    
    # Definir la región de la imagen donde se buscará
    x, y, w, h = region_imagen
    
    # Validar que la región está dentro de los límites de la imagen
    if x < 0 or y < 0 or x + w > imagen_bgr.shape[1] or y + h > imagen_bgr.shape[0]:
        print("Error: La región especificada está fuera de los límites de la imagen.")
        return False, None
    
    sub_imagen = imagen_bgr[y:y+h, x:x+w]
    
    # Validar que la subimagen no está vacía
    if sub_imagen.size == 0:
        print("Error: La subimagen está vacía.")
        return False, None

    # Convertir a escala de grises
    imagen_a_buscar_gray = cv2.cvtColor(imagen_a_buscar, cv2.COLOR_BGR2GRAY)
    sub_imagen_gray = cv2.cvtColor(sub_imagen, cv2.COLOR_BGR2GRAY)

    # Buscar la plantilla en la imagen
    res = cv2.matchTemplate(sub_imagen_gray, imagen_a_buscar_gray, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)

    # Comprobar si la coincidencia supera el umbral
    if max_val >= umbral:
        ubicacion_rel = max_loc
        ubicacion_abs = (ubicacion_rel[0] + x, ubicacion_rel[1] + y)
        if tiempo:
            end_time = time.time()
            print(f"encontrar_imagen: {end_time - start_time:.4f} segundos")
        return True, ubicacion_abs
    else:
        if tiempo:
            end_time = time.time()
            print(f"encontrar_imagen: {end_time - start_time:.4f} segundos")
        return False, None

def capture_and_process(region, scale_percent, whitelist, config, result_key, result_queue, save_path, zoom_factor=2):
    start_time = time.time()
    try:
        # Validar y asegurar que los valores de la región son enteros
        region = tuple(map(int, region))
        
        # Captura de pantalla
        with mss.mss() as sct:
            monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
            sct_img = sct.grab(monitor)
            imagen_np = np.array(sct_img)
        
        # Convertir la imagen a RGB para el análisis de color
        imagen_rgb = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2RGB)
        
        # Obtener el color predominante solo para p2name y p3name
        if result_key in ['p2stack', 'p3stack', 'carta1', 'carta2', 'carta1_flop', 'stackefect']:
            color_predominante = obtener_color_predominante(imagen_rgb)
            categoria_color = categorizar_color(color_predominante)
            #print(f"Color predominante en {result_key}: {categoria_color}")

            # Guardar el color categorizado en las variables correspondientes
            if result_key == 'p2stack':
                global p2 
                p2 = categoria_color
            elif result_key == 'p3stack':
                global p3
                p3 = categoria_color
            elif result_key == 'carta1':
                global palo1 
                palo1 = categoria_color
            elif result_key == 'carta2':
                global palo2
                palo2 = categoria_color
            elif result_key == 'carta1_flop':
                global carta1_flop
                carta1_flop = categoria_color



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
        
        # Guardar imagenes
        pil_image_zoom = Image.fromarray(imagen_zoom)
        image_path = os.path.join(save_path, f"{result_key}.png")
        pil_image_zoom.save(image_path)
        
        # Realizar OCR en la imagen ampliada para p2stack y p3stack
        if result_key in ['p2stack', 'p3stack', 'carta1', 'carta2', 'p2name']:
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

    end_time = time.time()
    if tiempo2:
        print(f"\ncapture_and_process: {end_time - start_time:.4f} segundos")

def capture_and_process2(region, scale_percent, whitelist, config, result_key, result_queue, save_path, zoom_factor=2):
    start_time = time.time()
    try:
        # Validar y asegurar que los valores de la región son enteros
        region = tuple(map(int, region))
        
        # Captura de pantalla
        with mss.mss() as sct:
            monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
            sct_img = sct.grab(monitor)
            imagen_np = np.array(sct_img)
        
        # Convertir la imagen a RGB para el análisis de color
        imagen_rgb = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2RGB)
        
        

        # Convertir la imagen de BGRA a escala de grises
        imagen_gris = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2GRAY)
        
        # Redimensionar la imagen si es necesario
        if scale_percent != 100:
            width = int(imagen_gris.shape[1] * scale_percent / 100)
            height = int(imagen_gris.shape[0] * scale_percent / 100)
            imagen_gris_resized = cv2.resize(imagen_gris, (width, height), interpolation=cv2.INTER_LANCZOS4)
        else:
            imagen_gris_resized = imagen_gris.copy()
        
        # Aplicar técnicas de preprocesamiento
        imagen_gris_resized = cv2.GaussianBlur(imagen_gris_resized, (5, 5), 0)  # Filtro gaussiano
        imagen_gris_resized = cv2.adaptiveThreshold(imagen_gris_resized, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)  # Umbralización adaptativa

        # Ampliar la imagen para mejorar la detección del punto
        width_zoom = int(imagen_gris_resized.shape[1] * zoom_factor)
        height_zoom = int(imagen_gris_resized.shape[0] * zoom_factor)
        imagen_zoom = cv2.resize(imagen_gris_resized, (width_zoom, height_zoom), interpolation=cv2.INTER_LANCZOS4)
        
        # Guardar imágenes
        pil_image_zoom = Image.fromarray(imagen_zoom)
        image_path = os.path.join(save_path, f"{result_key}.png")
        pil_image_zoom.save(image_path)
        
       
        
        # Guardar el resultado en la cola
        result = {result_key: texto_ocr.strip()}
        result_queue.put(result)
    except Exception as e:
        print(f"Error capturing or processing region {region}: {e}")

    end_time = time.time()
    if tiempo2:
        print(f"\ncapture_and_process: {end_time - start_time:.4f} segundos")

def obtener_color_predominante(imagen_rgb):
    start_time = time.time()
    # Redimensionar la imagen a un tamaño más pequeño para acelerar el cálculo
    imagen_pequena = cv2.resize(imagen_rgb, (50, 50))
    
    # Convertir la imagen a una lista de píxeles
    pixels = np.float32(imagen_pequena.reshape(-1, 3))
    
    # Definir el criterio de convergencia y número de clusters
    criterios = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 100, 0.2)
    _, labels, palette = cv2.kmeans(pixels, 1, None, criterios, 10, cv2.KMEANS_RANDOM_CENTERS)
    
    # Contar la frecuencia de cada color
    _, counts = np.unique(labels, return_counts=True)
    
    # Obtener el color más frecuente
    color_predominante = palette[np.argmax(counts)]
    
    # Convertir el color a una tupla de enteros
    return tuple(map(int, color_predominante))

    end_time = time.time()
    if tiempo:
        print(f"obtener_color_predominante: {end_time - start_time:.4f} segundos")

def obtener_nombre_color(rgb_color):
    start_time = time.time()
    try:
        # Intentar obtener el nombre exacto del color
        nombre_color = webcolors.rgb_to_name(rgb_color)
    except ValueError:
        # Si no se encuentra el nombre exacto, encontrar el nombre más cercano
        nombre_color = obtener_nombre_color_cercano(rgb_color)
        #print(nombre_color) 
    return nombre_color
    end_time = time.time()
    if tiempo:
        print(f"obtener_nombre_color: {end_time - start_time:.4f} segundos")

def obtener_nombre_color_cercano(rgb_color):
    start_time = time.time()
    min_distancia = float('inf')
    nombre_color_cercano = None
    for nombre, codigo in webcolors.CSS3_NAMES_TO_HEX.items():
        r_c, g_c, b_c = webcolors.hex_to_rgb(codigo)
        distancia = (r_c - rgb_color[0])**2 + (g_c - rgb_color[1])**2 + (b_c - rgb_color[2])**2
        if distancia < min_distancia:
            min_distancia = distancia
            nombre_color_cercano = nombre
    return nombre_color_cercano 
    end_time = time.time()
    if tiempo:
        print(f"obtener_nombre_color_cercano: {end_time - start_time:.4f} segundos")

def categorizar_color(rgb_color):

    start_time = time.time()
    categorias_colores = {
        'rojo': ['red', 'darkred', 'firebrick', 'crimson', 'brown', 'maroon','saddlebrown', 'sienna', 'peru', 'chocolate', 'olive' , 'olivedrab'],
        'verde': ['green', 'darkgreen', 'forestgreen', 'seagreen', 'limegreen', 'olive', 'darkolivegreen'],
        'azul': ['blue', 'darkblue', 'mediumblue', 'navy', 'royalblue', 'skyblue', 'steelblue', 'cadetblue'],
        'amarillo': ['yellow', 'gold', 'khaki', 'darkkhaki', 'goldenrod', 'darkgoldenrod'],
        'naranja': ['orange', 'darkorange', 'coral', 'orangered'],
        'morado': ['purple', 'indigo', 'darkviolet', 'darkorchid', 'darkmagenta', 'darkslateblue', 'mediumvioletred'],
        'rosa': ['pink', 'lightpink', 'hotpink'],
        'gris': ['gray', 'darkgray', 'dimgray', 'lightgray', 'slategray', 'darkslategray'],
        'negro': ['black'],
        'blanco': ['white', 'snow', 'honeydew', 'mintcream', 'azure', 'aliceblue']
    }



    nombre_color = obtener_nombre_color(rgb_color)
    #print(nombre_color + "\n")
    for categoria, colores in categorias_colores.items():
        if nombre_color in colores:
            return categoria
    return 'desconocido'

    end_time = time.time()
    if tiempo:
        print(f"categorizar_color: {end_time - start_time:.4f} segundos")

def ejecutar_script(script_path, variables, result_queue=None):
    start_time = time.time()

    # Comando para ejecutar el script de AutoHotkey
    comando = ["AutoHotkey.exe", script_path] + variables
    try:
        # Ejecutar el script en segundo plano sin mostrar una ventana
        subprocess.Popen(comando, creationflags=subprocess.CREATE_NO_WINDOW)
        if result_queue:
            result_queue.put({"status": "success"})
    except Exception as e:
        print(f"Error al ejecutar el script {script_path}: {e}")
        if result_queue:
            result_queue.put({"status": "error", "message": str(e)})

    if tiempo2:
        end_time = time.time()
        print(f"ejecutar_script: {end_time - start_time:.4f} segundos")

def scripts_autohotkey (variables_script):
    start_time = time.time()
    # Definir los paths de los scripts de AutoHotkey
    script1_path = os.path.join(ruta_base, "includes", "BTN.ahk")
    script3_path = os.path.join(ruta_base, "includes", "BBvsSB_AI_HU.ahk")
    script2_path = os.path.join(ruta_base, "includes", "SBvsBB_HU_2.ahk")
    script4_path = os.path.join(ruta_base, "includes", "BBvsSB_LIMP_HU.ahk")
    script5_path = os.path.join(ruta_base, "includes", "BBvsSB_MINOR_HU.ahk")
    #script6_path = os.path.join(ruta_base, "includes", "SBvsBB_HUvsROL_AI.ahk")
    script7_path = os.path.join(ruta_base, "includes", "SBvsBB_3H.ahk")
    script8_path = os.path.join(ruta_base, "includes", "BBvsBTN_AI.ahk")
    script9_path = os.path.join(ruta_base, "includes", "BBvsBTN_LIMP.ahk")
    script10_path = os.path.join(ruta_base, "includes", "BBvsBTN_MINOR.ahk")
    script11_path = os.path.join(ruta_base, "includes", "SB_3HvsBTN_OS.ahk")
    script12_path = os.path.join(ruta_base, "includes", "BBvsSB_P3_MINOR.ahk")
    script13_path = os.path.join(ruta_base, "includes", "SBvsBTN_MINOR.ahk")
    script14_path = os.path.join(ruta_base, "includes", "BBvsSB_LIMP_3H.ahk")
    script15_path = os.path.join(ruta_base, "includes", "BBvsSB_ORx3_3H.ahk")
    script16_path = os.path.join(ruta_base, "includes", "BBvsSB_ORx25_3H.ahk")
    script17_path = os.path.join(ruta_base, "includes", "BBvsSB_p3_AI_3H.ahk")
    script18_path = os.path.join(ruta_base, "includes", "BBvsSQZ.ahk")
    script19_path = os.path.join(ruta_base, "includes", "SBvsBTN_LIMP.ahk")

    # Crear colas para recoger los resultados
    result_queue1 = Queue()
    result_queue2 = Queue()
    result_queue3 = Queue()
    result_queue4 = Queue()
    result_queue5 = Queue()
    #result_queue6 = Queue()
    result_queue7 = Queue()
    result_queue8 = Queue()
    result_queue9 = Queue()
    result_queue10 = Queue()
    result_queue11 = Queue()
    result_queue12 = Queue()
    result_queue13 = Queue()
    result_queue14 = Queue()
    result_queue15 = Queue()
    result_queue16 = Queue()
    result_queue17 = Queue()
    result_queue18 = Queue()
    result_queue19 = Queue()

    # Crear los threads para ejecutar los scripts simultáneamente
    thread1 = threading.Thread(target=ejecutar_script, args=(script1_path, variables_script, result_queue1))
    thread2 = threading.Thread(target=ejecutar_script, args=(script2_path, variables_script, result_queue2))
    thread3 = threading.Thread(target=ejecutar_script, args=(script3_path, variables_script, result_queue3))
    thread4 = threading.Thread(target=ejecutar_script, args=(script4_path, variables_script, result_queue4))
    thread5 = threading.Thread(target=ejecutar_script, args=(script5_path, variables_script, result_queue5))
    #thread6 = threading.Thread(target=ejecutar_script, args=(script6_path, variables_script, result_queue6))
    thread7 = threading.Thread(target=ejecutar_script, args=(script7_path, variables_script, result_queue7))
    thread8 = threading.Thread(target=ejecutar_script, args=(script8_path, variables_script, result_queue8))
    thread9 = threading.Thread(target=ejecutar_script, args=(script9_path, variables_script, result_queue9))
    thread10 = threading.Thread(target=ejecutar_script, args=(script10_path, variables_script, result_queue10))
    thread11 = threading.Thread(target=ejecutar_script, args=(script11_path, variables_script, result_queue11))
    thread12 = threading.Thread(target=ejecutar_script, args=(script12_path, variables_script, result_queue12))
    thread13 = threading.Thread(target=ejecutar_script, args=(script13_path, variables_script, result_queue13))
    thread14 = threading.Thread(target=ejecutar_script, args=(script14_path, variables_script, result_queue14))
    thread15 = threading.Thread(target=ejecutar_script, args=(script15_path, variables_script, result_queue15))
    thread16 = threading.Thread(target=ejecutar_script, args=(script16_path, variables_script, result_queue16))
    thread17 = threading.Thread(target=ejecutar_script, args=(script17_path, variables_script, result_queue17))
    thread18 = threading.Thread(target=ejecutar_script, args=(script18_path, variables_script, result_queue18))
    thread19 = threading.Thread(target=ejecutar_script, args=(script19_path, variables_script, result_queue19))

    # Iniciar los threads
    thread1.start()
    thread2.start()
    thread3.start()
    thread4.start()
    thread5.start()
    #thread6.start()
    thread7.start()
    thread8.start()
    thread9.start()
    thread10.start()
    thread11.start()
    thread12.start()
    thread13.start()
    thread14.start()
    thread15.start()
    thread16.start()
    thread17.start()
    thread18.start()
    thread19.start()

    # Esperar a que ambos threads terminen
    #thread1.join()
    #thread2.join()
    #thread3.join()

    # Recoger los resultados de las colas
    #resultados_script1 = result_queue1.get()
    #resultados_script2 = result_queue2.get()
    end_time = time.time()
    if tiempo2:
        print(f"scripts_autohotkey: {end_time - start_time:.4f} segundos")

def condiciones_salida_preflop (ubicacion_tercera, posx,posy,imagen_fuente, ubicacion_primera):
    start_time = time.time()

    executor = ThreadPoolExecutor(max_workers=4)
    result_queue = Queue()
    # Guardar las coordenadas iniciales de la tercera imagen
    coordenadas_tercera_iniciales = ubicacion_tercera


    
    # Bucle para buscar la tercera imagen hasta que las coordenadas cambien
    while True:
        condicion_salida = None  # Inicialización fuera del bucle
        # Verificar la primera imagen
        #print("Buscando primera imagen...")
        
        ubicacion_primera_actual = ubicacion_primera
        encontrada_primera = buscar_imagen_en_area(ruta_img_time, imagen_fuente, region_time)
        #print(encontrada_primera, ubicacion_primera_actual)
        

        # Verificar la segunda imagen
        #print("Buscando segunda imagen...")
        imagen_segunda = executor.submit(capture_and_process, region_carta1_flop, 200, '', '', 'carta1_flop', result_queue, save_path)
        

        # Verificar la tercera imagen
        #print("Buscando dealer para ver si ha cambiado...")
        result = buscar_imagen_en_area(ruta_img_dealer, imagen_fuente, region_delaer)


        ubicacion_tercera_actual = ubicacion_tercera
        encontrada_tercera = buscar_imagen_en_area(ruta_img_dealer, imagen_fuente, region_delaer)
        encontrada_tercera = encontrada_tercera[0]

        # Realizar OCR en la región p1bet
        #print("Realizando OCR en la región p1bet...")
        region_p1bet = (x1 +388, y1 +378, 50, 20)
        capture_and_process(region_p1bet, 200, '', '--psm 6 -c tessedit_char_whitelist=0123456789dhsc', 'p1bet', result_queue, save_path)

        # Recoger el resultado de p1bet del queue
        p1bet_nuevo = ""
        while not result_queue.empty():
            result = result_queue.get()
            if 'p1bet' in result:
                p1bet_nuevo = result['p1bet']

        # Comprobar todas las condiciones antes de proceder
        if not encontrada_primera:
            condicion_salida = "NO TIME"
        elif carta1_flop != "negro":
            condicion_salida = "NO NO BOARD"
        elif ubicacion_tercera_actual != coordenadas_tercera_iniciales:
            condicion_salida = f"DEALER OTRA POSICION"
        elif p1bet_nuevo != p1bet:
            condicion_salida = f"P1BET OTRO VALOR"

        if condicion_salida is not None:
            print(f"{condicion_salida}. SALIENDO DEL PREFLOP ")
            break

        if debug:
            time.sleep(2)

        print("BUSCANDO CONDICION DE SALIDA")
        #time.sleep()

    end_time = time.time()
    if tiempo:
        print(f"condiciones_salida_preflop: {end_time - start_time:.4f} segundos")

def verificar_mano(mano, x1, y1, x2, y2, save_img_mesa):
    start_time = time.time()
    valid_chars = set('AKQJT23456789HSCD')
    mano = mano.replace("‘rojo", "5rojo")
    mano = mano.replace("©gris", "5S")
    mano = mano.replace("‘gris", "5S")
    mano = mano.replace("gris", "S")
    mano = mano.replace("rojo", "H")
    mano = mano.replace("verde", "C")
    mano = mano.replace("azul", "D")
    mano = mano.replace("0H", "6H")
    mano = mano.replace("MC", "2C")
    mano = mano.replace(")S", "5S")
    mano = mano.replace(".png", "")
    mano = mano.replace("  ", "")
    mano = mano.replace(" ", "")
    mano = mano.replace("|", "")

  


    
    
    return mano

    end_time = time.time()
    if tiempo:
        print(f"verificar_mano: {end_time - start_time:.4f} segundos")

def verificar_stack(stack):
    if isinstance(stack, (int, float)):
        print(f"{stack} es un número")
    else:
        if stack == ".":
            stack = "0"
        stack = stack.replace(".0", "0")
        if stack.startswith('.'):
            stack = stack[1:]
    
    return stack

def verificar_stackefectivo(stackefect):
    stackefect = stackefect.replace(",", ".")
    if stackefect.endswith('.'):
        stackefect = stackefect[:-1]  # Elimina el último carácter
    stackefect = stackefect.replace("i", "1")
    stackefect = stackefect.replace(" —", "")
    try:
        stackefect = float(stackefect)
        print("El valor de stackefect como float es:", stackefect)
    except ValueError:
        print("Error: No se pudo convertir stackefect a float. Verifica el formato del número.")

    
    return stackefect

def match_images_in_directory(region, directory_path, scale_percent=100, threshold=0.8, zoom_factor=2, umbral=0.50):
    
    #directory_path  = directory_path +"\img\img_referencia\baraja\cartas"
    directory_path = 'C:\\Users\\Usuario\\Desktop\\AHK-Studio-master\\Projects\\musica\\img\\img_referencia\\baraja\\cartas'
    image_files = [f for f in os.listdir(directory_path) if f.endswith(('png', 'jpg', 'jpeg'))]

    # Capturar la región de la pantalla
    with mss.mss() as sct:
        monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
        sct_img = sct.grab(monitor)
        screen_image_np = np.array(sct_img)

    # Convertir la imagen de pantalla a escala de grises
    screen_image_gray = cv2.cvtColor(screen_image_np, cv2.COLOR_BGRA2GRAY)

    # Redimensionar la imagen de pantalla si es necesario
    if scale_percent != 100:
        width = int(screen_image_gray.shape[1] * scale_percent / 100)
        height = int(screen_image_gray.shape[0] * scale_percent / 100)
        screen_image_gray = cv2.resize(screen_image_gray, (width, height), interpolation=cv2.INTER_CUBIC)

    # Ampliar la imagen de pantalla para mejorar la detección del punto
    width_zoom = int(screen_image_gray.shape[1] * zoom_factor)
    height_zoom = int(screen_image_gray.shape[0] * zoom_factor)
    screen_image_zoom = cv2.resize(screen_image_gray, (width_zoom, height_zoom), interpolation=cv2.INTER_CUBIC)

    results = []

    # Recorrer cada archivo de imagen en el directorio
    for image_file in image_files:
        # Leer la imagen de referencia
        image_path = os.path.join(directory_path, image_file)
        ref_image = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)

        # Redimensionar la imagen de referencia si es necesario
        if scale_percent != 100:
            ref_width = int(ref_image.shape[1] * scale_percent / 100)
            ref_height = int(ref_image.shape[0] * scale_percent / 100)
            ref_image = cv2.resize(ref_image, (ref_width, ref_height), interpolation=cv2.INTER_CUBIC)

        # Realizar la coincidencia de plantilla
        res = cv2.matchTemplate(screen_image_zoom, ref_image, cv2.TM_CCOEFF_NORMED)
        loc = np.where(res >= threshold)

        # Guardar resultados si se encuentran coincidencias
        for pt in zip(*loc[::-1]):
            result = {
                'image_file': image_file,
                'position': pt,
                'match_value': res[pt[1], pt[0]]
            }
            if res[pt[1], pt[0]] >= umbral:
                results.append(result)

    return results

def buscar_img_carta1(ruta_base,palo1):
    save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartas')
    if palo1 == "negro":
        time.sleep(0.05)
    if palo1 == "azul":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasd')
    elif palo1 == "gris":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartass')
    elif palo1 == "verde":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasc')
    elif palo1 == "rojo":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartash')
    image_files = [f for f in os.listdir(save_img_mesa) if f.endswith(('png', 'jpg', 'jpeg'))]

    region_carta1 = (x1 +338, y1 +408, 50, 35)
    region_imagen = region_carta2

    imagen_bgr = capturar_imagen(region_carta1)

    

    results = []

    # Recorrer cada archivo de imagen en el directorio
    for image_file in image_files:
        # Leer la imagen de referencia
        image_path = os.path.join(save_img_mesa, image_file)
        encontrada, ubicacion_abs = buscar_imagen_en_area2(image_path, imagen_bgr)
        #print(image_path)
        if encontrada is True:
            break
     

    return image_file

def buscar_img_carta2(ruta_base,palo2):
    save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartas')
    if palo2 == "azul":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasd')
    elif palo2 == "gris":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartass')
    elif palo2 == "verde":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasc')
    elif palo2 == "rojo":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartash')

    image_files = [f for f in os.listdir(save_img_mesa) if f.endswith(('png', 'jpg', 'jpeg'))]

    region_carta2 = (x1 +389, y1 +408, 50, 35)
    region_imagen = region_carta2

    imagen_bgr = capturar_imagen(region_carta1)

    

    results = []

    # Recorrer cada archivo de imagen en el directorio
    for image_file in image_files:
        # Leer la imagen de referencia
        image_path = os.path.join(save_img_mesa, image_file)
        encontrada, ubicacion_abs = buscar_imagen_en_area2(image_path, imagen_bgr)
        #print(image_path)
        if encontrada is True:
            break
     

    return image_file

def crear_ventana(contenido_variable, ancho, alto, x, y, mesa):
    def mostrar_ventana():
        root = tk.Tk()
        root.title(f'P2_hands_3h: {mesa}')
        root.geometry(f'{ancho}x{alto}+{x}+{y}')
        root.protocol("WM_DELETE_WINDOW", lambda: None)
        root.overrideredirect(True)
        root.attributes("-topmost", True)
        
        label = tk.Label(root, text=contenido_variable, font=('Arial', 10))
        label.pack(expand=True)
        
        root.mainloop()

    hilo_ventana = threading.Thread(target=mostrar_ventana)
    hilo_ventana.daemon = True
    hilo_ventana.start()

def cerrar_ventana(ventana):
    ventana.quit()  # 


# Parámetros de tamaño y posición de la ventana
ancho = 400
alto = 200
x = 100
y = 100
titulo = "Mi Ventana"

# Definición de variables


tiempo = 0
tiempo2 = 0
debug = 1
mesa = 2
x1 = 520
y1 = 807
x2 = 1296
y2 = 1404
ancho = 776
alto = 597

x1t = 0
y1t = 700
anchot = 500
altot = 700
'''
mesa = int(sys.argv[1])
x1 = int(sys.argv[2])
y1 = int(sys.argv[3])
x2 = int(sys.argv[4])
y2 = int(sys.argv[5])
ancho = int(sys.argv[6])
alto = int(sys.argv[7])
x1t = int(sys.argv[8])
y1t = int(sys.argv[9])
anchot = int(sys.argv[10])
altot = int(sys.argv[11])
tiempo = 0
tiempo2 = 0 
debug = 0
'''

x1p = 350
y1p = 455
x2p = 936
y2p = 1304

x1b = x1 + 255
y1b = y1 + 215
x2b = x2 - 345
y2b = y2 - 300

ruta_base = os.path.dirname(os.path.abspath(__file__))
ruta_img_time = os.path.join(ruta_base, "img", "img_referencia", "time1.bmp")
ruta_img_noboard = os.path.join(ruta_base, "img", "img_referencia", "noboard_negro.png")
ruta_img_dealer = os.path.join(ruta_base, "img", "img_referencia", "dealer2futbol.png")
ruta_img_tanto_porciento = os.path.join(ruta_base, "img", "img_referencia", "tantoporciento.png")
save_path = os.path.join(ruta_base, "img", f"captured_regions_{mesa}")
ruta_capture_screenshot = os.path.join(ruta_base, "python", "CaptureScreenshot.pyw")
#ruta_img_baraja = os.path.join(ruta_base, "img", "img_referencia", "baraja", "palos1")
save_path2 = os.path.join(ruta_base, "img", "captured_regions_2")


region_time = (x1p, y1p, x2p - x1p, y2p - y1p)
region_delaer = (120, 200, ancho-120, alto-150)
region_carta1_flop = (x1 + 265, y1 + 225, 20, 10)
region_tanto_porciento = (265,472, 265+62, 472+150)

region_segunda_imagen = (x1b, y1b, x2b - x1b, y2b - y1b)

region_palo1 = (x1+350, y1+400, 40, 70)
region_palo2 = (x1+410, y1+405, 30, 60)
region_carta1 = (x1 +389, y1 +408, 50, 35)
region_carta2 = (x1 +389, y1 +408, 50, 35)




def ejecutar_busqueda_concurrente():
    start_time = time.time() #________________________________________________________________________________________________________________________________________________

    imagen_fuente = ejecutar_script_captura_screenshot_mesa(x1, y1, x2, y2,ruta_base, mesa)

    result_queue = Queue()
    threads = []

    num_threads = 4
    with ThreadPoolExecutor(max_workers=num_threads) as executor:
        # Capturar imágenes de las regiones especificadas

        future_segunda_imagen = executor.submit(capture_and_process, region_carta1_flop, 200, '', '', 'carta1_flop', result_queue, save_path)
 



        imagen_segunda = future_segunda_imagen.result()
      
        
   

        # Buscar imágenes dentro de las capturas
        future_primera = executor.submit(buscar_imagen_en_area, ruta_img_time, imagen_fuente, region_time)
        future_tercera = executor.submit(buscar_imagen_en_area, ruta_img_dealer, imagen_fuente, region_delaer)
        future_cuarta_imagen = executor.submit(buscar_imagen_en_area, ruta_img_tanto_porciento, imagen_fuente, region_tanto_porciento)

        

        #COPIAR LA FORMA PARA NO IMPRIMIR INDEDINIDAMENTE LOS PRINT

        ubicacion_primera = future_primera.result()
        if ubicacion_primera[0] is True:
            #print(f"TIME ECONTRADO: {ubicacion_primera[1]}")
            print(f"TIME ECONTRADO:")
            lista_de_coordenadas = ubicacion_primera[1]
            tupla_de_coordenadas = lista_de_coordenadas[0]
            #print(ubicacion_primera)
            posx, posy = tupla_de_coordenadas
            #print(posx)

            #time.sleep(0.14)

            if carta1_flop == "negro":
                print(f"NO BOARD ENCONTRADO: ")

                ubicacion_tercera = future_tercera.result()
                if ubicacion_tercera[0] is True:
                    #print(f"Tercera imagen encontrada en coordenadas: {ubicacion_tercera}")
                    print(f"DEALER ENCONTRADO")
                    lista_de_coordenadas = ubicacion_tercera[1]
                    tupla_de_coordenadas = lista_de_coordenadas[0]
                    #print(ubicacion_tercera)
                    x_dealer, y_dealer = tupla_de_coordenadas
                    #print(x_dealer)

                    ubicacion_tanto = future_cuarta_imagen.result()
                    if ubicacion_tanto[0]:
                        print(f"STACKEFECT ENCONTRADO")
                        #FIN CAPTURA Y RECONOCIMIENTO DE IMAGENES

                        capture_time = time.time() - start_time #________________________________________________________________________________________________________________________________
                        start_save_screen = time.time()
                        timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]

                        #start_time = time.time()
                        save_img_mesa = os.path.join(ruta_base, 'img', 'errores', 'screenshot_{}.bmp'.format(timestamp))
                        future_screenshot = executor.submit(ejecutar_script_captura_screenshot, x1, y1, x2, y2, save_img_mesa)
                        #end_time = time.time()

                        #print(f"HACER CAPTURA: {end_time - start_time:.4f} segundos")
                        # Medir tiempo de captura de imágenes
                        

                        
                        save_screen_time = time.time() - start_save_screen  #________________________________________________________________________________________________________________________________
            
                        # Medir tiempo de ejecución de OCR
                        start_ocr_time = time.time()            #____________________________________________________________________________________________________________________________________________
                        # Definir las regiones para la captura y procesamiento de OCR
                        regions = [
                            ((x1 + 50, y1 +178, 103, 18), 200, '', '', 'p2name'), 
                            ((x1 + 70, y1 + 198, 60, 18), 230, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p2stack'),
                            ((x1 + 160, y1 + 220, 50, 20), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p2bet'),
                            ((x1 + 625, y1 +178, 103, 18), 200, '', '--psm 7', 'p3name'),
                            ((x1 + 645, y1 +198, 60, 18), 250, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p3stack'),
                            ((x1 + 565, y1 +220, 50, 20), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p3bet'),
                            #((posx - 10, posy - 270, 90, 23), 200, '', '--psm 7', 'bote_grande'),
                            #((posx + 0, posy - 170, 50, 40), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'bote'),
                            ((x1 +388, y1 +378, 50, 20), 200, '', '--psm 6 -c tessedit_char_whitelist=0123456789dhsc', 'p1bet'),
                            ((x1 +338, y1 +408, 50, 35), 230, '', '--psm 6 --oem 3', 'carta1'),
                            ((x1 +389, y1 +408, 50, 35), 230, '', '--psm 6 --oem 3', 'carta2'),
                            ((x1 + 265, y1 + 225, 20, 10), 200, '', '--psm 6', 'carta1_flop'),   
                            ((x1 +265, y1 + 472, 72, 42), 100, '', '--psm 7', 'stackefect'), 
                        ]
      
                        # Configurar un máximo de 16 hilos
                        max_threads = 16

                        # Limitar el número de hilos si hay menos regiones que hilos máximos
                        num_threads = min(max_threads, len(regions))

                        # Iniciar hilos para capturar y procesar OCR en las regiones especificadas
                        for i in range(num_threads):
                            region, scale_percent, whitelist, config, result_key = regions[i]
                            thread = threading.Thread(target=capture_and_process, args=(region, scale_percent, whitelist, config, result_key, result_queue, save_path))
                            threads.append(thread)
                            thread.start()

                        # Esperar a que todos los hilos terminen
                        for thread in threads:
                            thread.join()

                        

                        # Recopilar resultados de OCR
                        results = {}
                        while not result_queue.empty():
                            results.update(result_queue.get())

                        print("Resultados OCR:")

                        # Medir tiempo de OCR
                        ocr_time = time.time() - start_ocr_time #______________________________________________________________________________________________________________________________________






                        start_resto = time.time()               #______________________________________________________________________________________________________________________________________

                        print("RESTA", x_dealer -  posx)
                        if -240 < (x_dealer - posx) < -210:
                            p1btn = 1
                            p2btn = 0
                            p3btn = 1
                        elif -60 < (x_dealer - posx) < -40:
                            p1btn = 0
                            p2btn = 1
                            p3btn = 1
                        elif 250 < (x_dealer - posx) < 270:
                            p1btn = 1
                            p2btn = 1
                            p3btn = 0

                        
                        variables_a_extraer = ["p2name", "p2stack", "p2bet", "p3name", "p3stack", "p3bet", "stackefect", "bote_grande", "bote", "p1bet", "carta1", "carta2", "carta1_flop"]


                        # Diccionario para almacenar los resultados extraídos
                        valores_extraidos = {}

                        # Iterar sobre las variables que quieres extraer
                        for variable in variables_a_extraer:
                            if variable in results:
                                valores_extraidos[variable] = results[variable]
                            else:
                                valores_extraidos[variable] = None  # Manejar el caso si la variable no está presente

                        # Imprimir los valores extraídos (opcional)
                        print("Valores extraídos:")
                        for variable, valor in valores_extraidos.items():
                            print(f"{variable} = {valor}")
                            globals()[variable] = valor

                        #CONSULTAR SI EL JUGADOR ESTA EN NUESTRA DB 
                        print(p2name)
                        p2_manos_3h_db = db_sqlite.get_manos_3h(p2name)
                        print("MANOS 3H DB P2", p2_manos_3h_db)

                        crear_ventana(p2_manos_3h_db, 35, 15, x1+200, y1+240, mesa)


                        print(p3name)
                        p3_manos_3h_db = db_sqlite.get_manos_3h(p3name)
                        print("MANOS 3H DB P3", p3_manos_3h_db)

                        crear_ventana(p3_manos_3h_db, 35, 15, x1+716, y1+225, mesa)






                        print(p1btn, p2btn, p3btn)
                        #print("P2 : ", p2)
                        #print("P3 : ", p3)

                        result_carta1 = buscar_img_carta1(ruta_base,palo1)

                        result_carta2 = buscar_img_carta2(ruta_base,palo2)
                        #print("carta1 ocr", carta1)
                        #print("carta2 ocr", carta2)

                        valid_chars = set('AKQT234568HSCD') # quitado J,9,7,6

                        if carta1 and set(carta1).issubset(valid_chars):
                            result_carta1 = carta1
                        else:
                            None

                        if carta2 and set(carta2).issubset(valid_chars):
                            result_carta2 = carta2
                        else:
                            None

                        mano = str(result_carta1) + str(palo1) + str(result_carta2) + str(palo2)


                        mano = verificar_mano(mano, x1, y1, x2, y2, save_img_mesa)

                        

                        print("Mano: ", mano)
                        print("P2: ", p2)
                        print("P3: ", p3)

                        # Definir las variables que quieres pasar a cada script
                        #variables_script = [str(x1), str(y1), str(mesa), str(x1), str(y1), str(x2), str(y2), str(alto), str(ancho), str(x1t), str(y1t), str(anchot), str(altot), str(p2name), str(p2stack), str(p2bet), str(p2btn), str(p3name), str(p3stack), str(p3bet), str(p3btn), str(stackefect), str(p1bet), str(p1btn), str(mano), str(p2), str(p3), str(save_img_mesa)]


                        result_stackefect = verificar_stackefectivo(stackefect)
                        print("Stackefect:", result_stackefect)

                        result_p2stack = verificar_stack(p2stack)
                        print("P2stack:", result_p2stack)

                        result_p3stack = verificar_stack(p3stack)
                        print("P3stack:", result_p3stack)

                        variables_script = [str(x1), str(y1), str(mesa), str(x1), str(y1), str(x2), str(y2), str(alto), str(ancho), str(x1t), str(y1t), str(anchot), str(altot), str(p2name), str(result_p2stack), str(p2bet), str(p2btn), str(p3name), str(result_p3stack), str(p3bet), str(p3btn), str(result_stackefect), str(p1bet), str(p1btn), str(mano), str(p2), str(p3), str(save_img_mesa)]
                        scripts_autohotkey(variables_script)
                        resto_time = time.time() - start_resto # _______________________________________________________________________________________________________________________________________________________-




                        end_time = time.time()
                        if tiempo:
                            print(f"ejecutar_busqueda_concurrente: {end_time - start_time:.4f} segundos")
                            print(f"  - Captura de imágenes: {capture_time:.4f} segundos")
                            print(f"  - SAVE SCREEN: {save_screen_time:.4f} segundos")
                            print(f"  - OCR: {ocr_time:.4f} segundos")
                            print(f"  - RESTO: {resto_time:.4f} segundos")

                        
                        tiempo_total = time.time() - inicio
                        if tiempo:
                            print(f"ejecutar_busqueda_concurrente: {end_time - start_time:.4f} segundos")
                            
                        print("Tiempo total de ejecución:", round(tiempo_total, 3), "segundos")



                        
                        
                        condiciones_salida_preflop(ubicacion_tercera, posx,posy, imagen_fuente, ubicacion_primera)

                        time.sleep(0.005)
                        
                        

                        ejecutar_script_cerrar_popup_simple(mesa)

                    else:
                        print("BUSCANDO STACKEFECT")
                else:
                    print("BUSCANDO DEALER")
            else:
                print("BUSCANDO NO BOARD")
        else:
            print("BUSCANDO TIME")

    

# Bucle principal
while True:
    inicio = time.time()
    ejecutar_busqueda_concurrente()
    
    
    time.sleep(0.005)
