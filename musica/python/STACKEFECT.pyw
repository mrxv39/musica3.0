import sys
import re
from PIL import ImageGrab
import pytesseract

def stackefect(x1, y1, x2, y2, ancho, alto, mesa):

    x1stack = round(x1 + (ancho * 0.28994))
    y1stack = round(y1 + (alto * 0.77051))
    x2stack = round(ancho * 0.117)
    y2stack = round(alto * 0.08375)
    x2stackfoto = x1stack + x2stack
    y2stackfoto = y1stack + y2stack

    #x1stack = x1 + 225
    #y1stack = y1 + 460
    #x2stack = 90
    #y2stack = 50
    #x2stackfoto = x1stack + x2stack
    #y2stackfoto = y1stack + y2stack

    stackvalue = BuscarOCR(x1stack, y1stack, x2stack, y2stack, mesa)
    stackvalue = corregir_valor_decimal(stackvalue)

    stackvalue = stackvalue.replace(",", ".")
    stackvalue = stackvalue.replace(',', '').replace(' ', '')  # Elimina comas y espacios en blanco
    stackvalue = ''.join(char for char in stackvalue if char.isdigit() or char == '.' or char == '-')  # Mantiene solo dígitos, puntos y signo negativo

    if not stackvalue:
        stackvalue = "vacio"

    try:
        stackvalue = float(stackvalue)
    except ValueError:
        sstackvalue = "Error"

    # Guardar el valor en el archivo "stackvalue.txt"
    with open("stackvalue" + str(mesa) + ".txt", "w") as file:
        file.write(str(stackvalue))

    return stackvalue

def BuscarOCR(coordenadaX, coordenadaY, ancho, alto, mesa):
    # Capturar el área de la pantalla
    imagen = ImageGrab.grab((coordenadaX, coordenadaY, coordenadaX + ancho, coordenadaY + alto))

     # Guardar la imagen capturada en un archivo
    # imagen.save(f"imagen_mesa{mesa}.png")

    # Configurar opciones de OCR para reconocer solo números enteros y decimales
    opciones = "--psm 7 tessedit_char_whitelist=0123456789."

    # Realizar OCR en la imagen con las opciones configuradas
    texto_reconocido = pytesseract.image_to_string(imagen, config=opciones)

    # Devolver el texto reconocido
    return texto_reconocido

def corregir_valor_decimal(texto_reconocido):
    texto = texto_reconocido
    texto = texto.replace(",", ".")  # Reemplazar la coma por el punto

    # Buscar valores decimales en el texto utilizando una expresión regular
    patron_decimal = r'\b\d+,\d+\b'
    coincidencias_decimal = re.findall(patron_decimal, texto)

    # Verificar y corregir los valores decimales
    for coincidencia in coincidencias_decimal:
        # Reemplazar la coma decimal por el punto
        texto = texto.replace(coincidencia, coincidencia.replace(',', '.'))

    texto_filtrado = filtrar_numeros(texto)
    return texto_filtrado

def filtrar_numeros(texto):
    # Eliminar todos los caracteres que no sean dígitos, punto decimal o signo negativo
    texto_filtrado = re.sub(r'[^0-9.-]', '', texto)
    return texto_filtrado

# Obtener las variables desde el archivo .bat
x1 = int(sys.argv[1])
y1 = int(sys.argv[2])
x2 = int(sys.argv[3])
y2 = int(sys.argv[4])
ancho = int(sys.argv[5])
alto = int(sys.argv[6])
mesa = int(sys.argv[7])




# Ejecutar la función stackefect
stack_value = stackefect(x1, y1, x2, y2, ancho, alto, mesa)

# Imprimir el valor del stack_value
print("Valor del stack_value:", stack_value)
