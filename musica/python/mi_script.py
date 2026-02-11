# mi_script.py
import json
import time
import sys

# Generar algunos datos
datos = {
    'variable1': 42,
    'variable2': 'Hola, mundo!',
    'variable3': 'truco'
}
top = (sys.argv[1])

# Convertir los datos a JSON y imprimirlos
print(json.dumps(datos))
print("Hola desde Python")
print(top)
#time.sleep(1000)  # Pausa durante 5 segundos