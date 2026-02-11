import os
import tkinter as tk
from tkinter import filedialog, messagebox
import webbrowser

def buscar_archivos_por_texto(directorio, texto):
    archivos_encontrados = []
    for root, _, files in os.walk(directorio):
        for archivo in files:
            if texto in archivo:
                ruta_completa = os.path.join(root, archivo)
                archivos_encontrados.append(ruta_completa)
    return archivos_encontrados

def abrir_archivo(event):
    archivo = event.widget.cget("text")
    try:
        webbrowser.open(archivo)
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo abrir el archivo: {str(e)}")

def buscar():
    directorio = directorio_entry.get()
    texto = texto_entry.get()
    
    if not directorio or not texto:
        messagebox.showwarning("Advertencia", "Por favor, completa ambos campos.")
        return
    
    archivos_encontrados = buscar_archivos_por_texto(directorio, texto)
    
    for widget in resultados_frame.winfo_children():
        widget.destroy()
    
    if archivos_encontrados:
        for archivo in archivos_encontrados:
            label = tk.Label(resultados_frame, text=archivo, fg="blue", cursor="hand2")
            label.pack()
            label.bind("<Button-1>", abrir_archivo)
    else:
        label = tk.Label(resultados_frame, text=f"No se encontraron archivos que contengan '{texto}' en su nombre.")
        label.pack()

def seleccionar_directorio():
    directorio = filedialog.askdirectory()
    if directorio:
        directorio_entry.delete(0, tk.END)
        directorio_entry.insert(0, directorio)

root = tk.Tk()
root.title("Buscar Archivos")

# Frame para la entrada de datos
entrada_frame = tk.Frame(root)
entrada_frame.pack(padx=10, pady=10)

tk.Label(entrada_frame, text="Directorio:").grid(row=0, column=0, padx=5, pady=5)
directorio_entry = tk.Entry(entrada_frame, width=50)
directorio_entry.grid(row=0, column=1, padx=5, pady=5)
tk.Button(entrada_frame, text="Seleccionar", command=seleccionar_directorio).grid(row=0, column=2, padx=5, pady=5)

tk.Label(entrada_frame, text="Texto a buscar:").grid(row=1, column=0, padx=5, pady=5)
texto_entry = tk.Entry(entrada_frame, width=50)
texto_entry.grid(row=1, column=1, padx=5, pady=5)

tk.Button(entrada_frame, text="Buscar", command=buscar).grid(row=2, columnspan=3, pady=10)

# Frame para mostrar los resultados
resultados_frame = tk.Frame(root)
resultados_frame.pack(padx=10, pady=10)

root.mainloop()
