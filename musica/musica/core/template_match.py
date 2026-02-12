from __future__ import annotations

# Extracted from musica/legacy_worker.py (do not edit manually)

import os
import time

import cv2
import numpy as np

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

