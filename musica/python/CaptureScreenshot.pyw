import sys
from PIL import ImageGrab
from datetime import datetime
import os
import time



x1 = int(sys.argv[1])
y1 = int(sys.argv[2])
x2 = int(sys.argv[3])
y2 = int(sys.argv[4])
ruta_y_nombre = sys.argv[5]
var1 = ""


# Imprimir los valores de las variables para verificar
print("x1:", x1)
print("y1:", y1)
print("x2:", x2)
print("y2:", y2)




# Capturar el screenshot del área especificada
image = ImageGrab.grab(bbox=(x1, y1, x2, y2))


# Comprobar el valor de var1 y guardar la imagen en la ruta correspondiente
if var1 == "":
    image.save(ruta_y_nombre)
