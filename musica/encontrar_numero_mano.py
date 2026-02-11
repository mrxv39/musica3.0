import cv2
import numpy as np
import mss
import time
import pytesseract
import db_sqlite
import os
from PIL import Image
import re
from datetime import date

def buscar_archivo_con_valor(ruta_base, valor_busqueda):
    tiempo_inicio = time.time()  # Tiempo de inicio de la búsqueda
    tiempo_limite = 120  # 2 minutos en segundos
    
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
        
        time.sleep(5)  # Esperar 5 segundos antes de volver a buscar
    
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

def main():
    ruta_base = r"C:\Program Files (x86)\Casino Barcelona Poker\data\punterdark13\History\Data\Tournaments"
    
    valores_numero_torneo = db_sqlite.buscar_registros_numero_mano_null()
    
    if valores_numero_torneo:
        print("Valores de NUMERO_TORNEO donde NUMERO_MANO es NULL:")
    
        for mano_id, numero_torneo, mano in valores_numero_torneo:
            print(f"MANO_ID: {mano_id}, NUMERO_TORNEO: {numero_torneo}, MANO: {mano}")
            
            # Buscar el archivo que contiene numero_torneo
            numero_torneo = str(numero_torneo)
            archivo_encontrado = buscar_archivo_con_valor(ruta_base, numero_torneo)
            
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
    
                mano_str = p1 + c1 + " " + p2 + c2
    
                # Buscar la variable 'mano' dentro del archivo encontrado
                linea_con_mano = buscar_variable_mano_en_archivo(archivo_encontrado, mano_str)
    
                if linea_con_mano:
                    print(f"La variable '{mano_str}' se encuentra en la línea {linea_con_mano}.")
                else:
                    print(f"No se encontró la variable '{mano_str}' en el archivo.")
            else:
                print(f"No se encontró ningún archivo que contenga '{numero_torneo}' en la ruta base.")
                continue  # Saltar al siguiente item si no se encontró el archivo
    
            gamecode_numero = None
    
            # Abrir el archivo y leer línea por línea
            if archivo_encontrado:
                with open(archivo_encontrado, 'r') as f:
                    lines = f.readlines()
    
                    # Buscar la línea que contiene variable_mano
                    for idx, line in enumerate(lines):
                        if mano_str in line:
                            # Buscar hacia arriba para encontrar gamecode
                            for i in range(idx, -1, -1):
                                if '<game gamecode="' in lines[i]:
                                    # Extraer el número de gamecode dentro de la línea
                                    start_index = lines[i].find('<game gamecode="') + len('<game gamecode="')
                                    end_index = lines[i].find('"', start_index)
                                    gamecode_numero = lines[i][start_index:end_index]
                                    break  # Salir del bucle una vez encontrado
    
            # Mostrar el resultado y actualizar la base de datos
            if gamecode_numero:
                print(f"Número encontrado en <game gamecode>: {gamecode_numero}")
                db_sqlite.actualizar_mano(mano_id, NUMERO_MANO=gamecode_numero)
                actualizar_tabla_manos(conn, mano_id=1, numero_torneo=123, numero_mano=1,
                               mano_p1="Texto actualizado de la mano", stack_efectivo=150,
                               player_name_p2="Jugador2 actualizado", player_name_p3="Jugador3 actualizado",
                               situacion="Nueva descripción de la situación", mano_xml="<nuevo_xml></nuevo_xml>",
                               foto_mano="ruta/a/nueva_imagen.jpg", duda_mano="Nueva pregunta de duda",
                               marcada=1, fecha="2024-07-03")
            else:
                print("No se encontró <game gamecode> en el archivo.")
    
    input("Presiona Enter para salir...")

if __name__ == "__main__":
    main()
