import tkinter as tk
import subprocess
import os
import mss
from PIL import Image
import shutil
from datetime import datetime

# Función para obtener el directorio base del script en ejecución
def get_base_dir():
    # Obtener el directorio base del script en ejecución (sin el último directorio)
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    return base_dir

# Obtener el directorio base del script
base_dir = get_base_dir()

def capturar_y_guardar_screenshot(x1, y1, x2, y2):
    try:
        with mss.mss() as sct:
            # Definir el área de captura basado en las coordenadas
            monitor = {"left": x1, "top": y1, "width": x2 - x1, "height": y2 - y1}
            
            # Capturar la pantalla solo en el área definida
            screenshot = sct.grab(monitor)
            
            # Convertir la captura en una imagen PIL
            img = Image.frombytes("RGB", screenshot.size, screenshot.bgra, "raw", "BGRX")
            
            # Construir la ruta de destino en el directorio deseado
            destino = os.path.join(base_dir, "img", "errores", "manual")
            os.makedirs(destino, exist_ok=True)
            
            # Nombre del archivo con marca de tiempo
            timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]
            screenshot_filename = f"screenshot_{timestamp}.png"
            screenshot_path = os.path.join(destino, screenshot_filename)
            
            # Guardar la captura en el archivo especificado
            img.save(screenshot_path)

            print("Captura de pantalla guardada correctamente en:", screenshot_path)
            
            return screenshot_path  # Devolver la ruta del archivo guardado
    except Exception as e:
        print(f"Error al capturar y guardar la pantalla: {str(e)}")
        return None

def ejecutar_script(x1, y1, x2, y2, mesa):
    try:
        var1 = "manual"
        ruta_script = os.path.join(base_dir, "python", "CaptureScreenshot.pyw")  # Ruta del script Python (ruta relativa)
        argumentos = [ruta_script, str(x1), str(y1), str(x2), str(y2), str(var1)]
        subprocess.Popen(["python"] + argumentos, creationflags=subprocess.CREATE_NO_WINDOW)

        nombre_archivo = f"result{mesa}.txt"
        destino = os.path.join(base_dir, "img", "errores", "manual", nombre_archivo)

        # Verificar si la carpeta "manual" existe; si no, crearla
        directorio_manual = os.path.dirname(destino)
        if not os.path.exists(directorio_manual):
            os.makedirs(directorio_manual)
            print(f"Se ha creado el directorio {directorio_manual}")

        # Verificar si el archivo result%mesa%.txt existe
        if os.path.exists(nombre_archivo):
            # Mover el archivo result%mesa%.txt a la carpeta de destino
            timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]
            nuevo_destino_txt = os.path.join(directorio_manual, f'screenshot_{timestamp}.txt')

            shutil.move(nombre_archivo, nuevo_destino_txt)
            print(f"Se ha movido el archivo {nombre_archivo} a {nuevo_destino_txt}")
        else:
            print(f"No se encontró el archivo {nombre_archivo}")
    except Exception as e:
        print(f"Error al ejecutar el script: {str(e)}")

def lanzar_script_musica1(mesa, x1, y1, x2, y2, ancho, alto, x1t, y1t, anchot, altot):
    try:
        # Asumir que musica1.py está en un subdirectorio llamado 'scripts' dentro del directorio base
        ruta_script_musica1 = os.path.join(base_dir, "musica1.py")  # Ajusta la ruta según sea necesario
        argumentos = [ruta_script_musica1, str(mesa), str(x1), str(y1), str(x2), str(y2), str(ancho), str(alto), str(x1t), str(y1t), str(anchot), str(altot)]
        
        print("Ejecutando script musica1.py con los argumentos:", argumentos)  # Imprimir los argumentos para verificación
        proceso = subprocess.Popen(["python"] + argumentos, creationflags=subprocess.CREATE_NO_WINDOW, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        salida, error = proceso.communicate()  # Capturar la salida y errores
        
        if proceso.returncode == 0:
            print("Script musica1.py ejecutado correctamente.")
        else:
            print("Error al ejecutar el script musica1.py:", error.decode())
    except Exception as e:
        print(f"Error al ejecutar el script musica1.py: {str(e)}")

def ejecutar_script1():
    capturar_y_guardar_screenshot(520, 210, 1296, 807)
    ejecutar_script(520, 210, 1296, 807, "1")
    lanzar_script_musica1(1, 520, 210, 1296, 807, 776, 597, 0, 0, 500, 700)

def ejecutar_script2():
    capturar_y_guardar_screenshot(520, 807, 1296, 1404)
    ejecutar_script(520, 807, 1296, 1404, "2")

def ejecutar_script3():
    capturar_y_guardar_screenshot(1296, 210, 2072, 807)
    ejecutar_script(1296, 210, 2072, 807, "3")

def ejecutar_script4():
    capturar_y_guardar_screenshot(1296, 807, 2072, 1404)
    ejecutar_script(1296, 807, 2072, 1404, "4")

def ejecutar_script_debug():
    try:
        ruta_script_debug = os.path.join(base_dir, "python", "lemon.ahk")  # Ruta relativa al script de debug
        subprocess.Popen(["autohotkey", ruta_script_debug], creationflags=subprocess.CREATE_NO_WINDOW)
        print("Script de debug ejecutado.")
    except Exception as e:
        print(f"Error al ejecutar el script de debug: {str(e)}")

# Crear la ventana principal
ventana = tk.Tk()

# Establecer el tamaño de la ventana
ventana.geometry("360x158")

# Crear los botones
boton1 = tk.Button(ventana, text="Mesa 1", command=ejecutar_script1)
boton1.pack()

boton2 = tk.Button(ventana, text="Mesa 2", command=ejecutar_script2)
boton2.pack()

boton3 = tk.Button(ventana, text="Mesa 3", command=ejecutar_script3)
boton3.pack()

boton4 = tk.Button(ventana, text="Mesa 4", command=ejecutar_script4)
boton4.pack()

boton_error = tk.Button(ventana, text="Reiniciar", command=ejecutar_script_debug)
boton_error.pack()

# Ejecutar el bucle principal de la ventana
ventana.mainloop()
