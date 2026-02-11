import cv2
import numpy as np
import mss
import time
import pytesseract
import db_sqlite
import os
from PIL import Image
import re
import sys
import glob
import db_sqlite
from datetime import date
import logging

# Configuración del logging
# 'filename' especifica el archivo donde se guardarán los errores
# 'level' establece el nivel de registro en ERROR, por lo que solo se registrarán los errores
# 'format' define el formato del mensaje de registro, incluyendo la fecha, nivel y mensaje
logging.basicConfig(filename='errores.txt', level=logging.ERROR,
                    format='%(asctime)s - %(levelname)s - %(message)s')



def find_image_on_screen(image_path, region=None):
    # Capturar la pantalla o la región especificada usando mss
    with mss.mss() as sct:
        if region:
            monitor = {"top": region[1], "left": region[0], "width": region[2], "height": region[3]}
        else:
            monitor = sct.monitors[1]  # Captura la pantalla completa

        screenshot = np.array(sct.grab(monitor))

    # Convertir la captura de pantalla a formato BGR (mss captura en BGRA)
    screenshot = cv2.cvtColor(screenshot, cv2.COLOR_BGRA2BGR)

    # Cargar la imagen a buscar
    template = cv2.imread(image_path, cv2.IMREAD_COLOR)

    # Obtener las dimensiones de la imagen a buscar
    template_height, template_width = template.shape[:2]

    # Realizar la coincidencia de plantilla usando el método de coincidencia por correlación
    result = cv2.matchTemplate(screenshot, template, cv2.TM_CCOEFF_NORMED)

    # Obtener la ubicación del punto de coincidencia más alto
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)

    # Verificar si se ha encontrado una coincidencia
    threshold = 0.8  # Puedes ajustar este valor según tus necesidades
    if max_val >= threshold:
        # Calcular las coordenadas absolutas de la imagen en la pantalla
        if region:
            screen_x, screen_y = region[0] + max_loc[0], region[1] + max_loc[1]
        else:
            screen_x, screen_y = max_loc

        return screen_x, screen_y, template_width, template_height
    else:
        return None

def ocr_on_region_name(image_path, region, save_path):
    try:
        # Cargar la imagen desde la ruta proporcionada
        image = cv2.imread(image_path)

        # Verificar que la imagen se haya cargado correctamente
        if image is None:
            raise FileNotFoundError(f'No se pudo cargar la imagen desde {image_path}')

        # Obtener las coordenadas de la región de interés
        x, y, w, h = region

        # Recortar la región de interés desde la imagen completa
        region_of_interest = image[y:y+h, x:x+w]

        # Ampliar la escala de la región de interés
        scale_percent = 400  # antes 320
        width_zoom = int(region_of_interest.shape[1] * scale_percent / 100)
        height_zoom = int(region_of_interest.shape[0] * scale_percent / 100)
        region_of_interest_zoomed = cv2.resize(region_of_interest, (width_zoom, height_zoom), interpolation=cv2.INTER_CUBIC)

        # Guardar la imagen ampliada para verificar visualmente (opcional)
        cv2.imwrite(save_path, region_of_interest_zoomed)

        # Aplicar OCR en la región de interés ampliada
        text = pytesseract.image_to_string(region_of_interest_zoomed)

        return text.strip()
    
    except Exception as e:
        print(f"Error en ocr_on_region_name para {image_path}: {e}")
        return None

def preprocess_image(image):
    # Convertir a escala de grises
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Aumentar la resolución
    scale_percent = 300 # Cambia este valor según tus necesidades
    width = int(gray.shape[1] * scale_percent / 100)
    height = int(gray.shape[0] * scale_percent / 100)
    dim = (width, height)
    resized = cv2.resize(gray, dim, interpolation=cv2.INTER_LINEAR)
    
    # Aplicar umbral adaptativo
    processed = cv2.adaptiveThreshold(resized, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)
    
    return processed

def preprocess_image_blancos(image):
    # Convertir a escala de grises
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Aumentar la resolución
    scale_percent = 600  # Cambia este valor según tus necesidades
    width = int(gray.shape[1] * scale_percent / 100)
    height = int(gray.shape[0] * scale_percent / 100)
    dim = (width, height)
    resized = cv2.resize(gray, dim, interpolation=cv2.INTER_LINEAR)
    
    # Crear una máscara que filtre solo los píxeles blancos
    _, mask = cv2.threshold(resized, 97, 255, cv2.THRESH_BINARY)
    
    return mask

def preprocess_image_nada(image):
    # Convertir a escala de grises
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Aumentar la resolución
    scale_percent = 200  # Cambia este valor según tus necesidades
    width = int(gray.shape[1] * scale_percent / 100)
    height = int(gray.shape[0] * scale_percent / 100)
    dim = (width, height)
    resized = cv2.resize(gray, dim, interpolation=cv2.INTER_LINEAR)
    
    # Crear una máscara que filtre solo los píxeles blancos
    #_, mask = cv2.threshold(resized, 97, 255, cv2.THRESH_BINARY)
    
    return resized

def preprocess_image_naranja(image):
    # Convertir la imagen al espacio de color HSV
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    
    # Definir el rango de color naranja en el espacio HSV
    lower_orange = np.array([10, 100, 100])  # Limite inferior (H, S, V)
    upper_orange = np.array([25, 255, 255])  # Limite superior (H, S, V)
    
    # Crear una máscara que filtre solo los píxeles naranjas
    orange_mask = cv2.inRange(hsv, lower_orange, upper_orange)
    
    # Definir el rango de color blanco en el espacio HSV
    lower_white = np.array([0, 0, 200])
    upper_white = np.array([180, 55, 255])
    
    # Crear una máscara que filtre solo los píxeles blancos
    white_mask = cv2.inRange(hsv, lower_white, upper_white)
    
    # Invertir la máscara de blanco para eliminar los píxeles blancos
    inverse_white_mask = cv2.bitwise_not(white_mask)
    
    # Aplicar la máscara inversa a la imagen original
    filtered_image = cv2.bitwise_and(image, image, mask=inverse_white_mask)
    
    # Convertir la imagen filtrada al espacio HSV nuevamente
    filtered_hsv = cv2.cvtColor(filtered_image, cv2.COLOR_BGR2HSV)
    
    # Aplicar la máscara naranja sobre la imagen filtrada
    final_orange_mask = cv2.inRange(filtered_hsv, lower_orange, upper_orange)
    
    # Aumentar la resolución
    scale_percent = 500  # Cambia este valor según tus necesidades
    width = int(final_orange_mask.shape[1] * scale_percent / 100)
    height = int(final_orange_mask.shape[0] * scale_percent / 100)
    dim = (width, height)
    resized_mask = cv2.resize(final_orange_mask, dim, interpolation=cv2.INTER_LINEAR)
    
    return resized_mask

def is_last_line_mostly_white(image_path, threshold=0.7, tolerance=10):
    # Abre la imagen
    img = Image.open(image_path).convert('RGB')  # Convertir la imagen a RGB
    
    # Obtén las dimensiones de la imagen
    width, height = img.size
    
    # Carga los píxeles de la imagen
    pixels = img.load()
    
    # Función para comprobar si un píxel es casi blanco
    def is_almost_white(pixel, tolerance):
        return all(channel >= 255 - tolerance for channel in pixel)

    # Cuenta los píxeles blancos en la última línea
    white_pixel_count = 0
    for x in range(width):
        if is_almost_white(pixels[x, height - 1], tolerance):  # Comprueba si el píxel es casi blanco
            white_pixel_count += 1
    
    # Calcula el porcentaje de píxeles blancos
    white_pixel_percentage = white_pixel_count / width
    
    # Comprueba si el porcentaje de píxeles blancos es mayor que el umbral
    return white_pixel_percentage > threshold

def ocr_on_region_hud(image_path, region, save_path, dato, scale_factor=1.11):
    # Cargar la imagen desde la ruta proporcionada
    image = cv2.imread(image_path)

    # Verificar que la imagen se haya cargado correctamente
    if image is None:
        raise FileNotFoundError(f'No se pudo cargar la imagen desde {image_path}')

    # Obtener las coordenadas de la región de interés
    x, y, w, h = region

    # Recortar la región de interés desde la imagen completa
    region_of_interest = image[y:y+h, x:x+w]

    if dato == "manos" or dato == "vip" or dato == "pfr":
        processed_image = preprocess_image_blancos(region_of_interest)

    elif dato == "3bet":
        processed_image = preprocess_image_naranja(region_of_interest)

    elif dato == "NADA":
        processed_image = preprocess_image_nada(region_of_interest)

    # Ampliar la imagen antes de aplicar OCR
    new_width = int(processed_image.shape[1] * scale_factor)
    new_height = int(processed_image.shape[0] * scale_factor)
    enlarged_image = cv2.resize(processed_image, (new_width, new_height), interpolation=cv2.INTER_LINEAR)

    # Guardar la imagen procesada para verificar visualmente (opcional)
    if save_path:
        cv2.imwrite(save_path, enlarged_image)

    # Usar OCR para extraer el texto de la imagen procesada
    config = '--psm 7'  # Modo de segmentación de página para una sola línea de texto
    text = pytesseract.image_to_string(enlarged_image, config=config)

    return text

def extract_last_digits(text):
    # Dividir la cadena en partes usando el espacio como delimitador
    parts = text.split()
    
    # Obtener la última parte
    last_part = parts[-1]
    
    return last_part

def get_latest_file(directory):
    # Obtener una lista de todos los archivos en el directorio junto con sus rutas completas
    files = [os.path.join(directory, f) for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]
    
    if not files:
        return None
    
    # Ordenar los archivos por nombre
    files.sort()
    
    # Obtener el último archivo en la lista ordenada
    latest_file = files[-1]
    
    return latest_file

def contar_archivos_png_bmp_desglosado(ruta_directorio):
    # Diccionario para almacenar el número de archivos por extensión en cada directorio y subdirectorio
    conteo_archivos = {}

    # Función para contar archivos en un directorio y subdirectorios
    def contar_archivos_en_directorio(directorio):
        conteo_archivos_local = {}
        for directorio_actual, subdirectorios, archivos in os.walk(directorio):
            for archivo in archivos:
                if archivo.lower().endswith(('.png', '.bmp')):
                    # Obtener la extensión del archivo
                    extension = os.path.splitext(archivo)[1].lower()

                    # Contar el archivo por su extensión
                    if extension in conteo_archivos_local:
                        conteo_archivos_local[extension] += 1
                    else:
                        conteo_archivos_local[extension] = 1
        return conteo_archivos_local

    # Iterar sobre todos los directorios y subdirectorios dentro de ruta_directorio
    for directorio_actual, subdirectorios, archivos in os.walk(ruta_directorio):
        # Contar archivos en el directorio y subdirectorios
        conteo_archivos[directorio_actual] = contar_archivos_en_directorio(directorio_actual)

    # Ordenar los resultados de mayor a menor cantidad de archivos por extensión
    for directorio, conteo_archivos_dir in conteo_archivos.items():
        conteo_archivos[directorio] = dict(sorted(conteo_archivos_dir.items(), key=lambda item: item[1], reverse=True))

    return conteo_archivos

# Función para imprimir resultados ordenados
def imprimir_resultados_ordenados(resultado):
    for directorio, conteo_archivos in sorted(resultado.items()):
        print(f'Directorio: {directorio}')
        for extension, num_archivos in sorted(conteo_archivos.items(), key=lambda item: item[1], reverse=True):
            print(f'  Archivos con extensión {extension}: {num_archivos}')

def find_image_in_image(image_to_find_path, image_to_search_path, region=None, threshold=0.70, output_path="search_region.png"):
    # Cargar las imágenes desde las rutas especificadas
    image_to_find = cv2.imread(image_to_find_path, cv2.IMREAD_COLOR)
    image_to_search = cv2.imread(image_to_search_path, cv2.IMREAD_COLOR)

    if image_to_find is None or image_to_search is None:
        raise ValueError("One or both of the images could not be loaded.")

    # Si no se especifica una región, utilizar toda la imagen de búsqueda
    if region is None:
        region = (0, 0, image_to_search.shape[1], image_to_search.shape[0])

    # Obtener las coordenadas de la región de búsqueda
    x, y, w, h = region
    search_region = image_to_search[y:y+h, x:x+w]

    # Guardar la región de búsqueda completa
    cv2.imwrite(output_path, search_region)

    # Realizar la coincidencia de plantilla usando el método de coincidencia por correlación
    result = cv2.matchTemplate(search_region, image_to_find, cv2.TM_CCOEFF_NORMED)

    # Obtener la ubicación del punto de coincidencia más alto
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)

    # Verificar si se ha encontrado una coincidencia que supere el umbral
    if max_val >= threshold:
        screen_x = max_loc[0] + x
        screen_y = max_loc[1] + y
        return screen_x, screen_y, image_to_find.shape[1], image_to_find.shape[0]
    else:
        return None

def capture_and_process(image_path, region, scale_percent, whitelist, config, zoom_factor=2, save_path='ocr_region.png'):
    start_time = time.time()
    try:
        # Validar y asegurar que los valores de la región son enteros
        if len(region) != 4:
            raise ValueError("Region must be a tuple of four values (x, y, w, h)")
        
        # Imprimir la región para depuración
        print(f"Región original: {region}")

        # Asegurarse de que los valores de la región sean enteros
        region = tuple(map(int, region))
        x, y, w, h = region
        
        # Imprimir la región después de convertir a enteros
        print(f"Región convertida a enteros: {region}")
        
        if w <= 0 or h <= 0:
            raise ValueError("Width and height of the region must be positive integers")
        
        # Cargar la imagen desde la ruta especificada
        imagen_np = cv2.imread(image_path, cv2.IMREAD_COLOR)
        if imagen_np is None:
            raise ValueError(f"Could not load image from path: {image_path}")

        # Verificar que la región esté dentro de los límites de la imagen
        if x < 0 or y < 0 or x+w > imagen_np.shape[1] or y+h > imagen_np.shape[0]:
            raise ValueError("Region is out of image bounds")

        # Extraer la región de interés
        imagen_np = imagen_np[y:y+h, x:x+w]
        
        # Guardar la región de interés antes de convertir a escala de grises
        cv2.imwrite(save_path, imagen_np)
        
        # Convertir la imagen a escala de grises
        imagen_gris = cv2.cvtColor(imagen_np, cv2.COLOR_BGR2GRAY)
        
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
        
        # Realizar OCR en la imagen ampliada
        # Aplicar umbralización leve
        _, imagen_umbral = cv2.threshold(imagen_gris_resized, 170, 255, cv2.THRESH_BINARY)
        
        # Redimensionar y ampliar la imagen umbralizada
        imagen_umbral_zoom = cv2.resize(imagen_umbral, (width_zoom, height_zoom), interpolation=cv2.INTER_CUBIC)
        
        # Convertir la imagen umbralizada y ampliada a PIL.Image
        pil_image_umbral_zoom = Image.fromarray(imagen_umbral_zoom)
        
        # Realizar OCR en la imagen umbralizada y ampliada
        texto_ocr = pytesseract.image_to_string(pil_image_umbral_zoom, config=config)
        
        # Aplicar la whitelist si se proporciona
        if whitelist:
            print(f"Texto OCR antes de la whitelist: {texto_ocr.strip()}")
            texto_ocr = re.sub(rf'[^{whitelist}]', '', texto_ocr)
            print(f"Texto OCR después de la whitelist: {texto_ocr.strip()}")
        
        print(f"Resultado OCR: {texto_ocr.strip()}")
    except Exception as e:
        print(f"Error processing image {image_path}: {e}")

    end_time = time.time()
    print(f"\ncapture_and_process: {end_time - start_time:.4f} segundos")

def extraer_manos(p3hands_hu_hud_linea):
    p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace('-', ' ')
    #print(f'Texto encontrado: {p3hands_hu_hud_linea}')


    # Ejemplo de uso
    p3hands_hu_hud = p3hands_hu_hud_linea.replace("|", " ")
    p3hands_hu_hud = extract_last_digits(p3hands_hu_hud)
    p3hands_hu_hud = p3hands_hu_hud.replace("k", "000")
    p3hands_hu_hud = p3hands_hu_hud.replace("-", "")
    p3hands_hu_hud = p3hands_hu_hud.replace("L", "1")
    p3hands_hu_hud = p3hands_hu_hud.replace("0|", "")
    p3hands_hu_hud = p3hands_hu_hud.replace("|", "")
    p3hands_hu_hud = p3hands_hu_hud.replace("S", "5")
    p3hands_hu_hud = p3hands_hu_hud.replace("a", "4")
    p3hands_hu_hud = p3hands_hu_hud.replace(")", "1")
    p3hands_hu_hud = p3hands_hu_hud.replace("i", "1")
    p3hands_hu_hud = p3hands_hu_hud.replace("T", "7")
    p3hands_hu_hud = p3hands_hu_hud.replace("J", "2")
    if p3hands_hu_hud.endswith('.'):
        p3hands_hu_hud = p3hands_hu_hud.rstrip('.')
    try:
        p3hands_hu_hud = int(p3hands_hu_hud)
    except ValueError:
        print(f"Error: No se puede convertir {p3hands_hu_hud} a un entero.")

    return p3hands_hu_hud

def limpiar_nombre(p3name):

    p3name = p3name.replace('\n', '')
    p3name = p3name.replace('’”', '')
    p3name = p3name.replace('_ ', '')
    #p3name = p3name.replace('- ', '')



    return p3name

def extraer_vip_pfr(p3hands_hu_hud_linea):
    # Extraer VPIP y PFR
    # Patrón para verificar los formatos
    p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace('%', '3')
    patron_4_digitos = re.compile(r'^\d{4} ')
    patron_3_digitos = re.compile(r'^\d{3} ')
    patron_2_digitos_espacio_2_digitos = re.compile(r'^\d{2} \d{2}')
    patron_4_digitos_guion = re.compile(r'^\d{4}-')
    patron_2_digitos_espacio_digito_espacio_digito_espacio = re.compile(r'^\d{2} \d \d ')
    patron_6_digitos = re.compile(r'^\d{6} ')
    patron_5_digitos = re.compile(r'^\d{5} ')
    patron_2_digitos_espacio_4_digitos = re.compile(r'^\d{2} \d{4}')

    # Inicializar variables para evitar errores si no se encuentran coincidencias
    p3vip_hu = None
    p3pfr_hu = None

    # Verificar los patrones
    if patron_4_digitos.match(p3hands_hu_hud_linea):
        # La cadena empieza con 4 dígitos seguidos de un espacio
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[2:4]
    elif patron_3_digitos.match(p3hands_hu_hud_linea):
        # La cadena empieza con 3 dígitos seguidos de un espacio
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[2:3]
    elif patron_2_digitos_espacio_2_digitos.match(p3hands_hu_hud_linea):
        # La cadena empieza con 2 dígitos, un espacio, y 2 dígitos
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[3:5]
    elif patron_4_digitos_guion.match(p3hands_hu_hud_linea):
        # La cadena empieza con 4 dígitos seguidos de un guion
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[2:4]
    elif patron_2_digitos_espacio_digito_espacio_digito_espacio.match(p3hands_hu_hud_linea):
        # La cadena empieza con 2 dígitos, un espacio, un dígito, un espacio, un dígito y otro espacio
        #print(p3hands_hu_hud_linea)
        #time.sleep(1000)
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[3:4]
    elif patron_6_digitos.match(p3hands_hu_hud_linea):
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[2:4]
    elif patron_5_digitos.match(p3hands_hu_hud_linea):
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[2:4]
    elif patron_2_digitos_espacio_4_digitos.match(p3hands_hu_hud_linea):
        p3vip_hu = p3hands_hu_hud_linea[:2]
        p3pfr_hu = p3hands_hu_hud_linea[3:5]

    else:
        print("La cadena no sigue ninguno de los patrones especificados.")
        #print(p3hands_hu_hud_linea)
        p3vip_hu = None 
        p3pfr_hu = None

    return p3vip_hu, p3pfr_hu

def extraer_3bet(p3hands_hu_hud_linea, p3vip_hu, p3pfr_hu):

    #print(p3hands_hu_hud_linea)
    #time.sleep(1000)
    p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace(p3vip_hu, "").replace(p3pfr_hu, "")
    if p3hands_hu_hud_linea.startswith('-'):
        p3hands_hu_hud_linea = None
    if p3hands_hu_hud_linea.startswith(' -'):
        p3hands_hu_hud_linea = None


    else:
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.strip()
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.lstrip()
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace("(", "")
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace("|", "")
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace(")", "1")
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace("?", "")
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.split()


        #print(p3hands_hu_hud_linea[0])
        p3hands_hu_hud_linea = p3hands_hu_hud_linea[0]
        if p3hands_hu_hud_linea.isdigit():
            p3hands_hu_hud_linea = p3hands_hu_hud_linea
        else:
            #p3hands_hu_hud_linea = 0
            None

        #print(p3hands_hu_hud_linea)
        p3hands_hu_hud_linea = p3hands_hu_hud_linea[:2]
        p3hands_hu_hud_linea = p3hands_hu_hud_linea.replace("-", "")

    return p3hands_hu_hud_linea

def esperar_archivo_presente(ruta_archivo, intervalo_segundos=1, max_intentos=10):
    intentos = 0
    while not os.path.exists(ruta_archivo) and intentos < max_intentos:
        print(f"Esperando archivo en {ruta_archivo}...")
        time.sleep(intervalo_segundos)
        intentos += 1
    
    if os.path.exists(ruta_archivo):
        print(f"El archivo {ruta_archivo} está presente.")
        return True
    else:
        print(f"El archivo {ruta_archivo} no se encontró después de {max_intentos} intentos.")
        return False



p2name = sys.argv[1] if len(sys.argv) > 1 else ""
p3name = sys.argv[2] if len(sys.argv) > 2 else ""
situacion = sys.argv[3] if len(sys.argv) > 3 else ""
latest_file_3H = sys.argv[4] if len(sys.argv) > 4 else ""
latest_file_HU = sys.argv[5] if len(sys.argv) > 5 else ""
nuevoDestino = sys.argv[6] if len(sys.argv) > 6 else ""
mano = sys.argv[7] if len(sys.argv) > 7 else ""
stacefectivo = sys.argv[8] if len(sys.argv) > 8 else ""

if p2name == "****":
    p2name = ""
if p3name == "****":
    p3name = ""

print(p2name)
print(p3name)
print(situacion)
print(latest_file_3H)
print(latest_file_HU)
print(nuevoDestino)

situacion_db = situacion

nombre_archivo = os.path.basename(latest_file_3H)
print(nombre_archivo)
latest_file_3H = os.path.join(nuevoDestino, nombre_archivo)
latest_file_HU = latest_file_3H
print(latest_file_3H)

if "HU" in latest_file_3H:
    # Hacer algo si la variable contiene "PREFLOP\HU"
    situacion = "hu"
else:
    # Hacer algo si la variable no contiene "PREFLOP\HU"
    situacion = "3h"

print(situacion)
if esperar_archivo_presente(latest_file_3H):
    # Continuar con el código sabiendo que el archivo está presente
    print("Procesando el archivo...")
else:
    # Manejar la situación si el archivo no está presente después de los intentos
    print("No se pudo encontrar el archivo después de esperar.")

ancho = 776
alto = 597

#VALOR VARIABLES DIRECTO


# Obtener la ruta del directorio base
ruta_base = os.path.dirname(os.path.abspath(__file__))
# Quitar el último directorio de la ruta
#ruta_base = os.path.dirname(ruta_base)
#print(f'Ruta base: {ruta_base}')

#MUESTRA EL NUMERO DE ARCHIVOS QUE TIENE CADA DIRECTORIO ; MAS ADELANTE PODEMOS VER LA SITUACION QUE SE REPITE MAS A MENUDO PARA PODER FILTRAR
# NO ESTA ORDENANDO EL DE MANYOR A MENOR

ruta_directorio = os.path.join(ruta_base, "img", "PREFLOP")  # Reemplaza con la ruta de tu directorio
resultado = contar_archivos_png_bmp_desglosado(ruta_directorio)
# Imprimir resultados ordenados de mayor a menor
#imprimir_resultados_ordenados(resultado)



# Ejemplo de uso
directory_path = os.path.join(ruta_base, "img", "PREFLOP", "3H", "BTN")  # Reemplaza con la ruta de tu directorio
#print(directory_path)
#latest_file_3H = get_latest_file(directory_path)



# ASIGNAR LA ULTIMA MANO 3H Y HU PARA EXTRAER LOS DATOS
if latest_file_3H:
    None
    #print(f'ARCHIVO: {latest_file_3H}')
else:
    print(f'No se encontraron archivos en el directorio {directory_path}')

directory_path = os.path.join(ruta_base, "img", "PREFLOP", "HU", "SB")  # Reemplaza con la ruta de tu directorio
#latest_file_HU = get_latest_file(directory_path)

if latest_file_HU:
    None
    #print(f'ARCHIVO: {latest_file_HU}')
else:
    print(f'No se encontraron archivos en el directorio {directory_path}')





inicio = time.time()


# AHORA TIENE QUE ESPERAR A ENCONTRAR UNA IAMGEN DEL HUD, CUANDO YA HAYAMOS CARGADO VALORES A LA BASE DE DATOS PODREMOS MOSTRAR LOS DATOS QUE TENGAMOS ALMACENADOS EN LA DB ANTES DE ESPERAR A LA PRSENCIA DEL HUD PARA VERIFICAR SI TENEMOS QUE ACTUALIZAR
encontradas_hud = []
image_p = os.path.join(ruta_base, "img", "img_referencia", "p.png")
region_sb_ini_p2 = (0, 225, 200, 75)  
region_sb_ini_p2_2 = (200, 225, 200, 75)  
region_sb_ini_p3 = (450, 225, 200, 75) 
region_sb_ini_p3_2 = (650, 225, 200, 75) 
save_path = os.path.join(ruta_base, "img", "errores", "ocr_region.png")

db_sqlite.create_table()


if situacion == "3h":
    # Buscar la imagen `SBvsBB_3H`
    if 'sb_ini_p2' not in encontradas_hud and latest_file_3H != None:
        result_sb_ini_p2 = find_image_in_image(image_p, latest_file_3H, region_sb_ini_p2)
        result_sb_ini_p2_2 = find_image_in_image(image_p, latest_file_3H, region_sb_ini_p2_2)
        #print(result_sb_ini_p2)
        #print(result_sb_ini_p2_2)
        #time.sleep(1000)
        if result_sb_ini_p2 != None and result_sb_ini_p2_2 != None:
            encontradas_hud.append('sb_ini_p2')
            #print('P2 SB INI ENCONTRADA')
            xp2_1, yp2_1,ancho_p2_1,alto_p2_1 = result_sb_ini_p2
            xp2_1_2, yp2_1,ancho_p2_1,alto_p2_1  = result_sb_ini_p2_2
            #print(xp2_1, yp2_1,ancho_p2_1,alto_p2_1)
            region_p2hands_3h = (xp2_1+10, yp2_1-10, (xp2_1_2-(xp2_1+15)), 21)#ANTES19

    if 'sb_ini_p3' not in encontradas_hud and latest_file_3H != None:
        result_sb_ini_p3 = find_image_in_image(image_p, latest_file_3H, region_sb_ini_p3)
        #print(result_sb_ini_p3)
        #time.sleep(1000)
        result_sb_ini_p3_2 = find_image_in_image(image_p, latest_file_3H, region_sb_ini_p3_2)
        
        #print(result_sb_ini_p3_2)
        #time.sleep(1000)
        if result_sb_ini_p3  != None and result_sb_ini_p3_2  != None:
            encontradas_hud.append('sb_ini_p3')
            #print('p3 SB INI ENCONTRADA')
            xp3_1, yp3_1,ancho_p3_1,alto_p3_1  = result_sb_ini_p3
            xp3_1_2, yp3_1,ancho_p3_1,alto_p3_1  = result_sb_ini_p3_2
            region_p3hands_3h = (xp3_1+10, yp3_1-10, (xp3_1_2-(xp3_1+15)), 21)  #antes 19



    #print(encontradas_hud)
    
    

    # Verificar si se encontraron todas las imágenes
    if set(encontradas_hud) == {'sb_ini_p2', 'sb_ini_p3'}:
        print("ESTAMOS EN 3H")

        #p2
        print(f'p2name: {p2name}')
        #time.sleep(1000)

        if p2name != "":
            p2hands_3h_hud_linea = ocr_on_region_hud(latest_file_3H, region_p2hands_3h, save_path, "manos")
            #print(p2hands_3h_hud_linea)
            #time.sleep(1000)
            p2hands_3h_hud = extraer_manos(p2hands_3h_hud_linea)
            print(f'MANOS_3H_HUD: {p2hands_3h_hud}')
            p2vip_3h, p2pfr_3h = extraer_vip_pfr (p2hands_3h_hud_linea)
            print(f"VIP: {p2vip_3h} PFR: {p2pfr_3h}")
            #p2hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p2hands_3h, save_path, "3bet")
            p2_3bet = extraer_3bet(p2hands_3h_hud_linea, p2vip_3h, p2pfr_3h)
            print("3bet:",p2_3bet)

            if p2hands_3h_hud != "":
                p2_manos_3h_db = db_sqlite.get_manos_3h(p2name)
                print(f'MANOS_3H_DB de: {p2_manos_3h_db}')
                p2_id = db_sqlite.get_player_id(p2name)
                print("p2_ID", p2_id)

            if p2_id is None:
                    db_sqlite.insert_player(p2name, None, p2hands_3h_hud, None)
                    p2_id = db_sqlite.get_player_id(p2name)
                    db_sqlite.insert_3h_hud(p2_id, p2vip_3h, p2pfr_3h, p2_3bet, None, None, None, None, None, None, None)

            if p2_id is not None:
                    db_sqlite.insert_3h_hud(p2_id, p2vip_3h, p2pfr_3h, p2_3bet, None, None, None, None, None, None, None)
            
            if p2_manos_3h_db is None:
                p2_manos_3h_db = 0
            if int(p2hands_3h_hud) > int(p2_manos_3h_db):
                print("mas manos en hud que en db")
                db_sqlite.update_manos_3h(p2name, p2hands_3h_hud)
                db_sqlite.update_3h_hud(player_id=p2_id, vip=p2vip_3h, pfr=p2pfr_3h)

        else:
            print("no se puede añadir el jugado pq no tiene nombre")


        #time.sleep(1000)

        print("\n")
        #p3
        #p3name = ocr_on_region_name(latest_file_3H, region_p3name, save_path)
        #p3name = limpiar_nombre(p3name)
        print(f'p3name: {p3name}')

        if p3name != "":
            p3hands_hu_hud_linea = ocr_on_region_hud(latest_file_3H, region_p3hands_3h, save_path, "manos")
            print(region_p3hands_3h)
            #time.sleep(1000)
            print(p3hands_hu_hud_linea)
            #time.sleep(1000)
            p3hands_hu_hud = extraer_manos(p3hands_hu_hud_linea)
            print(f'MANOS_3H_HUD: {p3hands_hu_hud}')
            p3vip_hu, p3pfr_hu = extraer_vip_pfr (p3hands_hu_hud_linea)
            print(f"VIP: {p3vip_hu} PFR: {p3pfr_hu}")
            #p3hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p3hands_3h, save_path, "3bet")
            p3_3bet = extraer_3bet(p3hands_hu_hud_linea, p3vip_hu, p3pfr_hu)
            print("3bet:",p3_3bet)
            #print(p3hands_hu_hud_linea)
            #time.sleep(1000)

            if p3hands_hu_hud != "":
                p3_manos_hu_db = db_sqlite.get_manos_3h(p3name)
                print(f'MANOS_3H_DB de: {p3_manos_hu_db}')
                p3_id = db_sqlite.get_player_id(p3name)
                print("P3_ID", p3_id)

            if p3_id is None:
                    db_sqlite.insert_player(p3name, None, p3hands_hu_hud, None)
                    p3_id = db_sqlite.get_player_id(p3name)
                    db_sqlite.insert_3h_hud(p3_id, p3vip_hu, p3pfr_hu, p3_3bet, None, None, None, None, None, None, None)
            if p3_id is not None:
                    db_sqlite.insert_3h_hud(p3_id, p3vip_hu, p3pfr_hu, p3_3bet, None, None, None, None, None, None, None)
                    
            if p3_manos_hu_db is None:
                p3_manos_hu_db = 0
            if int(p3hands_hu_hud) > int(p3_manos_hu_db):
                print("mas manos en hud que en db")
                db_sqlite.update_manos_3h(p3name, p3hands_hu_hud)
                db_sqlite.update_3h_hud(player_id=p3_id, vip=p3vip_hu, pfr=p3pfr_hu)

        else:
            print("no se puede añadir el jugado pq no tiene nombre")

    else:
        print("3H PERO SIN HUD")

    #time.sleep(1000)
else:
    print("entramos")
    
    encontradas_hud = []
    
    # Buscar la imagen `SBvsBB_HU`
    if 'sb_ini_p2' not in encontradas_hud:
        result_sb_ini_p2 = find_image_in_image(image_p, latest_file_HU, region_sb_ini_p2)
        result_sb_ini_p2_2 = find_image_in_image(image_p, latest_file_HU, region_sb_ini_p2_2)

        #print(result_sb_ini_p2)
        #print(result_sb_ini_p2_2)
        #time.sleep(1000)
        if result_sb_ini_p2 and result_sb_ini_p2_2:
            encontradas_hud.append('sb_ini_p2')
            #print('P2 SB INI ENCONTRADA')
            xp2_1, yp2_1,ancho_p2_1,alto_p2_1 = result_sb_ini_p2
            xp2_1_2, yp2_1,ancho_p2_1,alto_p2_1  = result_sb_ini_p2_2
            region_p2hands_3h = (xp2_1+10, yp2_1-10, (xp2_1_2-(xp2_1+7)), 21)#ANTES19
            #print(xp2_1)
            #print(xp2_1_2)
            #time.sleep(1000)

    if 'sb_ini_p3' not in encontradas_hud:
        result_sb_ini_p3 = find_image_in_image(image_p, latest_file_HU, region_sb_ini_p3)
        #print(result_sb_ini_p3)
        #time.sleep(1000)
        result_sb_ini_p3_2 = find_image_in_image(image_p, latest_file_HU, region_sb_ini_p3_2)
        
        #print(result_sb_ini_p3_2)
        #time.sleep(1000)
        if result_sb_ini_p3 and result_sb_ini_p3_2:
            encontradas_hud.append('sb_ini_p3')
            #print('p3 SB INI ENCONTRADA')
            xp3_1, yp3_1,ancho_p3_1,alto_p3_1  = result_sb_ini_p3
            xp3_1_2, yp3_1,ancho_p3_1,alto_p3_1  = result_sb_ini_p3_2
            region_p3hands_3h = (xp3_1+10, yp3_1-10, (xp3_1_2-(xp3_1+15)), 21)  #antes 19 

            #print(result_sb_ini_p3)
            #print(sb_ini_x)



    if set(encontradas_hud) == {'sb_ini_p2', 'sb_ini_p3'}:
        print("HU PERO HUD 3H")

    
      
    print("\n")
    if set(encontradas_hud) == {'sb_ini_p2'}:
        print("HU VS P2")

        #p2
        print(f'p2name: {p2name}')

        if p2name != "":
            p2hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p2hands_3h, save_path, "manos")
            #print(p2hands_hu_hud_linea)
            #time.sleep(1000)
            p2hands_hu_hud = extraer_manos(p2hands_hu_hud_linea)
            print(f'MANOS_3H_HUD: {p2hands_hu_hud}')

            p2vip_hu, p2pfr_hu = extraer_vip_pfr(p2hands_hu_hud_linea)

            print(f"VIP: {p2vip_hu} PFR: {p2pfr_hu}")
            #p2hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p2hands_3h, save_path, "3bet")
            p2_3bet = extraer_3bet(p2hands_hu_hud_linea, p2vip_hu, p2pfr_hu)
            print("3bet:",p2_3bet)
            #print(p2hands_hu_hud_linea)
            #time.sleep(1000)

            if p2hands_hu_hud != "":
                p2_manos_hu_db = db_sqlite.get_manos_hu(p2name)
                print(f'MANOS_3H_DB de: {p2_manos_hu_db}')
                p2_id = db_sqlite.get_player_id(p2name)
                print("p2_ID", p2_id)

            if p2_id is None:
                    db_sqlite.insert_player(p2name, None, None, p2hands_hu_hud)
                    p2_id = db_sqlite.get_player_id(p2name)
                    db_sqlite.insert_hu_hud(p2_id, p2vip_hu, p2pfr_hu, p2_3bet, None, None, None, None, None, None, None)
            if p2_id is not None:
                    db_sqlite.insert_hu_hud(p2_id, p2vip_hu, p2pfr_hu, p2_3bet, None, None, None, None, None, None, None)
                    
            if p2_manos_hu_db is None:
                p2_manos_hu_db = 0
            if int(p2hands_hu_hud) > int(p2_manos_hu_db):
                print("mas manos en hud que en db")
                db_sqlite.update_manos_hu(p2name, p2hands_hu_hud)
                db_sqlite.update_hu_hud(player_id=p2_id, vip=p2vip_hu, pfr=p2pfr_hu)


            print("\n")

    print("\n")
    if set(encontradas_hud) == {'sb_ini_p3'}:
        print("HU VS P3")
        #p3

        print(f'p3name: {p3name}')

        if p3name != "":
            p3hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p3hands_3h, save_path, "manos")
            #print(p3hands_hu_hud_linea)
            p3hands_hu_hud = extraer_manos(p3hands_hu_hud_linea)
            print(f'MANOS_3H_HUD: {p3hands_hu_hud}')
            p3vip_hu, p3pfr_hu = extraer_vip_pfr (p3hands_hu_hud_linea)
            print(f"VIP: {p3vip_hu} PFR: {p3pfr_hu}")
            #p3hands_hu_hud_linea = ocr_on_region_hud(latest_file_HU, region_p3hands_3h, save_path, "3bet")
            p3_3bet = extraer_3bet(p3hands_hu_hud_linea, p3vip_hu, p3pfr_hu)
            print("3bet:",p3_3bet)
            #print(p3hands_hu_hud_linea)
            #time.sleep(1000)

            if p3hands_hu_hud != "":
                p3_manos_hu_db = db_sqlite.get_manos_hu(p3name)
                print(f'MANOS_3H_DB de: {p3_manos_hu_db}')
                p3_id = db_sqlite.get_player_id(p3name)
                print("P3_ID", p3_id)

            if p3_id is None:
                    db_sqlite.insert_player(p3name, None, None, p3hands_hu_hud)
                    p3_id = db_sqlite.get_player_id(p3name)
                    db_sqlite.insert_hu_hud(p3_id, p3vip_hu, p3pfr_hu, p3_3bet, None, None, None, None, None, None, None)
            if p3_id is not None:
                    db_sqlite.insert_hu_hud(p3_id, p3vip_hu, p3pfr_hu, p3_3bet, None, None, None, None, None, None, None)
                    
            if p3_manos_hu_db is None:
                p3_manos_hu_db = 0
            if int(p3hands_hu_hud) > int(p3_manos_hu_db):
                print("mas manos en hud que en db")
                db_sqlite.update_manos_hu(p3name, p3hands_hu_hud)
                db_sqlite.update_hu_hud(player_id=p3_id, vip=p3vip_hu, pfr=p3pfr_hu)

region_torneo = (153, 0, 57, 25)
torneo = ocr_on_region_hud(latest_file_3H, region_torneo, save_path, "NADA") 
print("Numero torneo",torneo)
print(mano)


mano_db = mano
c1 = mano[0]
p1 = mano[1]
c2 = mano[2]
p2 = mano[3]

if c1 == "T":
    c1 = "10"
if c2 == "T":
    c2 = "10"

mano = p1+c1+" "+p2+c2
print(mano)



#MONTAR LA RUTA PARA QUE CRERE EL AÑO, DIA Y MES
'''
ruta_base = r"G:\Mi unidad\faina\iPoker"

# Función para obtener los últimos 5 archivos creados
# Función para obtener los últimos 5 archivos .xml creados de forma recursiva
def obtener_ultimos_archivos_xml(ruta_base):
    archivos_xml = []

    # Recorrer de forma recursiva todos los archivos y carpetas en la ruta base
    for root, _, files in os.walk(ruta_base):
        for archivo in files:
            if archivo.endswith('.xml'):
                ruta_completa = os.path.join(root, archivo)
                fecha_creacion = os.path.getctime(ruta_completa)
                archivos_xml.append((ruta_completa, archivo, fecha_creacion))

    # Ordenar por fecha de creación de forma descendente
    archivos_xml.sort(key=lambda x: x[2], reverse=True)
    
    # Obtener los nombres y rutas completas de los últimos 5 archivos
    ultimos_5_archivos = [(ruta, nombre) for ruta, nombre, _ in archivos_xml[:5]]
    
    return ultimos_5_archivos

# Obtener los últimos 5 archivos .xml creados de forma recursiva
ultimos_archivos_xml = obtener_ultimos_archivos_xml(ruta_base)

# Imprimir los nombres y rutas completas de los últimos 5 archivos .xml creados
print("Últimos 5 archivos .xml creados en", ruta_base)
for idx, (ruta_completa, nombre_archivo) in enumerate(ultimos_archivos_xml, start=1):
    print(f"{idx}. Nombre: {nombre_archivo}, Ruta Completa: {ruta_completa}")
'''

ruta_base = r"C:\Program Files (x86)\Casino Barcelona Poker\data\punterdark13\History\Data\Tournaments"


# Variable que contiene el valor a buscar en los archivos .xml
valor_busqueda = torneo.replace("\n", "").replace("\r", "")

variable_mano = mano

gamecode_tag = '<game gamecode="'

def buscar_archivo_con_valor(ruta_base, valor_busqueda):
    tiempo_inicio = time.time()  # Tiempo de inicio de la búsqueda
    tiempo_limite = 1  # 2 minutos en segundos
    
    while time.time() - tiempo_inicio < tiempo_limite:
        # Buscar archivos XML en la ruta base y subcarpetas
        for ruta_raiz, carpetas, archivos in os.walk(ruta_base):
            for nombre_archivo in archivos:
                if nombre_archivo.endswith(".xml"):
                    ruta_completa = os.path.join(ruta_raiz, nombre_archivo)
                    try:
                        with open(ruta_completa, "r", encoding="utf-8") as archivo:
                            contenido = archivo.read()
                            if valor_busqueda in contenido:
                                return ruta_completa
                    except Exception as e:
                        print(f"Error al leer archivo {ruta_completa}: {e}")
        
        time.sleep(1)  # Esperar 1 segundo antes de volver a buscar
    
    # Si se agota el tiempo sin encontrar el archivo
    return None

def buscar_variable_mano_en_archivo(ruta_archivo, variable_mano):
    if not ruta_archivo:
        return None
    
    # Abrir el archivo encontrado y buscar la variable 'mano'
    with open(ruta_archivo, "r", encoding="utf-8") as archivo:
        for num_linea, linea in enumerate(archivo, start=1):
            if variable_mano in linea:
                return num_linea

    return None

# Encontrar el archivo que contiene valor_busqueda
archivo_encontrado = buscar_archivo_con_valor(ruta_base, valor_busqueda)

if archivo_encontrado:
    print(f"Archivo encontrado: {archivo_encontrado}")
    
    # Buscar la variable 'mano' dentro del archivo encontrado
    linea_con_mano = buscar_variable_mano_en_archivo(archivo_encontrado, variable_mano)
    
    if linea_con_mano:
        print(f"La variable '{variable_mano}' se encuentra en la línea {linea_con_mano}.")
    else:
        print(f"No se encontró la variable '{variable_mano}' en el archivo.")
else:
    print(f"No se encontró ningún archivo que contenga '{valor_busqueda}' en la ruta base.")


gamecode_numero = None

# Abrir el archivo y leer línea por línea
with open(archivo_encontrado, 'r') as f:
    lines = f.readlines()

    # Buscar la línea que contiene variable_mano
    for idx, line in enumerate(lines):
        if variable_mano in line:
            # Una vez encontrada la línea, buscar hacia arriba para encontrar gamecode
            for i in range(idx, -1, -1):
                if gamecode_tag in lines[i]:
                    # Extraer el número de gamecode dentro de la línea
                    start_index = lines[i].find(gamecode_tag) + len(gamecode_tag)
                    end_index = lines[i].find('"', start_index)
                    gamecode_numero = lines[i][start_index:end_index]
                    break  # Salir del bucle una vez encontrado

# Mostrar el resultado
if gamecode_numero:
    print(f"Número encontrado en <game gamecode>: {gamecode_numero}")
else:
    print("No se encontró <game gamecode> en el archivo.")


db_sqlite.insertar_mano(torneo, gamecode_numero, mano_db, stacefectivo, p2name, p3name, situacion_db, '<xml>...</xml>', latest_file_3H, '¿Debo hacer all-in?', 0, date.today())



end_time = time.time()

valores_numero_torneo = db_sqlite.buscar_registros_numero_mano_null()



if valores_numero_torneo:
    print("Valores de NUMERO_TORNEO donde NUMERO_MANO es NULL:")

    for mano_id, numero_torneo, mano in valores_numero_torneo:
        print(f"MANO_ID: {mano_id}, NUMERO_TORNEO: {numero_torneo}, MANO: {mano}")
        
        # Buscar el archivo que contiene numero_torneo
        numero_torneo = str(numero_torneo)
        archivo_encontrado = buscar_archivo_con_valor(ruta_base, numero_torneo)
        #time.sleep(1000)
        if archivo_encontrado:
            print(f"Archivo encontrado: {archivo_encontrado}")

            c1 = mano[0]
            p1 = mano[1]
            c2 = mano[2]
            p2 = mano[3]

            if c1 == "T":
                c1 = "10"
            if c2 == "T":
                c2 = "10"

            mano = p1+c1+" "+p2+c2

            # Buscar la variable 'mano' dentro del archivo encontrado
            linea_con_mano = buscar_variable_mano_en_archivo(archivo_encontrado, mano)

            if linea_con_mano:
                print(f"La variable '{mano}' se encuentra en la línea {linea_con_mano}.")
            else:
                print(f"No se encontró la variable '{mano}' en el archivo.")
        else:
            print(f"No se encontró ningún archivo que contenga '{numero_torneo}' en la ruta base.")
            continue  # Saltar al siguiente item si no se encontró el archivo

        gamecode_numero = None

        # Abrir el archivo y leer línea por línea
        with open(archivo_encontrado, 'r') as f:
            lines = f.readlines()

            # Buscar la línea que contiene variable_mano
            for idx, line in enumerate(lines):
                if mano in line:
                    # Buscar hacia arriba para encontrar gamecode
                    for i in range(idx, -1, -1):
                        if gamecode_tag in lines[i]:
                            # Extraer el número de gamecode dentro de la línea
                            start_index = lines[i].find(gamecode_tag) + len(gamecode_tag)
                            end_index = lines[i].find('"', start_index)
                            gamecode_numero = lines[i][start_index:end_index]
                            break  # Salir del bucle una vez encontrado

        # Mostrar el resultado y actualizar la base de datos
        if gamecode_numero:
            print(f"Número encontrado en <game gamecode>: {gamecode_numero}")
            db_sqlite.actualizar_mano(mano_id, NUMERO_MANO=gamecode_numero)
        else:
            print("No se encontró <game gamecode> en el archivo.")





print(f"TIEMPO EJECUCION: {end_time - inicio:.4f} segundos")
#raise ValueError("Un error de ejemplo")  # Esto es solo un ejemplo de error





time.sleep(10)
sys.exit(0)
    

