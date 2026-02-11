import tkinter as tk
from PIL import Image, ImageTk
import sys

# Variable global para mantener la referencia a la imagen
global_image = None

def destroy_popup(event=None):
    root.destroy()

def show_image_window(event=None):
    global global_image  # Utilizamos la variable global

    image_window = tk.Toplevel(root)
    image_window.title(root.title())
    image_window.geometry(f'500x500+{posX - 500}+{posY - 600}')

    # Mostrar la imagen redimensionada en la ventana emergente
    resized_image = global_image.resize((500, 500))  # Ajustar el tamaño deseado
    photo = ImageTk.PhotoImage(resized_image)
    label = tk.Label(image_window, image=photo)
    label.image = photo  # Para evitar que la imagen sea eliminada por el recolector de basura
    label.pack()

if __name__ == '__main__':
    posX = int(sys.argv[1]) if len(sys.argv) > 1 else 0
    posY = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    var1 = sys.argv[3] if len(sys.argv) > 3 else "T"
    var2 = sys.argv[4] if len(sys.argv) > 4 else "grey"
    tamanox = int(sys.argv[5]) if len(sys.argv) > 5 else 300
    tamanoy = int(sys.argv[6]) if len(sys.argv) > 6 else 300
    mesa = int(sys.argv[7]) if len(sys.argv) > 7 else 0
    imagen = int(sys.argv[8]) if len(sys.argv) > 8 else 86

    root = tk.Tk()
    root.overrideredirect(True)
    root.configure(bg=var2)
    root.attributes('-topmost', True)
    root.geometry(f'{tamanox}x{tamanoy}+{posX}+{posY}')
    root.title('Mesa:' + str(mesa))

    container1 = tk.Frame(root)
    container1.pack(anchor='w')

    # Cargamos la imagen con la variable global
    image_path = f"img/musica/{imagen}.png"
    image = Image.open(image_path)
    global_image = image

    # Destruir la ventana después de 15 segundos
    root.after(15000, destroy_popup)

    # Enlazamos el evento click para abrir la ventana emergente con la imagen
    root.bind('<Button-1>', show_image_window)

    root.mainloop()



'''
from tkinter import Tk, Button, Toplevel, Label, PhotoImage
import sys

def destroy_button(event=None):
    boton.pack_forget()

def abrir_ventana():
    ventana = Toplevel(root)
    photo = PhotoImage(file=f"img/musica/{imagen}.png")  # Ruta a la imagen
    etiqueta_imagen = Label(ventana, image=photo)
    etiqueta_imagen.image = photo  # Guardar una referencia a la imagen
    etiqueta_imagen.pack()

posX = int(sys.argv[1]) if len(sys.argv) > 1 else 0
posY = int(sys.argv[2]) if len(sys.argv) > 2 else 0
mesa = int(sys.argv[3]) if len(sys.argv) > 3 else 0
imagen = int(sys.argv[4]) if len(sys.argv) > 4 else 0
tamanox = int(sys.argv[5]) if len(sys.argv) > 5 else 100  # Valor por defecto cambiado a 100
tamanoy = int(sys.argv[6]) if len(sys.argv) > 6 else 100  # Valor por defecto cambiado a 100

root = Tk()
root.overrideredirect(True)  # Remueve la barra de título

boton = Button(root, text="T", command=abrir_ventana)
boton.pack()

root.geometry(f'{tamanox}x{tamanoy}+{posX}+{posY}')  # Establecer la geometría de la ventana según las variables
root.title('Mesa:' + str(mesa))  # Establecer el título de la ventana

root.after(10000, destroy_button)  # Eliminar el botón después de 10 segundos

root.mainloop()
'''