from __future__ import annotations

# Extracted from musica/legacy_worker.py (do not edit manually)

import os
import time
import subprocess

import cv2
import numpy as np
import mss

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

