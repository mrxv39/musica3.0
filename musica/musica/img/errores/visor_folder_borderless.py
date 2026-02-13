# visor_folder_borderless.py
# Visor sin bordes para navegar imágenes de LA MISMA carpeta donde está el script.
# Doble click = funciona.
#
# Controles:
#   Left/Right: anterior/siguiente
#   Home/End: primera/última
#   R: recargar carpeta
#   O: mostrar/ocultar overlay (nombre archivo)
#   Drag con botón izquierdo: mueve temporalmente
#   Soltar: vuelve a POS_X,POS_Y
#   Esc: cerrar

import os
import tkinter as tk
from PIL import Image, ImageTk

# ===== CONFIG FIJA =====
POS_X = 520
POS_Y = 807
EXTS = {".bmp", ".png", ".jpg", ".jpeg", ".webp", ".gif", ".tif", ".tiff"}
# =======================

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

def list_images(folder: str):
    files = []
    for name in os.listdir(folder):
        p = os.path.join(folder, name)
        if os.path.isfile(p) and os.path.splitext(name.lower())[1] in EXTS:
            files.append(p)
    files.sort()
    return files

def clamp(n, lo, hi):
    return max(lo, min(hi, n))

images = list_images(BASE_DIR)
if not images:
    raise SystemExit(f"No hay imágenes en: {BASE_DIR}")

state = {
    "images": images,
    "idx": 0,
    "photo": None,
    "overlay": True,
}

root = tk.Tk()
root.overrideredirect(True)
# IMPORTANTE: NO topmost, así otra ventana puede taparlo
# root.attributes("-topmost", True)

canvas = tk.Canvas(root, highlightthickness=0, bd=0)
canvas.pack(fill="both", expand=True)

# ===== DRAG SYSTEM (mover temporalmente) =====
drag = {"x": 0, "y": 0, "moving": False}

def start_move(event):
    drag["moving"] = True
    drag["x"] = event.x
    drag["y"] = event.y

def do_move(event):
    if not drag["moving"]:
        return
    x = root.winfo_x() + (event.x - drag["x"])
    y = root.winfo_y() + (event.y - drag["y"])
    # Mantén el tamaño actual
    w = root.winfo_width()
    h = root.winfo_height()
    root.geometry(f"{w}x{h}+{x}+{y}")

def stop_move(event):
    drag["moving"] = False
    # Al soltar -> vuelve a POS fija manteniendo el tamaño actual (según imagen)
    w = root.winfo_width()
    h = root.winfo_height()
    root.geometry(f"{w}x{h}+{POS_X}+{POS_Y}")

def load_current():
    path = state["images"][state["idx"]]
    img = Image.open(path)

    w, h = img.width, img.height
    root.geometry(f"{w}x{h}+{POS_X}+{POS_Y}")

    state["photo"] = ImageTk.PhotoImage(img)
    canvas.delete("all")
    canvas.create_image(0, 0, anchor="nw", image=state["photo"])

    if state["overlay"]:
        name = os.path.basename(path)
        info = f"{state['idx']+1}/{len(state['images'])}  {name}"
        canvas.create_rectangle(0, 0, w, 26, outline="", fill="black")
        canvas.create_text(6, 13, anchor="w", fill="white", text=info, font=("Segoe UI", 10))

def prev_img(event=None):
    state["idx"] = (state["idx"] - 1) % len(state["images"])
    load_current()

def next_img(event=None):
    state["idx"] = (state["idx"] + 1) % len(state["images"])
    load_current()

def first_img(event=None):
    state["idx"] = 0
    load_current()

def last_img(event=None):
    state["idx"] = len(state["images"]) - 1
    load_current()

def toggle_overlay(event=None):
    state["overlay"] = not state["overlay"]
    load_current()

def reload_folder(event=None):
    new_list = list_images(BASE_DIR)
    if not new_list:
        return
    current_path = state["images"][state["idx"]]
    state["images"] = new_list
    if current_path in new_list:
        state["idx"] = new_list.index(current_path)
    else:
        state["idx"] = clamp(state["idx"], 0, len(new_list) - 1)
    load_current()

def close(event=None):
    root.destroy()

# ===== BINDS =====
root.bind("<Left>", prev_img)
root.bind("<Right>", next_img)
root.bind("<Home>", first_img)
root.bind("<End>", last_img)
root.bind("o", toggle_overlay)
root.bind("O", toggle_overlay)
root.bind("r", reload_folder)
root.bind("R", reload_folder)
root.bind("<Escape>", close)

# Rueda ratón (opcional)
root.bind("<MouseWheel>", lambda e: next_img() if e.delta < 0 else prev_img())

# Drag: en el canvas (toda la superficie)
canvas.bind("<ButtonPress-1>", start_move)
canvas.bind("<B1-Motion>", do_move)
canvas.bind("<ButtonRelease-1>", stop_move)

load_current()
root.mainloop()
