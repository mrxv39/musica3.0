# visor_img_borderless.py
# Visor sin bordes arrastrable que vuelve solo a su posicion fija

import tkinter as tk
from PIL import Image, ImageTk

# ===== CONFIGURACION =====
IMG_PATH = r"C:\Users\Usuario\Desktop\projectos\musica3.0\musica\img\errores\MESA2\screenshot_20260213063715683.bmp"
POS_X = 520
POS_Y = 807
WIDTH = 776
HEIGHT = 597
# =========================

root = tk.Tk()

# Ventana sin bordes
root.overrideredirect(True)

# IMPORTANTE:
# quitamos always-on-top para que otras ventanas puedan taparla
# root.attributes("-topmost", True)

# Posicion inicial exacta
root.geometry(f"{WIDTH}x{HEIGHT}+{POS_X}+{POS_Y}")

# ===== CARGAR IMAGEN =====
img = Image.open(IMG_PATH)
img = img.resize((WIDTH, HEIGHT), Image.NEAREST)
photo = ImageTk.PhotoImage(img)

label = tk.Label(root, image=photo, borderwidth=0)
label.pack()

# ===== DRAG SYSTEM =====
drag_data = {"x": 0, "y": 0}

def start_move(event):
    drag_data["x"] = event.x
    drag_data["y"] = event.y

def do_move(event):
    x = root.winfo_x() + (event.x - drag_data["x"])
    y = root.winfo_y() + (event.y - drag_data["y"])
    root.geometry(f"{WIDTH}x{HEIGHT}+{x}+{y}")

def stop_move(event):
    # Cuando sueltas → vuelve a posicion fija
    root.geometry(f"{WIDTH}x{HEIGHT}+{POS_X}+{POS_Y}")

label.bind("<ButtonPress-1>", start_move)
label.bind("<B1-Motion>", do_move)
label.bind("<ButtonRelease-1>", stop_move)

# ESC para cerrar
root.bind("<Escape>", lambda e: root.destroy())

root.mainloop()
