# visor_img_borderless.py
# Abre una imagen sin bordes en una posicion exacta en pantalla

import tkinter as tk
from PIL import Image, ImageTk

# ===== CONFIGURACION =====
IMG_PATH = r"C:\Users\Usuario\Desktop\projectos\musica3.0\musica\img\errores\MESA2\screenshot_20260213063715683.bmp"   # <-- CAMBIA ESTO
POS_X = 520
POS_Y = 210
WIDTH = 776
HEIGHT = 597
# =========================

root = tk.Tk()

# Quitar bordes reales de ventana
root.overrideredirect(True)

# Siempre encima (opcional)
root.attributes("-topmost", True)

# Posicion EXACTA en pantalla
root.geometry(f"{WIDTH}x{HEIGHT}+{POS_X}+{POS_Y}")

# Cargar imagen SIN escalado
img = Image.open(IMG_PATH)
img = img.resize((WIDTH, HEIGHT), Image.NEAREST)
photo = ImageTk.PhotoImage(img)

label = tk.Label(root, image=photo, borderwidth=0)
label.pack()

# ESC para cerrar
root.bind("<Escape>", lambda e: root.destroy())

root.mainloop()
