import tkinter as tk
from tkinter import ttk, messagebox
import db_sqlite  # Asegúrate de que este archivo esté correctamente configurado
import threading

# Variables globales para almacenar el estado de ordenación actual
current_sort_col_jugadores = None
current_sort_reverse_jugadores = False
current_sort_col_notas = None
current_sort_reverse_notas = False
current_sort_col_manos = None
current_sort_reverse_manos = False

def actualizar_posicion_menus(event=None):
    # Ajustar las coordenadas de los menús en relación con la ventana principal
    x_jugadores = 10  # Distancia desde el borde izquierdo
    y_jugadores = 10  # Distancia desde el borde superior

    x_manos = 170  # Distancia desde el borde izquierdo (espacio adicional para separar los menús)
    y_manos = 10  # Distancia desde el borde superior
    
    # Actualizar la posición de los menús
    notebook.place(x=x_jugadores, y=y_jugadores, width=150, height=500)
    notebook_manos.place(x=x_manos, y=y_manos, width=150, height=500)


def insertar_nota():
    nota = entry_nota.get()
    selected_item = tree_jugadores.focus()
    if selected_item:
        jugador = tree_jugadores.item(selected_item)['values'][0]
        resultado = db_sqlite.insert_nota_player(jugador, nota)
        messagebox.showinfo('Resultado', resultado)
        mostrar_datos_jugador(None)

def actualizar_lista_jugadores(filtro=""):
    for row in tree_jugadores.get_children():
        tree_jugadores.delete(row)
    
    jugadores = db_sqlite.get_all_players()
    
    for jugador in jugadores:
        if filtro.lower() in jugador[1].lower():
            tree_jugadores.insert("", tk.END, values=(jugador[1], jugador[3], jugador[4]))
    
    if current_sort_col_jugadores:
        ordenar_por_columna(tree_jugadores, current_sort_col_jugadores, current_sort_reverse_jugadores)

def actualizar_lista_notas(jugador):
    for row in tree_notas.get_children():
        tree_notas.delete(row)
    
    notas = db_sqlite.get_notes_by_player(jugador)
    
    for nota in notas:
        tree_notas.insert("", tk.END, values=(nota[0], nota[1]))

    if current_sort_col_notas:
        ordenar_por_columna(tree_notas, current_sort_col_notas, current_sort_reverse_notas)

def actualizar_lista_manos():
    try:
        # Limpiar todas las filas existentes en el Treeview
        for row in tree_manos.get_children():
            tree_manos.delete(row)
        
        # Obtener todos los registros de la tabla MANOS
        manos = db_sqlite.get_all_manos()
        
        # Insertar cada registro en el Treeview
        for mano in manos:
            # Insertar solo las columnas deseadas en el orden correcto
            tree_manos.insert("", tk.END, values=(
                mano[1],  # NUMERO_MANO
                mano[2],  # MANO_P1
                mano[3],  # STACKEFECTIVO
                mano[6],  # SITUACION
                mano[10], # MARCADA
                mano[11]  # FECHA
            ))
        
        # Ordenar por la columna NUMERO_MANO de manera predeterminada
        ordenar_por_columna(tree_manos, "NUMERO_MANO", False)
    
    except Exception as e:
        print(f"Error al actualizar lista de manos: {e}")

def ordenar_por_columna(tree, col, reverse):
    data = [(tree.set(child, col), child) for child in tree.get_children('')]

    if col in ['ID', 'Manos 3H', 'Manos HU', 'NUMERO_MANO']:
        data.sort(key=lambda t: (int(t[0]) if t[0].isdigit() else 0), reverse=reverse)
    else:
        data.sort(key=lambda t: t[0].lower(), reverse=reverse)
    
    for index, (val, child) in enumerate(data):
        tree.move(child, '', index)

    tree.heading(col, command=lambda: ordenar_por_columna(tree, col, not reverse))

    if tree == tree_jugadores:
        global current_sort_col_jugadores, current_sort_reverse_jugadores
        current_sort_col_jugadores = col
        current_sort_reverse_jugadores = reverse
    elif tree == tree_notas:
        global current_sort_col_notas, current_sort_reverse_notas
        current_sort_col_notas = col
        current_sort_reverse_notas = reverse
    else:
        global current_sort_col_manos, current_sort_reverse_manos
        current_sort_col_manos = col
        current_sort_reverse_manos = reverse

def actualizar_periodicamente():
    actualizar_lista_jugadores(search_var.get())
    selected_item = tree_jugadores.focus()
    if selected_item:
        mostrar_datos_jugador(None)
    app.after(5000, actualizar_periodicamente)

def iniciar_actualizacion_automatica():
    thread = threading.Thread(target=actualizar_periodicamente)
    thread.daemon = True
    thread.start()

def on_search_var_change(*args):
    filtro = search_var.get()
    actualizar_lista_jugadores(filtro)
    if len(tree_jugadores.get_children()) == 1:
        mostrar_datos_jugador(None)

def mostrar_datos_jugador(event):
    selected_item = tree_jugadores.focus()
    if selected_item:
        jugador = tree_jugadores.item(selected_item)['values'][0]
        
        # Obtener el ID del jugador usando db_sqlite.get_player_id
        player_id = db_sqlite.get_player_id(jugador)
        
        if player_id is not None:
            # Obtener los datos de 3H y HU usando las nuevas funciones
            datos_3h = db_sqlite.get_all_values_by_player_id_as_dict_3h(player_id)
            datos_hu = db_sqlite.get_all_values_by_player_id_as_dict_hu(player_id)
            
            print(f"Datos 3H para jugador {jugador}: {datos_3h}")
            print(f"Datos HU para jugador {jugador}: {datos_hu}")
            
            # Limpiar las tablas antes de insertar nuevos datos
            for row in table_3h.get_children():
                table_3h.delete(row)
            for row in table_hu.get_children():
                table_hu.delete(row)
                
            # Insertar datos en las tablas
            if datos_3h:
                table_3h.insert("", tk.END, values=(datos_3h.get('VIP', '')))
            if datos_hu:
                table_hu.insert("", tk.END, values=(datos_hu.get('VIP', '')))
            
            # Actualizar la lista de notas para el jugador seleccionado
            actualizar_lista_notas(jugador)
        else:
            messagebox.showwarning('Error', f"No se encontró al jugador con nombre {jugador}.")
    else:
        # Limpiar las tablas si no se selecciona ningún jugador
        for row in table_3h.get_children():
            table_3h.delete(row)
        for row in table_hu.get_children():
            table_hu.delete(row)

# Agrega el manejo de excepciones aquí
try:
    # Configuración de la interfaz gráfica
    app = tk.Tk()
    app.title("Gestión de Jugadores y Notas")
    app.geometry("1200x600")

    # Función para posicionar widgets en la esquina superior izquierda
    def colocar_esquina_izquierda(widget):
        widget.pack(side=tk.TOP, padx=10, pady=10, fill=tk.BOTH, expand=True)

    notebook = ttk.Notebook(app)
    notebook.pack(pady=10, expand=True)

    frame_jugadores = ttk.Frame(notebook, width=1200)  # Establece el ancho del frame a 1200 píxeles
    frame_manos = ttk.Frame(notebook, width=1200)  
    
    notebook.add(frame_manos, text='Manos')
    notebook.add(frame_jugadores, text='Jugadores')
    

    # Configuración de la pestaña "Jugadores"
    jugadores_frame = tk.Frame(frame_jugadores)
    #colocar_esquina_izquierda(jugadores_frame)

    tk.Label(jugadores_frame, text="Buscar Jugador por Nombre").grid(row=0, column=0, padx=5, pady=5)
    search_var = tk.StringVar()
    search_var.trace("w", on_search_var_change)
    entry_search = tk.Entry(jugadores_frame, textvariable=search_var)
    entry_search.grid(row=0, column=1, padx=5, pady=5)

    # Configuración del Treeview para jugadores
    tree_frame_jugadores = tk.Frame(frame_jugadores)
    colocar_esquina_izquierda(tree_frame_jugadores)

    tree_scroll_jugadores = tk.Scrollbar(tree_frame_jugadores, orient=tk.VERTICAL)
    tree_scroll_jugadores.pack(side=tk.RIGHT, fill=tk.Y)

    tree_jugadores = ttk.Treeview(tree_frame_jugadores, yscrollcommand=tree_scroll_jugadores.set, selectmode="extended", height=5)
    tree_jugadores.pack(fill=tk.X)
    tree_jugadores.bind("<ButtonRelease-1>", mostrar_datos_jugador)

    tree_scroll_jugadores.config(command=tree_jugadores.yview)

    tree_jugadores['columns'] = ("Nombre", "Manos 3H", "Manos HU")

    tree_jugadores.column("#0", width=0, stretch=tk.NO)
    tree_jugadores.column("Nombre", anchor=tk.W, width=120)
    tree_jugadores.column("Manos 3H", anchor=tk.CENTER, width=80)
    tree_jugadores.column("Manos HU", anchor=tk.CENTER, width=80)

    tree_jugadores.heading("#0", text="", anchor=tk.W)
    tree_jugadores.heading("Nombre", text="Nombre", anchor=tk.W, command=lambda: ordenar_por_columna(tree_jugadores, "Nombre", False))
    tree_jugadores.heading("Manos 3H", text="Manos 3H", anchor=tk.CENTER, command=lambda: ordenar_por_columna(tree_jugadores, "Manos 3H", False))
    tree_jugadores.heading("Manos HU", text="Manos HU", anchor=tk.CENTER, command=lambda: ordenar_por_columna(tree_jugadores, "Manos HU", False))

    # Frame para las tablas 3H y HU
    table_frame = tk.Frame(frame_jugadores)
    colocar_esquina_izquierda(table_frame)

    # Configuración de la tabla para manos 3H
    tk.Label(table_frame, text="Datos 3H").pack()
    table_3h = ttk.Treeview(table_frame, columns=("VIP"), show="headings", height=3)
    table_3h.heading("VIP", text="VIP")
    table_3h.pack(fill=tk.BOTH, expand=True)

    # Configuración de la tabla para manos HU
    tk.Label(table_frame, text="Datos HU").pack()
    table_hu = ttk.Treeview(table_frame, columns=("VIP"), show="headings", height=3)
    table_hu.heading("VIP", text="VIP")
    table_hu.pack(fill=tk.BOTH, expand=True)

    # Configuración del Treeview para notas
    notes_frame = tk.Frame(frame_jugadores)
    colocar_esquina_izquierda(notes_frame)

    tk.Label(notes_frame, text="Nota").pack(pady=5)
    entry_nota = tk.Entry(notes_frame)
    entry_nota.pack(pady=5)
    btn_insertar_nota = tk.Button(notes_frame, text="Insertar Nota", command=insertar_nota)
    btn_insertar_nota.pack(pady=5)

    tree_frame_notas = tk.Frame(notes_frame)
    tree_frame_notas.pack(fill=tk.BOTH, expand=True)

    tree_scroll_notas = tk.Scrollbar(tree_frame_notas)
    tree_scroll_notas.pack(side=tk.RIGHT, fill=tk.Y)

    tree_notas = ttk.Treeview(tree_frame_notas, yscrollcommand=tree_scroll_notas.set, selectmode="extended")
    tree_notas.pack(fill=tk.BOTH, expand=True)

    tree_scroll_notas.config(command=tree_notas.yview)

    tree_notas['columns'] = ("ID", "Nota")

    tree_notas.column("#0", width=0, stretch=tk.NO)
    tree_notas.column("ID", anchor=tk.CENTER, width=80)
    tree_notas.column("Nota", anchor=tk.W, width=400)

    tree_notas.heading("#0", text="", anchor=tk.W)
    tree_notas.heading("ID", text="ID", anchor=tk.CENTER)
    tree_notas.heading("Nota", text="Nota", anchor=tk.W, command=lambda: ordenar_por_columna(tree_notas, "Nota", False))

    # Configuración de la pestaña "Manos"
    tree_frame_manos = tk.Frame(frame_manos)
    colocar_esquina_izquierda(tree_frame_manos)

    tree_scroll_manos = tk.Scrollbar(tree_frame_manos, orient=tk.VERTICAL)
    tree_scroll_manos.pack(side=tk.RIGHT, fill=tk.Y)

    tree_manos = ttk.Treeview(tree_frame_manos, yscrollcommand=tree_scroll_manos.set, selectmode="extended")
    tree_manos.pack(fill=tk.BOTH, expand=True)

    tree_scroll_manos.config(command=tree_manos.yview)

    tree_manos['columns'] = ("NUMERO_MANO", "MANO_P1", "STACKEFECTIVO", "SITUACION", "MARCADA", "FECHA")

    tree_manos.column("#0", width=0, stretch=tk.NO)
    tree_manos.column("NUMERO_MANO", anchor=tk.CENTER, width=80)
    tree_manos.column("MANO_P1", anchor=tk.W, width=100)
    tree_manos.column("STACKEFECTIVO", anchor=tk.W, width=100)
    tree_manos.column("SITUACION", anchor=tk.W, width=100)
    tree_manos.column("MARCADA", anchor=tk.W, width=100)
    tree_manos.column("FECHA", anchor=tk.W, width=100)

    tree_manos.heading("#0", text="", anchor=tk.W)
    tree_manos.heading("NUMERO_MANO", text="NUMERO_MANO", anchor=tk.CENTER, command=lambda: ordenar_por_columna(tree_manos, "NUMERO_MANO", False))
    tree_manos.heading("MANO_P1", text="MANO_P1", anchor=tk.W, command=lambda: ordenar_por_columna(tree_manos, "MANO_P1", False))
    tree_manos.heading("STACKEFECTIVO", text="STACKEFECTIVO", anchor=tk.W, command=lambda: ordenar_por_columna(tree_manos, "STACKEFECTIVO", False))
    tree_manos.heading("SITUACION", text="SITUACION", anchor=tk.W, command=lambda: ordenar_por_columna(tree_manos, "SITUACION", False))
    tree_manos.heading("MARCADA", text="MARCADA", anchor=tk.W, command=lambda: ordenar_por_columna(tree_manos, "MARCADA", False))
    tree_manos.heading("FECHA", text="FECHA", anchor=tk.W, command=lambda: ordenar_por_columna(tree_manos, "FECHA", False))

    # Crea las tablas si no existen
    #db_sqlite.create_table()

    # Actualiza la lista de jugadores, notas y manos al iniciar la aplicación
    actualizar_lista_jugadores()
    actualizar_lista_notas("")
    actualizar_lista_manos()

    # Inicia la actualización automática periódica
    iniciar_actualizacion_automatica()

    app.mainloop()

except Exception as e:
    print(f"Se ha producido un error: {e}")
    input("Pulsa Enter para salir...")
