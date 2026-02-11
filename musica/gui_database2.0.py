import tkinter as tk
from tkinter import ttk

# Función para cargar la tabla en content_frame
def cargar_tabla():
    # Limpiar el content_frame antes de cargar la tabla
    for widget in content_frame.winfo_children():
        widget.destroy()

    # Definir las columnas de la tabla
    columnas = ("N_MANO", "MANO", "STACK EFECT", "SITU", "M", "FECHA")
    
    # Crear un frame para la tabla que ocupe el 20% del ancho disponible
    table_frame = tk.Frame(content_frame, width=int(content_frame.winfo_width() * 0.20), bg="white")
    table_frame.pack(side='left', fill='y', expand=False, padx=10, pady=10)
    table_frame.pack_propagate(False)  # Evitar que el frame se redimensione automáticamente

    # Crear la tabla
    tabla = ttk.Treeview(table_frame, columns=columnas, show='headings')

    # Obtener el ancho del frame que contiene la tabla
    tabla_ancho_total = table_frame.winfo_width()

    # Definir los encabezados de las columnas y ajustar el ancho de cada columna
    for col in columnas:
        tabla.heading(col, text=col)
        tabla.column(col, width=int(tabla_ancho_total / len(columnas)))

    # Insertar datos de ejemplo en la tabla
    datos = [
        (1, "Mano 1", 100, "Sit 1", "Sí", "2023-06-30"),
        (2, "Mano 2", 200, "Sit 2", "No", "2023-07-01"),
        # Agrega más filas según sea necesario
    ]
    for dato in datos:
        tabla.insert('', tk.END, values=dato)

    # Empaquetar la tabla en el table_frame
    tabla.pack(fill='both', expand=True)

# Crear la ventana principal
root = tk.Tk()
root.title("Ventana de Tkinter")
root.geometry("1200x800")

# Estilo de los botones
button_style = {
    "font": ("Helvetica", 8),
    "bg": "#4CAF50",
    "fg": "white",
    "activebackground": "#45a049",
    "width": 10,
    "height": 2,
    "relief": "raised",
    "bd": 5
}

# Crear el frame para los botones
button_frame = tk.Frame(root)
button_frame.pack(side='left', padx=20, pady=20, fill='y')  # Posicionar el frame a la izquierda y llenar verticalmente

# Crear los botones dentro del frame
boton_manos = tk.Button(button_frame, text="MANOS", **button_style, command=cargar_tabla)
boton_manos.pack(anchor='w', pady=10)  # Añadir padding entre los botones

boton_players = tk.Button(button_frame, text="PLAYERS", **button_style)
boton_players.pack(anchor='w', pady=10)  # Añadir padding entre los botones

# Crear un frame que ocupe todo el ancho disponible al lado de los botones
content_frame = tk.Frame(root, bg="lightgrey")
content_frame.pack(side='left', fill='both', expand=True, padx=(0, 20), pady=20)  # Ocupar el espacio disponible al lado de los botones

# Función para ajustar el tamaño de las columnas después de que el frame esté completamente cargado
def ajustar_ancho_tabla(event):
    cargar_tabla()

# Bind del evento de redimensionamiento para ajustar la tabla después de que el frame esté completamente cargado
content_frame.bind("<Configure>", ajustar_ancho_tabla)

# Iniciar el loop principal de la aplicación
root.mainloop()
