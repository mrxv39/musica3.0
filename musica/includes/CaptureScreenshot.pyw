import sys
from PIL import ImageGrab
from datetime import datetime
import os
import time

x1, y1, x2, y2 = map(int, sys.argv[1:5])
var1 = sys.argv[5] if len(sys.argv) > 5 else ""

print("daad")

# Imprimir los valores de las variables para verificar
print("x1:", x1)
print("y1:", y1)
print("x2:", x2)
print("y2:", y2)
print("var1:", var1)

ruta_base = os.path.dirname(os.path.abspath(__file__))
print(ruta_base)
timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]
ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'screenshot_{}.bmp'.format(timestamp))
ruta_archivo_txt = os.path.join(ruta_base, 'ruta_y_nombre.txt')

# Crear una cadena con la ruta y el nombre de la imagen
ruta_y_nombre = ruta_completa

# Guardar la cadena en el archivo de texto
with open(ruta_archivo_txt, 'w') as archivo_txt:
    archivo_txt.write(ruta_y_nombre)

# Capturar el screenshot del área especificada
image = ImageGrab.grab(bbox=(x1, y1, x2, y2))

time.sleep(1000)
# Comprobar el valor de var1 y guardar la imagen en la ruta correspondiente
if var1 == "":
    image.save(ruta_completa)
elif var1 == "NO_RECONOCIDA":
    image.save(ruta_completa)
elif var1 == "manual":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'manual', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_OS_HU":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'HU', 'BB', 'BBvsSB_OS', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_MINOR_HU":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'HU', 'BB', 'BBvsSB_MINOR', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_LIMP_HU":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'HU', 'BB', 'BBvsSB_LIMP', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "SB_HU":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'HU', 'SB', 'screenshot_{}.png'.format(timestamp))
elif var1 == "SB_HUvsROL":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'HU', 'SBvsROL', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BTN":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BTN', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "SBvsBB_3H":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'SB', 'SBvsBB', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "SBvsBTN_OR":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'SB', 'SBvsBTN_OR', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsBTN_OS":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsBTN_OS', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_OS_3H":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsSB_OS', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_LIMP_3H":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsSB_LIMP', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_OR_3H":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsSB_OR', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BB_SQZ":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BB_SQZ', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsBTN_LIMP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsBTN_L', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "SB_3Hvs_BTN_LIMP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'SB', 'SBvsBTN_LIMP', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsBTN_MINOR":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsBTN_MINOR', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "SBvsBTN_OS":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'SB', 'SBvsBTN_OS', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)
elif var1 == "BBvsSB_ORx3_3H":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', '3H', 'BB', 'BBvsSB_ORx3', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)

elif var1 == "pushofold":
    image.save(ruta_completa)

elif var1 == "BBvsSB_LIMP_3H_FLOPvs_CBET":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'BBvSB_LP_3H', 'SB_BET', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)

elif var1 == "BBvsSB_LIMP_3H_FLOPvsCHECK":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'BBvSB_LP_3H', 'SB_CHECK', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)

elif var1 == "BBvsBTN_MINOR_3H_FLOP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'BBvsBTN', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)


elif var1 == "SBvsBB_3H_FLOP_LP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'SBvsBB_3H', 'LP', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)

elif var1 == "SBvsBB_3H_FLOP_SRP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'SBvsBB_3H', 'SRP', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)


elif var1 == "SBvsBB_HU_FLOP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'SBvsBB_HU', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)

elif var1 == "BTNvsBB_SRP_FLOP":
    ruta_completa = os.path.join(ruta_base, 'img', 'errores', 'BTNvsBB', 'screenshot_{}.png'.format(timestamp))
    image.save(ruta_completa)



