from musica_validators import verificar_name, verificar_stack, verificar_stackefectivo, verificar_bet, verificar_mano
import webcolors

def obtener_nombre_color(rgb_color):
    try:
        nombre_color = webcolors.rgb_to_name(rgb_color)
    except ValueError:
        nombre_color = obtener_nombre_color_cercano(rgb_color)
    return nombre_color

def obtener_nombre_color_cercano(rgb_color):
    min_distancia = float('inf')
    nombre_color_cercano = None
    color_names = []
    try:
        # Try to get CSS3 color names using webcolors.names(spec='css3')
        color_names = list(webcolors.names(spec='css3'))
    except Exception:
        # Fallback to a small list of common color names
        color_names = [
            "red","green","blue","black","white","gray","yellow","orange","purple","pink","brown"
        ]
    for nombre in color_names:
        try:
            hex_code = webcolors.name_to_hex(nombre, spec='css3')
        except Exception:
            continue
        r_c, g_c, b_c = webcolors.hex_to_rgb(hex_code)
        distancia = (r_c - rgb_color[0])**2 + (g_c - rgb_color[1])**2 + (b_c - rgb_color[2])**2
        if distancia < min_distancia:
            min_distancia = distancia
            nombre_color_cercano = nombre
    return nombre_color_cercano

def safe_name_to_hex(name: str) -> str | None:
    """Safely convert a CSS3 color name to hex, or return None if not possible."""
    try:
        # Try the modern API if available
        return webcolors.name_to_hex(name, spec='css3')
    except Exception:
        pass
    # Fallback to attribute if it exists
    css3_dict = getattr(webcolors, 'CSS3_NAMES_TO_HEX', None)
    if css3_dict and isinstance(css3_dict, dict):
        hexval = css3_dict.get(name.lower())
        if hexval:
            return hexval
    return None
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
import queue
import pygetwindow as gw
import pyautogui





def ejecutar_script_cerrar_popup_simple(mesa, tiempo=False):
    start_time = time.time()
    try:
        # Suponiendo que 'cerrar_popup_simple.pyw' está en el mismo directorio
        script_path = './python/cerrar_popup_simple.pyw'
        
        # Construir el comando completo con argumentos
        comando = ['pythonw', script_path, str(mesa)]
        
        # Ejecutar el script en segundo plano y ocultar la ventana
        process = subprocess.Popen(comando, creationflags=subprocess.CREATE_NO_WINDOW)
        
        print(f'Se ejecutó correctamente el script para la mesa {mesa}.')
        
        # Esperar un tiempo prudente y verificar si el proceso sigue activo
        time.sleep(5)  # Ajusta este tiempo según sea necesario
        if process.poll() is None:
            print(f'El proceso para la mesa {mesa} sigue activo. Se procederá a cerrarlo.')
            process.terminate()  # Termina el proceso si aún está activo
            
    except Exception as e:
        print(f'Error al ejecutar el script para la mesa {mesa}: {e}')
    
    end_time = time.time()
    if tiempo:
        print(f"ejecutar_script_cerrar_popup_simple: {end_time - start_time:.4f} segundos")

def ejecutar_script_captura_screenshot_mesa(x1, y1, x2, y2, ruta_base, mesa, quality=100, tiempo=False):
    start_time = time.time()
    
    # Captura de pantalla
    with mss.mss() as sct:
        monitor = {"top": y1, "left": x1, "width": x2-x1, "height": y2-y1}
        sct_img = sct.grab(monitor)
        imagen_np = np.array(sct_img)

    # Convertir la imagen de BGRA a BGR
    imagen_bgr = cv2.cvtColor(imagen_np, cv2.COLOR_BGRA2BGR)

    # Construir la ruta completa del archivo
    save_path = os.path.join(ruta_base, f"screenshot_mesa_{mesa}.png")

    # Guardar la imagen con la calidad especificada
    cv2.imwrite(save_path, imagen_bgr, [cv2.IMWRITE_JPEG_QUALITY, quality])

    end_time = time.time()
    if tiempo:
        print(f"ejecutar_script_captura_screenshot_mesa: {end_time - start_time:.4f} segundos")

def ejecutar_script_captura_screenshot(x1, y1, x2, y2, save_img_mesa, quality=100):

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

def buscar_imagen_en_area(imagen_a_buscar, imagen_fuente, umbral=0.8, tiempo2=False):
    res = None  # Inicializar res en None
    img_gray = None
    template = None
    loc = None

    try:
        start_time = time.time()

        # Convertir las imágenes a escala de grises
        img_gray = cv2.cvtColor(imagen_fuente, cv2.COLOR_BGR2GRAY)
        template = cv2.cvtColor(imagen_a_buscar, cv2.COLOR_BGR2GRAY)

        # Aplicar el método de coincidencia de plantillas
        res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)
        loc = np.where(res >= umbral)

        if len(loc[0]) > 0:
            # Coordenadas (x, y) de la primera coincidencia
            pt = list(zip(*loc[::-1]))[0]
            return True, pt
        else:
            return False, None

    except cv2.error as e:
        print(f"Error de OpenCV: {e}")
        return False, None

    except MemoryError as e:
        print(f"Error de memoria insuficiente: {e}")
        return False, None

    finally:
        # Limpiar las variables para liberar memoria si fueron asignadas
        if img_gray is not None:
            del img_gray
        if template is not None:
            del template
        if res is not None:
            del res
        if loc is not None:
            del loc

        end_time = time.time()
        if tiempo2:
            print(f"buscar_imagen_en_area: {end_time - start_time:.4f} segundos")

def buscar_imagen_en_area2(ruta_imagen_a_buscar, imagen_fuente, umbral=0.7, devolver_umbral=False):
    import time
    import cv2
    import numpy as np

    start_time = time.time()

    # Cargar la imagen a buscar desde la ruta especificada
    imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
    if imagen_a_buscar is None or imagen_a_buscar.size == 0:
        print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar} o está vacía.")
        return (False, None, 0) if devolver_umbral else (False, None)

    # Usar la técnica de coincidencia de plantillas con imágenes en color BGR
    res = cv2.matchTemplate(imagen_fuente, imagen_a_buscar, cv2.TM_CCOEFF_NORMED)

    # Encontrar las ubicaciones donde la coincidencia es mayor o igual al umbral
    loc = np.where(res >= umbral)

    if len(loc[0]) > 0:
        # Coordenadas (x, y) de la primera coincidencia
        pt = list(zip(*loc[::-1]))[0]
        
        if devolver_umbral:
            max_umbra = res[loc].max()
            return True, pt, max_umbra
        else:
            return True, pt
    else:
        return (False, None, 0) if devolver_umbral else (False, None)

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
    if "tantoporciento" in ruta_imagen_a_buscar:
        return True, None

        
    imagen_a_buscar = cv2.imread(ruta_imagen_a_buscar)
    if imagen_a_buscar is None:
        print(f"Error: No se pudo cargar la imagen {ruta_imagen_a_buscar}")
        return False, None

    encontrada, ubicacion_rel = buscar_imagen_en_area(imagen_a_buscar, imagen_bgr)
    if not encontrada:
        print(f"La imagen {ruta_imagen_a_buscar} no fue encontrada.")
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
        return False, None #antes .75

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
            #time.sleep(1000)

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

def categorizar_color(rgb_color):

    start_time = time.time()
    categorias_colores = {
        'rojo': ['red', 'darkred', 'firebrick', 'crimson', 'brown', 'maroon','saddlebrown', 'sienna', 'peru', 'chocolate', 'olive'],
        'verde': ['green', 'darkgreen', 'forestgreen', 'seagreen', 'limegreen', 'olive', 'darkolivegreen', 'olivedrab'],
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
    #time.sleep(1000)
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

    
    #CUANDO P1BET = 0
    script1_path = os.path.join(ruta_base, "includes", "BTN.ahk")
    script2_path = os.path.join(ruta_base, "includes", "SBvsBB_HU_2.ahk")


    #CUANDO P2BET = 0
    script8_path = os.path.join(ruta_base, "includes", "BBvsBTN_AI.ahk")
    script9_path = os.path.join(ruta_base, "includes", "BBvsBTN_LIMP.ahk")
    script10_path = os.path.join(ruta_base, "includes", "BBvsBTN_MINOR.ahk")
    script12_path = os.path.join(ruta_base, "includes", "BBvsSB_P3_MINOR.ahk")
    script14_path = os.path.join(ruta_base, "includes", "BBvsSB_LIMP_3H.ahk")
    script15_path = os.path.join(ruta_base, "includes", "BBvsSB_ORx3_3H.ahk")
    script16_path = os.path.join(ruta_base, "includes", "BBvsSB_ORx25_3H.ahk")
    script17_path = os.path.join(ruta_base, "includes", "BBvsSB_p3_AI_3H.ahk")
    script18_path = os.path.join(ruta_base, "includes", "BBvsSQZ.ahk")



    #CUANDO P3BET = 0
    script7_path = os.path.join(ruta_base, "includes", "SBvsBB_3H.ahk")
    script11_path = os.path.join(ruta_base, "includes", "SB_3HvsBTN_OS.ahk")
    script13_path = os.path.join(ruta_base, "includes", "SBvsBTN_MINOR.ahk")
    script19_path = os.path.join(ruta_base, "includes", "SBvsBTN_LIMP.ahk")



    


    
    
    



    
    script3_path = os.path.join(ruta_base, "includes", "BBvsSB_AI_HU.ahk")
    script4_path = os.path.join(ruta_base, "includes", "BBvsSB_LIMP_HU.ahk")
    script5_path = os.path.join(ruta_base, "includes", "BBvsSB_MINOR_HU.ahk")
    
    #script6_path = os.path.join(ruta_base, "includes", "SBvsBB_HUvsROL_AI.ahk")
    

    
    
    
    


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
    #CUANDO P1BET = 0
    thread_btn = threading.Thread(target=ejecutar_script, args=(script1_path, variables_script, result_queue1))
    thread_sb_hu = threading.Thread(target=ejecutar_script, args=(script2_path, variables_script, result_queue2))

    

    #CUANDO P2BET = 0
    thread_BBvsBTN_AI = threading.Thread(target=ejecutar_script, args=(script8_path, variables_script, result_queue8))
    thread_BBvsBTN_LIMP = threading.Thread(target=ejecutar_script, args=(script9_path, variables_script, result_queue9))
    thread_BBvsBTN_MINOR = threading.Thread(target=ejecutar_script, args=(script10_path, variables_script, result_queue10))
    thread_BBvsSB_P3_MINOR = threading.Thread(target=ejecutar_script, args=(script12_path, variables_script, result_queue12))
    thread_BBvsSB_LIMP_3H = threading.Thread(target=ejecutar_script, args=(script14_path, variables_script, result_queue14))
    thread_BBvsSB_ORx3_3H = threading.Thread(target=ejecutar_script, args=(script15_path, variables_script, result_queue15))
    thread_BBvsSB_ORx25_3H = threading.Thread(target=ejecutar_script, args=(script16_path, variables_script, result_queue16))
    thread_BBvsSB_p3_AI_3H = threading.Thread(target=ejecutar_script, args=(script17_path, variables_script, result_queue17))
    thread_BBvsSQZ = threading.Thread(target=ejecutar_script, args=(script18_path, variables_script, result_queue18))


    #CUANDO P3BET = 0
    thread_SBvsBB_3H = threading.Thread(target=ejecutar_script, args=(script7_path, variables_script, result_queue7))
    thread_SB_3HvsBTN_OS = threading.Thread(target=ejecutar_script, args=(script11_path, variables_script, result_queue11))
    thread_SBvsBTN_MINOR = threading.Thread(target=ejecutar_script, args=(script13_path, variables_script, result_queue13))
    thread_SBvsBTN_LIMP = threading.Thread(target=ejecutar_script, args=(script19_path, variables_script, result_queue19))



    thread_BBvsSB_AI_HU = threading.Thread(target=ejecutar_script, args=(script3_path, variables_script, result_queue3))
    thread_BBvsSB_LIMP_HU = threading.Thread(target=ejecutar_script, args=(script4_path, variables_script, result_queue4))
    thread_BBvsSB_MINOR_HU = threading.Thread(target=ejecutar_script, args=(script5_path, variables_script, result_queue5))

    #thread6 = threading.Thread(target=ejecutar_script, args=(script6_path, variables_script, result_queue6))
 
    
    
    #logica para que no se abran todos los ahk

    p1btn = variables_script[23]
    p2btn = variables_script[16]
    p3btn = variables_script[20]


    # Iniciar los threads
    if p1btn == "0":
        thread_btn.start()
        thread_sb_hu.start()
    elif p2btn == "0":
        thread_BBvsBTN_AI.start()
        thread_BBvsBTN_LIMP.start()
        thread_BBvsBTN_MINOR.start()
        thread_BBvsSB_P3_MINOR.start()
        thread_BBvsSB_LIMP_3H.start() 
        thread_BBvsSB_ORx3_3H.start() 
        thread_BBvsSB_ORx25_3H.start()
        thread_BBvsSB_p3_AI_3H.start()
        thread_BBvsSQZ.start()

    elif p3btn == "0":
        thread_SBvsBB_3H.start()
        thread_SB_3HvsBTN_OS.start()
        thread_SBvsBTN_MINOR.start()
        thread_SBvsBTN_LIMP.start()

        

     

    #time.sleep(1000)
    
    
    
    thread_BBvsSB_MINOR_HU.start()
    #thread6.start()
    thread_BBvsSB_AI_HU.start()
    thread_BBvsSB_LIMP_HU.start()
    

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

def condiciones_salida_preflop(ubicacion_tercera, posx, posy, p1bet_base):
    start_time = time.time()

    executor = ThreadPoolExecutor(max_workers=4)
    result_queue = Queue()
    coordenadas_tercera_iniciales = ubicacion_tercera

    try:
        while True:
            condicion_salida = None

            # Verificar la primera imagen
            try:
                imagen_primera = capturar_imagen(region_primera_imagen)
                encontrada_primera, ubicacion_primera_actual = encontrar_imagen(ruta_img_time, imagen_primera, region_primera_imagen)
            except Exception as e:
                print(f"Error al verificar la primera imagen: {e}")
                encontrada_primera = False

            # Verificar la segunda imagen
            try:
                imagen_segunda = executor.submit(capture_and_process, region_carta1_flop, 200, '', '', 'carta1_flop', result_queue, save_path)
            except Exception as e:
                print(f"Error al verificar la segunda imagen: {e}")

            # Verificar la tercera imagen
            try:
                imagen_tercera = capturar_imagen(region_tercera_imagen)
                encontrada_tercera, ubicacion_tercera_actual = encontrar_imagen(ruta_img_dealer, imagen_tercera, region_tercera_imagen)
            except Exception as e:
                print(f"Error al verificar la tercera imagen: {e}")
                encontrada_tercera = False

            # Realizar OCR en la región p1bet
            try:
                region_p1bet = (x1 + 388, y1 + 378, 50, 20)

                capture_and_process(region_p1bet, 200, '', '--psm 6 -c tessedit_char_whitelist=0123456789dhsc', 'p1bet', result_queue, save_path)
            except Exception as e:
                print(f"Error al realizar OCR en la región p1bet: {e}")

            # Recoger el resultado de p1bet del queue
            p1bet_nuevo = ""
            try:
                while not result_queue.empty():
                    result = result_queue.get()
                    if 'p1bet' in result:
                        p1bet_nuevo = result['p1bet']
            except Exception as e:
                print(f"Error al recoger el resultado de p1bet del queue: {e}")

            # Comprobar todas las condiciones antes de proceder
            if not encontrada_primera:
                condicion_salida = "NO TIME"
            elif carta1_flop != "negro":
                condicion_salida = "NO NO BOARD"
            elif ubicacion_tercera_actual != coordenadas_tercera_iniciales:
                condicion_salida = "DEALER OTRA POSICION"
            elif p1bet_nuevo != p1bet_base:
                condicion_salida = "P1BET OTRO VALOR"

            if condicion_salida is not None:
                print(f"{condicion_salida}. SALIENDO DEL PREFLOP")
                break

            if debug:
                time.sleep(2)

            print("BUSCANDO CONDICION DE SALIDA")

    except Exception as e:
        print(f"Error en condiciones_salida_preflop: {e}")

    finally:
        executor.shutdown(wait=True)  # Asegurarse de cerrar correctamente el executor

    end_time = time.time()
    if tiempo:
        print(f"condiciones_salida_preflop: {end_time - start_time:.4f} segundos")

def verificar_stack(stack):
    if stack is None:
        return None
    if isinstance(stack, (int, float)):
        return float(stack)
    # If not a string, convert safely
    if not isinstance(stack, str):
        try:
            stack = str(stack)
        except Exception:
            return None
    # Now safe to use string methods
    if stack == ".":
        stack = "0"
    stack = stack.replace(".0", "0")
    if stack.startswith('.'):
        stack = stack[1:]
    return stack

def verificar_stackefectivo(stackefect):
    if stackefect is None:
        return None
    if isinstance(stackefect, (int, float)):
        return float(stackefect)
    # If not a string, convert safely
    if not isinstance(stackefect, str):
        try:
            stackefect = str(stackefect)
        except Exception:
            return None
    # Now safe to use string methods
    s = stackefect.replace(",", ".")
    if s.endswith('.'):
        s = s[:-1]
    s = s.replace("i", "1")
    s = s.replace(" —", "")
    s_limpio = re.sub(r'[^0-9.]', '', s)
    try:
        val = float(s_limpio)
        print("El valor de stackefect como float es:", val)
        return val
    except ValueError:
        print("Error: No se pudo convertir stackefect a float. Verifica el formato del número.")
        return s_limpio if s_limpio else s

def verificar_bet(bet):
    if bet == "05":
        bet = 0.5

    if bet == "1s01s":
        bet = ""

    if bet == "1501":
        bet = ""
    
    return bet

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

def buscar_img_carta1(ruta_base, palo1):
    if palo1 is None or palo1 == "unknown":
        return None
    save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartas')
    if palo1 == "negro":
        time.sleep(0.2)
    elif palo1 == "azul":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasd')
    elif palo1 == "gris":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartass')
    elif palo1 == "verde":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasc')
    elif palo1 == "rojo":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartash')
    if not os.path.isdir(save_img_mesa):
        return None
    image_files = [f for f in os.listdir(save_img_mesa) if f.endswith(('png', 'jpg', 'jpeg'))]
    region_carta1 = (x1 + 338, y1 + 408, 50, 35)
    imagen_bgr = capturar_imagen(region_carta1)
    mejor_umbra = 0
    mejor_imagen = None
    for image_file in image_files:
        image_path = os.path.join(save_img_mesa, image_file)
        encontrada, ubicacion_abs, umbral_actual = buscar_imagen_en_area2(image_path, imagen_bgr, devolver_umbral=True)
        if encontrada and umbral_actual > mejor_umbra:
            mejor_umbra = umbral_actual
            mejor_imagen = image_file
    return mejor_imagen

def buscar_img_carta2(ruta_base,palo2):
    if palo2 is None or palo2 == "unknown":
        return None
    save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartas')
    if palo2 == "negro":
        time.sleep(0.2)
    elif palo2 == "azul":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasd')
    elif palo2 == "gris":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartass')
    elif palo2 == "verde":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartasc')
    elif palo2 == "rojo":
        save_img_mesa = os.path.join(ruta_base, 'img', 'img_referencia', 'baraja', 'cartash')
    if not os.path.isdir(save_img_mesa):
        return None
    image_files = [f for f in os.listdir(save_img_mesa) if f.endswith(('png', 'jpg', 'jpeg'))]
    region_carta2 = (x1 +389, y1 +408, 50, 35)
    imagen_bgr = capturar_imagen(region_carta2)
    mejor_umbra = 0
    mejor_imagen = None
    for image_file in image_files:
        image_path = os.path.join(save_img_mesa, image_file)
        encontrada, ubicacion_abs, umbral_actual = buscar_imagen_en_area2(image_path, imagen_bgr, devolver_umbral=True)
        if encontrada and umbral_actual > mejor_umbra:
            mejor_umbra = umbral_actual
            mejor_imagen = image_file
    return mejor_imagen

ventanas = []


# Función para crear y mostrar la ventana
def crear_ventana(contenido_variable, ancho, alto, x, y, mesa):
    def mostrar_ventana():
        root = tk.Tk()
        titulo = f'hands_3h: {mesa}'
        root.title(titulo)
        root.geometry(f'{ancho}x{alto}+{x}+{y}')
        root.overrideredirect(True)
        root.attributes("-topmost", True)

        label = tk.Label(root, text=contenido_variable, font=('Arial', 10))
        label.pack(expand=True)

        ventanas.append(root)

        def cerrar_ventana():
            if root in ventanas:
                ventanas.remove(root)
            root.destroy()

        # Programar el cierre de la ventana después de 15 segundos
        root.after(15000, cerrar_ventana)

        # Asociar el evento de clic para cerrar la ventana
        root.bind('<Button-1>', lambda event: cerrar_ventana())

        # Configurar la acción para el botón de cerrar de la ventana
        root.protocol("WM_DELETE_WINDOW", cerrar_ventana)

        root.mainloop()

    hilo_ventana = threading.Thread(target=mostrar_ventana)
    hilo_ventana.start()

# Función para cerrar ventanas con un título específico
def cerrar_ventanas_por_mesa(mesa):
    titulo = f'hands_3h: {mesa}'
    cerrar_queue.put(titulo)

def assign_values_to_variables_3h(player_id):
    values = db_sqlite.get_all_values_by_player_id_as_dict_3h(player_id)

    if values is not None:
        player_id = values.get('PLAYER_ID')
        vip = values.get('VIP')
        pfr = values.get('PFR')
        bet_3 = values.get('BET_3')
        fold_to_4bet = values.get('FOLD_TO_4BET')
        fold_to_3bet = values.get('FOLD_TO_3BET')
        wwsf = values.get('WWSF')
        w_at_sd = values.get('W_AT_SD')
        overbet_freq = values.get('OVERBET_FREQ')
        overbet_turn = values.get('OVERBET_TURN')
        overbet_river = values.get('OVERBET_RIVER')

        # Devolver los valores
        return {
            'PLAYER_ID': player_id,
            'VIP': vip,
            'PFR': pfr,
            'BET_3': bet_3,
            'FOLD_TO_4BET': fold_to_4bet,
            'FOLD_TO_3BET': fold_to_3bet,
            'WWSF': wwsf,
            'W_AT_SD': w_at_sd,
            'OVERBET_FREQ': overbet_freq,
            'OVERBET_TURN': overbet_turn,
            'OVERBET_RIVER': overbet_river
        }
    else:
        print(f'No se encontraron valores para el jugador con ID {player_id}.')
        return None

def assign_values_to_variables_hu(player_id):
    values = db_sqlite.get_all_values_by_player_id_as_dict_hu(player_id)

    if values is not None:
        player_id = values.get('PLAYER_ID')
        vip = values.get('VIP')
        pfr = values.get('PFR')
        bet_3 = values.get('BET_3')
        fold_to_4bet = values.get('FOLD_TO_4BET')
        fold_to_3bet = values.get('FOLD_TO_3BET')
        wwsf = values.get('WWSF')
        w_at_sd = values.get('W_AT_SD')
        overbet_freq = values.get('OVERBET_FREQ')
        overbet_turn = values.get('OVERBET_TURN')
        overbet_river = values.get('OVERBET_RIVER')

        # Devolver los valores
        return {
            'PLAYER_ID': player_id,
            'VIP': vip,
            'PFR': pfr,
            'BET_3': bet_3,
            'FOLD_TO_4BET': fold_to_4bet,
            'FOLD_TO_3BET': fold_to_3bet,
            'WWSF': wwsf,
            'W_AT_SD': w_at_sd,
            'OVERBET_FREQ': overbet_freq,
            'OVERBET_TURN': overbet_turn,
            'OVERBET_RIVER': overbet_river
        }
    else:
        print(f'No se encontraron valores HU para el jugador con ID {player_id}.')
        return None
# Parámetros de tamaño y posición de la ventana

def on_button_click(event):
    print("Clic en la ventana, insertando mano marcada...")
    
    try:
        # Acceder a las variables globales dentro de la función
        db_sqlite.insert_mano_marcada(
            numero_torneo=mano,
            numero_mano=mano,
            mano_p1=mano,
            stack_p1=mano,
            situacion=mano,
            mano_xml=mano,
            duda_mano=mano,
            fecha=mano
        )
        print("Inserción exitosa.")
    except Exception as e:
        print(f"Error al insertar mano marcada: {e}")

def create_main_window(x1, y1):
    # Crear la ventana principal
    root = tk.Tk()

    # Configurar la ventana sin barra de título y siempre visible
    root.overrideredirect(True)
    root.attributes('-topmost', True)

    # Definir las coordenadas donde se mostrará la ventana
    x_coord = x1
    y_coord = y1
    root.geometry(f"20x20+{x_coord}+{y_coord}")

    # Vincular clic en la ventana a la función on_button_click
    root.bind('<Button-1>', on_button_click)

    # Etiqueta con la letra "M" (opcional, puedes quitarla si no la necesitas)
    label = tk.Label(root, text="M", font=("Helvetica", 10))
    label.pack(expand=True)

    # Asegurarse de que la ventana esté en la parte superior
    root.lift()

    # Iniciar el bucle principal de la ventana
    root.mainloop()

db_sqlite.create_table()

ancho = 400
alto = 200
x = 100
y = 100




'''
tiempo = 0
tiempo2 = 0
foto = 1
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
foto = 1
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

# Coordenadas específicas
x, y = (x1+20), (y1+20)  # Cambia esto a las coordenadas que necesites

# Obtener la lista de todas las ventanas
windows = gw.getAllWindows()

# Buscar la ventana en las coordenadas específicas
target_window = None
for window in windows:
    if window.left <= x <= window.right and window.top <= y <= window.bottom:
        target_window = window
        break

# Obtener el título de la ventana si se encontró
if target_window:
    #print(f"'{target_window.title}'")
    pass
else:
    print(f"No se encontró ninguna ventana en las coordenadas ({x}, {y})")

#time.sleep(1000)
# Definición de variables

x1p = x1 + 350
y1p = y1 + 455
x2p = x2 - 360
y2p = y2 - 100

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


region_primera_imagen = (x1p, y1p, x2p - x1p, y2p - y1p)
region_segunda_imagen = (x1b, y1b, x2b - x1b, y2b - y1b)
region_tercera_imagen = (x1+120, y1+200, ancho-230, alto-355)
region_palo1 = (x1+350, y1+400, 40, 70)
region_palo2 = (x1+410, y1+405, 30, 60)
region_carta1 = (x1 +389, y1 +408, 50, 35)
region_carta2 = (x1 +389, y1 +408, 50, 35)
region_carta1_flop = (x1 + 265, y1 + 225, 20, 10)
region_tanto_porciento = (x1 +265, y1 + 472, 62, 150)

def ejecutar_busqueda_concurrente():
    global carta1_flop
    global palo1, palo2
    global mano

    carta1_flop = "desconocido"
    palo1 = None
    palo2 = None

    start_time = time.time()

    p1name = None
    p2name = None
    p3name = None

    result_queue = Queue()
    threads = []

    num_threads = 8
    with ThreadPoolExecutor(max_workers=num_threads) as executor:
        # Capturar imágenes de las regiones especificadas
        future_primera_imagen = executor.submit(capturar_imagen, region_primera_imagen)
        future_segunda_imagen = executor.submit(capture_and_process, region_carta1_flop, 200, '', '', 'carta1_flop', result_queue, save_path)
        future_tercera_imagen = executor.submit(capturar_imagen, region_tercera_imagen)
        future_cuarta_imagen = executor.submit(capturar_imagen, region_tanto_porciento)

        imagen_primera = future_primera_imagen.result()
        imagen_segunda = future_segunda_imagen.result()
        imagen_tercera = future_tercera_imagen.result()
        imagen_tanto_porciento = future_cuarta_imagen.result()

        # Buscar imágenes dentro de las capturas
        future_primera = executor.submit(encontrar_imagen, ruta_img_time, imagen_primera, region_primera_imagen)
        future_tercera = executor.submit(encontrar_imagen, ruta_img_dealer, imagen_tercera, region_tercera_imagen)
        future_cuarta_imagen = executor.submit(encontrar_imagen, ruta_img_tanto_porciento, imagen_tanto_porciento, region_tanto_porciento)

        ubicacion_primera = future_primera.result()

        if ubicacion_primera[0]:
            print(f"TIME ECONTRADO:")
            posx, posy = ubicacion_primera[1]

            if carta1_flop == "negro":
                print(f"NO BOARD ENCONTRADO: ")

                resultado_tercera = future_tercera.result()
                if resultado_tercera[0]:
                    ubicacion_tercera = resultado_tercera[1]
                    print(f"DEALER ENCONTRADO")

                    ubicacion_tanto = future_cuarta_imagen.result()
                    if ubicacion_tanto[0]:
                        print(f"STACKEFECT ENCONTRADO")
                        # FIN CAPTURA Y RECONOCIMIENTO DE IMAGENES

                        capture_time = time.time() - start_time  # ______________________________________________________________________________________________________

                        start_save_screen = time.time()
                        timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]
                        save_img_mesa = os.path.join(ruta_base, 'img', 'errores', 'screenshot_{}.bmp'.format(timestamp))
                        save_txt_mesa = os.path.join(ruta_base, 'img', 'errores', 'screenshot_{}.txt'.format(timestamp))
                        if foto:
                            future_screenshot = executor.submit(ejecutar_script_captura_screenshot, x1, y1, x2, y2, save_img_mesa)

                        save_screen_time = time.time() - start_save_screen  # ______________________________________________________________________________________________________

                        # Medir tiempo de ejecución de OCR
                        start_ocr_time = time.time()  # ______________________________________________________________________________________________________________
                        regions = [
                            ((x1 + 50, y1 + 178, 103, 18), 220, '', '', 'p2name'),
                            ((x1 + 70, y1 + 198, 60, 18), 230, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p2stack'),
                            ((x1 + 160, y1 + 220, 55, 20), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p2bet'),
                            ((x1 + 625, y1 + 178, 103, 18), 220, '', '--psm 7', 'p3name'),
                            ((x1 + 645, y1 + 198, 60, 18), 250, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p3stack'),
                            ((x1 + 565, y1 + 220, 50, 20), 200, '0123456789.', '--psm 7 -c tessedit_char_whitelist=0123456789.', 'p3bet'),
                            ((x1 + 388, y1 + 378, 50, 20), 200, '', '--psm 6 -c tessedit_char_whitelist=0123456789dhsc', 'p1bet'),
                            ((x1 + 338, y1 + 408, 50, 35), 230, '', '--psm 6 --oem 3', 'carta1'),
                            ((x1 + 389, y1 + 408, 50, 35), 230, '', '--psm 6 --oem 3', 'carta2'),
                            ((x1 + 265, y1 + 225, 20, 10), 200, '', '--psm 6', 'carta1_flop'),
                            ((x1 + 265, y1 + 472, 72, 42), 100, '', '--psm 7', 'stackefect'),
                        ]

                        max_threads = 16
                        num_threads = min(max_threads, len(regions))

                        for i in range(num_threads):
                            region, scale_percent, whitelist, config, result_key = regions[i]
                            thread = threading.Thread(
                                target=capture_and_process,
                                args=(region, scale_percent, whitelist, config, result_key, result_queue, save_path)
                            )
                            threads.append(thread)
                            thread.start()

                        for thread in threads:
                            thread.join()

                        # Recopilar resultados de OCR
                        results = {}
                        while not result_queue.empty():
                            results.update(result_queue.get())

                        print("Resultados OCR:")
                        ocr_time = time.time() - start_ocr_time  # ______________________________________________________________________________________________________

                        start_resto = time.time()  # ________________________________________________________________________________________________________________
                        x_dealer, ydealer = ubicacion_tercera
                        print(posx, x_dealer)

                        if 100 < (posx - x_dealer) < 240:
                            p1btn = 1
                            p2btn = 0
                            p3btn = 1
                        elif 0 < (posx - x_dealer) < 100:
                            p1btn = 0
                            p2btn = 1
                            p3btn = 1
                        elif (posx - x_dealer) < 0:
                            p1btn = 1
                            p2btn = 1
                            p3btn = 0

                        variables_a_extraer = ["p2name", "p2stack", "p2bet", "p3name", "p3stack", "p3bet",
                                               "stackefect", "bote_grande", "bote", "p1bet",
                                               "carta1", "carta2", "carta1_flop"]

                        valores_extraidos = {}
                        for variable in variables_a_extraer:
                            if variable in results:
                                valores_extraidos[variable] = results[variable]
                            else:
                                valores_extraidos[variable] = None

                        print("Valores extraídos:")
                        for variable, valor in valores_extraidos.items():
                            print(f"{variable} = {valor}")

                        # =====================================================================
                        # FIX CRÍTICO: asignar variables desde OCR (valores_extraidos) ANTES de validar/pasar a AHK
                        # =====================================================================
                        def _s(v):
                            if v is None:
                                return None
                            return str(v).strip()

                        p2name = _s(valores_extraidos.get("p2name"))
                        p3name = _s(valores_extraidos.get("p3name"))
                        p2stack = _s(valores_extraidos.get("p2stack"))
                        p3stack = _s(valores_extraidos.get("p3stack"))
                        p2bet = _s(valores_extraidos.get("p2bet"))
                        p3bet = _s(valores_extraidos.get("p3bet"))
                        stackefect = _s(valores_extraidos.get("stackefect"))
                        p1bet = _s(valores_extraidos.get("p1bet")) or ""
                        bote = _s(valores_extraidos.get("bote"))
                        bote_grande = _s(valores_extraidos.get("bote_grande"))
                        carta1 = _s(valores_extraidos.get("carta1")) or ""
                        carta2 = _s(valores_extraidos.get("carta2")) or ""
                        # carta1_flop ya es global por tu pipeline; pero dejamos la extracción también
                        carta1_flop_local = _s(valores_extraidos.get("carta1_flop"))

                        # Si por lo que sea OCR de carta1_flop llega aquí, no rompemos nada:
                        if carta1_flop_local:
                            carta1_flop = carta1_flop_local
                        # =====================================================================

                        # CONSULTAR SI EL JUGADOR ESTA EN NUESTRA DB
                        p2name = verificar_name(p2name)
                        print("P2 NAME", p2name)
                        p2_id = db_sqlite.get_player_id(p2name)
                        print(p2_id)

                        if p2_id != None:
                            p2_manos_3h_db = db_sqlite.get_manos_3h(p2name)
                            p2_manos_hu_db = db_sqlite.get_manos_hu(p2name)
                            print("Manos HU", p2_manos_hu_db)

                            if p2_manos_3h_db != None:
                                result = assign_values_to_variables_3h(p2_id)
                                if result:
                                    p2_player_id = result['PLAYER_ID']
                                    p2_vip_3h = result['VIP']
                                    p2_pfr_3h = result['PFR']
                                    p2_bet_3_3h = result['BET_3']
                                    p2_fold_to_4bet_3h = result['FOLD_TO_4BET']
                                    p2_fold_to_3bet_3h = result['FOLD_TO_3BET']
                                    p2_wwsf_3h = result['WWSF']
                                    p2_w_at_sd_3h = result['W_AT_SD']
                                    p2_overbet_freq_3h = result['OVERBET_FREQ']
                                    p2_overbet_turn_3h = result['OVERBET_TURN']
                                    p2_overbet_river_3h = result['OVERBET_RIVER']
                                else:
                                    p2_player_id = None
                                    p2_vip_3h = None
                                    p2_pfr_3h = None
                                    p2_bet_3_3h = None
                                    p2_fold_to_4bet_3h = None
                                    p2_fold_to_3bet_3h = None
                                    p2_wwsf_3h = None
                                    p2_w_at_sd_3h = None
                                    p2_overbet_freq_3h = None
                                    p2_overbet_turn_3h = None
                                    p2_overbet_river_3h = None
                            else:
                                p2_player_id = None
                                p2_vip_3h = None
                                p2_pfr_3h = None
                                p2_bet_3_3h = None
                                p2_fold_to_4bet_3h = None
                                p2_fold_to_3bet_3h = None
                                p2_wwsf_3h = None
                                p2_w_at_sd_3h = None
                                p2_overbet_freq_3h = None
                                p2_overbet_turn_3h = None
                                p2_overbet_river_3h = None

                            if p2_manos_hu_db != None:
                                result = assign_values_to_variables_hu(p2_id)
                                if result:
                                    p2_player_id = result['PLAYER_ID']
                                    p2_vip_hu = result['VIP']
                                    p2_pfr_hu = result['PFR']
                                    p2_bet_3_hu = result['BET_3']
                                    p2_fold_to_4bet_hu = result['FOLD_TO_4BET']
                                    p2_fold_to_3bet_hu = result['FOLD_TO_3BET']
                                    p2_wwsf_hu = result['WWSF']
                                    p2_w_at_sd_hu = result['W_AT_SD']
                                    p2_overbet_freq_hu = result['OVERBET_FREQ']
                                    p2_overbet_turn_hu = result['OVERBET_TURN']
                                    p2_overbet_river_hu = result['OVERBET_RIVER']
                                else:
                                    p2_vip_hu = None
                                    p2_pfr_hu = None
                                    p2_bet_3_hu = None
                                    p2_fold_to_4bet_hu = None
                                    p2_fold_to_3bet_hu = None
                                    p2_wwsf_hu = None
                                    p2_w_at_sd_hu = None
                                    p2_overbet_freq_hu = None
                                    p2_overbet_turn_hu = None
                                    p2_overbet_river_hu = None
                            else:
                                p2_vip_hu = None
                                p2_pfr_hu = None
                                p2_bet_3_hu = None
                                p2_fold_to_4bet_hu = None
                                p2_fold_to_3bet_hu = None
                                p2_wwsf_hu = None
                                p2_w_at_sd_hu = None
                                p2_overbet_freq_hu = None
                                p2_overbet_turn_hu = None
                                p2_overbet_river_hu = None
                        else:
                            p2_manos_3h_db = None
                            p2_manos_hu_db = None
                            p2_vip_3h = None
                            p2_pfr_3h = None
                            p2_bet_3_3h = None
                            p2_fold_to_4bet_3h = None
                            p2_fold_to_3bet_3h = None
                            p2_wwsf_3h = None
                            p2_w_at_sd_3h = None
                            p2_overbet_freq_3h = None
                            p2_overbet_turn_3h = None
                            p2_overbet_river_3h = None
                            p2_vip_hu = None
                            p2_pfr_hu = None
                            p2_bet_3_hu = None
                            p2_fold_to_4bet_hu = None
                            p2_fold_to_3bet_hu = None
                            p2_wwsf_hu = None
                            p2_w_at_sd_hu = None
                            p2_overbet_freq_hu = None
                            p2_overbet_turn_hu = None
                            p2_overbet_river_hu = None

                        p3name = verificar_name(p3name)
                        print("P3 NAME", p3name)
                        p3_id = db_sqlite.get_player_id(p3name)
                        print("P3 ID", p3_id)
                        if p3_id != None:
                            p3_manos_3h_db = db_sqlite.get_manos_3h(p3name)
                            p3_manos_hu_db = db_sqlite.get_manos_hu(p3name)
                            print("P3 Manos 3H", p3_manos_3h_db)
                            print("P3 Manos HU", p3_manos_hu_db)

                            if p3_manos_3h_db != None:
                                result = assign_values_to_variables_3h(p3_id)
                                if result:
                                    p3_player_id = result['PLAYER_ID']
                                    p3_vip_3h = result['VIP']
                                    p3_pfr_3h = result['PFR']
                                    p3_bet_3_3h = result['BET_3']
                                    p3_fold_to_4bet_3h = result['FOLD_TO_4BET']
                                    p3_fold_to_3bet_3h = result['FOLD_TO_3BET']
                                    p3_wwsf_3h = result['WWSF']
                                    p3_w_at_sd_3h = result['W_AT_SD']
                                    p3_overbet_freq_3h = result['OVERBET_FREQ']
                                    p3_overbet_turn_3h = result['OVERBET_TURN']
                                    p3_overbet_river_3h = result['OVERBET_RIVER']
                                else:
                                    p3_player_id = None
                                    p3_vip_3h = None
                                    p3_pfr_3h = None
                                    p3_bet_3_3h = None
                                    p3_fold_to_4bet_3h = None
                                    p3_fold_to_3bet_3h = None
                                    p3_wwsf_3h = None
                                    p3_w_at_sd_3h = None
                                    p3_overbet_freq_3h = None
                                    p3_overbet_turn_3h = None
                                    p3_overbet_river_3h = None
                            else:
                                p3_player_id = None
                                p3_vip_3h = None
                                p3_pfr_3h = None
                                p3_bet_3_3h = None
                                p3_fold_to_4bet_3h = None
                                p3_fold_to_3bet_3h = None
                                p3_wwsf_3h = None
                                p3_w_at_sd_3h = None
                                p3_overbet_freq_3h = None
                                p3_overbet_turn_3h = None
                                p3_overbet_river_3h = None

                            if p3_manos_hu_db != None:
                                result = assign_values_to_variables_hu(p3_id)
                                if result:
                                    p3_player_id = result['PLAYER_ID']
                                    p3_vip_hu = result['VIP']
                                    p3_pfr_hu = result['PFR']
                                    p3_bet_3_hu = result['BET_3']
                                    p3_fold_to_4bet_hu = result['FOLD_TO_4BET']
                                    p3_fold_to_3bet_hu = result['FOLD_TO_3BET']
                                    p3_wwsf_hu = result['WWSF']
                                    p3_w_at_sd_hu = result['W_AT_SD']
                                    p3_overbet_freq_hu = result['OVERBET_FREQ']
                                    p3_overbet_turn_hu = result['OVERBET_TURN']
                                    p3_overbet_river_hu = result['OVERBET_RIVER']
                                else:
                                    p3_vip_hu = None
                                    p3_pfr_hu = None
                                    p3_bet_3_hu = None
                                    p3_fold_to_4bet_hu = None
                                    p3_fold_to_3bet_hu = None
                                    p3_wwsf_hu = None
                                    p3_w_at_sd_hu = None
                                    p3_overbet_freq_hu = None
                                    p3_overbet_turn_hu = None
                                    p3_overbet_river_hu = None
                            else:
                                p3_vip_hu = None
                                p3_pfr_hu = None
                                p3_bet_3_hu = None
                                p3_fold_to_4bet_hu = None
                                p3_fold_to_3bet_hu = None
                                p3_wwsf_hu = None
                                p3_w_at_sd_hu = None
                                p3_overbet_freq_hu = None
                                p3_overbet_turn_hu = None
                                p3_overbet_river_hu = None
                        else:
                            p3_manos_3h_db = None
                            p3_manos_hu_db = None
                            p3_vip_3h = None
                            p3_pfr_3h = None
                            p3_bet_3_3h = None
                            p3_fold_to_4bet_3h = None
                            p3_fold_to_3bet_3h = None
                            p3_wwsf_3h = None
                            p3_w_at_sd_3h = None
                            p3_overbet_freq_3h = None
                            p3_overbet_turn_3h = None
                            p3_overbet_river_3h = None
                            p3_vip_hu = None
                            p3_pfr_hu = None
                            p3_bet_3_hu = None
                            p3_fold_to_4bet_hu = None
                            p3_fold_to_3bet_hu = None
                            p3_wwsf_hu = None
                            p3_w_at_sd_hu = None
                            p3_overbet_freq_hu = None
                            p3_overbet_turn_hu = None
                            p3_overbet_river_hu = None

                        print(p1btn, p2btn, p3btn)

                        palo1 = locals().get("palo1") if "palo1" in locals() else globals().get("palo1")
                        palo2 = locals().get("palo2") if "palo2" in locals() else globals().get("palo2")
                        if not palo1:
                            palo1 = None
                        if not palo2:
                            palo2 = None

                        result_carta1 = buscar_img_carta1(ruta_base, palo1)
                        result_carta2 = buscar_img_carta2(ruta_base, palo2)

                        valid_chars = set("23456789TJQKA")
                        if carta1 and set(carta1).issubset(valid_chars):
                            result_carta1 = carta1
                        if carta2 and set(carta2).issubset(valid_chars):
                            result_carta2 = carta2

                        global mano
                        mano = str(result_carta1) + str(palo1) + str(result_carta2) + str(palo2)
                        mano = verificar_mano(mano, x1, y1, x2, y2, save_img_mesa)

                        print("Mano: ", mano)
                        print("P2: ", p2)
                        print("P3: ", p3)

                        # VALIDACIONES NUMÉRICAS (estas son las que estabas pasando a AHK)
                        result_stackefect = verificar_stackefectivo(stackefect)
                        print("Stackefect:", result_stackefect)

                        result_p2stack = verificar_stack(p2stack)
                        print("P2stack:", result_p2stack)

                        result_p3stack = verificar_stack(p3stack)
                        print("P3stack:", result_p3stack)

                        result_p1bet = verificar_bet(p1bet)
                        print("P1bet:", result_p1bet)

                        result_p2bet = verificar_bet(p2bet)
                        print("P2bet:", result_p2bet)

                        result_p3bet = verificar_bet(p3bet)
                        print("P3bet:", result_p3bet)

                        if result_p3stack is None:
                            print("NO ESTA P3")

                        variables_script = [
                            str(x1), str(y1), str(mesa), str(x1), str(y1), str(x2), str(y2), str(alto), str(ancho), str(x1t), str(y1t), str(anchot), str(altot),  # 13 vars
                            str(p2name), str(result_p2stack), str(result_p2bet), str(p2btn), str(p3name), str(result_p3stack), str(result_p3bet), str(p3btn), str(result_stackefect),  # 9 vars
                            str(result_p1bet), str(p1btn), str(mano), str(p2), str(p3), str(save_img_mesa), str(p2_manos_3h_db), str(p3_manos_3h_db),
                            str(p2_vip_3h), str(p2_pfr_3h), str(p2_bet_3_3h), str(p3_vip_3h), str(p3_pfr_3h), str(p3_bet_3_3h),
                            str(p2_manos_hu_db), str(p2_vip_hu), str(p2_pfr_hu), str(p2_bet_3_hu),
                            str(p3_manos_hu_db), str(p3_vip_hu), str(p3_pfr_hu), str(p3_bet_3_hu),
                        ]

                        scripts_autohotkey(variables_script)
                        resto_time = time.time() - start_resto  # ______________________________________________________________________________________________________

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

                        with open(save_txt_mesa, "w") as archivo:
                            archivo.write(f"p2color: {p2}\n")
                            archivo.write(f"p2btn: {p2btn}\n")
                            archivo.write(f"p2name: {p2name}\n")
                            archivo.write(f"p2stack: {p2stack}\n")
                            archivo.write(f"p2bet: {p2bet}\n")
                            archivo.write(f"p3color: {p3}\n")
                            archivo.write(f"p3btn: {p3btn}\n")
                            archivo.write(f"p3name: {p3name}\n")
                            archivo.write(f"p3stack: {p3stack}\n")
                            archivo.write(f"p3bet: {p3bet}\n")
                            archivo.write(f"stackefect: {stackefect}\n")
                            archivo.write(f"p1btn: {p1btn}\n")
                            archivo.write(f"p1bet: {p1bet}\n")
                            archivo.write(f"Mano: {mano}\n")

                        p1bet_base = p1bet if p1bet is not None else ""
                        condiciones_salida_preflop(ubicacion_tercera, posx, posy, p1bet_base)

                        ejecutar_script_cerrar_popup_simple(mesa, tiempo=True)

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
    
    
    time.sleep(0.1)
