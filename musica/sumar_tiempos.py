import re

log = """
capture_and_process: 0.1560 segundos
ejecutar_script_captura_screenshot: 0.1330 segundos
capture_and_process: 0.2490 segundos
capture_and_process: 0.2670 segundos
capture_and_process: 0.3010 segundos
capture_and_process: 0.3290 segundos
capture_and_process: 0.3400 segundos
capture_and_process: 0.3520 segundos
capture_and_process: 0.3590 segundos
capture_and_process: 0.3630 segundos
capture_and_process: 0.3740 segundos
capture_and_process: 0.3750 segundos
capture_and_process: 0.3790 segundos
capture_and_process: 0.3780 segundos
capture_and_process: 0.3830 segundos
ejecutar_script_captura_screenshot: 0.1287 segundos
scripts_autohotkey: 0.0020 segundos
capture_and_process: 0.2420 segundos
capture_and_process: 0.2680 segundos
"""

# Expresión regular para encontrar líneas que contienen tiempos en segundos
patron_tiempo_capture = re.compile(r'capture_and_process:\s+(\d+\.\d+)\s+segundos')
patron_tiempo_ejecutar = re.compile(r'ejecutar_script_captura_screenshot:\s+(\d+\.\d+)\s+segundos')

# Buscar y sumar los tiempos de capture_and_process
tiempos_capture = patron_tiempo_capture.findall(log)
tiempos_capture_float = [float(t) for t in tiempos_capture]
suma_tiempos_capture = sum(tiempos_capture_float)

# Buscar y sumar los tiempos de ejecutar_script_captura_screenshot
tiempos_ejecutar = patron_tiempo_ejecutar.findall(log)
tiempos_ejecutar_float = [float(t) for t in tiempos_ejecutar]
suma_tiempos_ejecutar = sum(tiempos_ejecutar_float)

# Imprimir las sumas
print(f"Suma total de tiempos de 'capture_and_process': {suma_tiempos_capture:.4f} segundos")
print(f"Suma total de tiempos de 'ejecutar_script_captura_screenshot': {suma_tiempos_ejecutar:.4f} segundos")