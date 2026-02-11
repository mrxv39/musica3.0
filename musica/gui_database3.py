import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk

# Datos de ejemplo para los selectores
opciones = ["Opción 1", "Opción 2", "Opción 3", "Opción 4"]

# Ruta de la imagen a cargar (ajusta esta ruta según la ubicación de tu imagen)
imagen_path = "C:\\Users\\Usuario\\Desktop\\AHK-Studio-master\\Projects\\musica\\img\\PREFLOP\\3H\\BTN\\screenshot_20240628033826207.bmp"

# Función para cargar la imagen
def cargar_imagen():
    imagen = Image.open(imagen_path)
    imagen = ImageTk.PhotoImage(imagen)
    label_imagen.configure(image=imagen)
    label_imagen.image = imagen  # guarda una referencia para evitar que la imagen se elimine

# Crear la ventana principal
root = tk.Tk()
root.title("Visor de Imágenes")

# Frame para contener los filtros
frame_filtros = tk.Frame(root)
frame_filtros.grid(row=0, column=0, padx=10, pady=(10, 0), sticky="ew")  # Padding solo arriba

# Label para los filtros
label_filtros = tk.Label(frame_filtros, text="Filtros:")
label_filtros.grid(row=0, column=0, sticky="w")

# Comboboxes para selección
for i in range(4):
    selector = ttk.Combobox(frame_filtros, values=opciones)
    selector.grid(row=0, column=i+1, padx=5, sticky="ew")

# Entry para la caja de texto
caja_texto = tk.Entry(frame_filtros)
caja_texto.grid(row=0, column=5, padx=5, sticky="ew")

# Frame para contener la tabla de manos
frame_manos = tk.Frame(root)
frame_manos.grid(row=1, column=0, padx=10, pady=10, sticky="nsew")

# Crear el árbol para la tabla de manos
tree = ttk.Treeview(frame_manos, columns=("N_MANO", "MANO", "STACK EFECT", "SITU", "M", "FECHA"), show="headings")
tree.pack(fill=tk.BOTH, expand=True)

# Configurar las columnas
for col in ("N_MANO", "MANO", "STACK EFECT", "SITU", "M", "FECHA"):
    tree.heading(col, text=col)
    tree.column(col, width=100)  # Ajusta el ancho de las columnas según sea necesario

# Insertar datos de ejemplo en la tabla
datos = [
    ("1", "AA", "1000", "Early Position", "10", "2024-06-30"),
    ("2", "KK", "800", "Middle Position", "8", "2024-06-29"),
    ("3", "QQ", "600", "Late Position", "6", "2024-06-28"),
    # Puedes añadir más filas según sea necesario
]

for dato in datos:
    tree.insert("", "end", values=dato)

# Etiqueta para mostrar la imagen cargada
label_imagen = tk.Label(root)
label_imagen.grid(row=0, column=1, rowspan=2, padx=10, pady=10, sticky="nsew")

# Cargar la imagen automáticamente al iniciar la ventana
cargar_imagen()

# Configurar el comportamiento de expansión de las filas y columnas en root
root.grid_rowconfigure(0, weight=1)
root.grid_rowconfigure(1, weight=1)
root.grid_columnconfigure(0, weight=1)
root.grid_columnconfigure(1, weight=1)

# Ejecutar la ventana
root.mainloop()
