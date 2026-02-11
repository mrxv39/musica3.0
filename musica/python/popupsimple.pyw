import tkinter as tk
import sys


def destroy_popup(event=None):
    root.destroy()


def create_label(container, text, font, fg, bg):
    if text.strip():
        label = tk.Label(container, text=text, font=font, fg=fg, bg=bg)
        label.pack(anchor='w')
        label.bind('<Button-1>', destroy_popup)


if __name__ == '__main__':
    posX = int(sys.argv[1]) if len(sys.argv) > 1 else 0
    posY = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    var1 = sys.argv[3] if len(sys.argv) > 3 else ""
    var2 = sys.argv[4] if len(sys.argv) > 4 else ""
    tamanox = int(sys.argv[5]) if len(sys.argv) > 5 else 0
    tamanoy = int(sys.argv[6]) if len(sys.argv) > 6 else 0
    mesa = int(sys.argv[7]) if len(sys.argv) > 7 else 0

    root = tk.Tk()
    root.overrideredirect(True)
    root.configure(bg=var2)
    root.attributes('-topmost', True)
    root.geometry(f'{tamanox}x{tamanoy}+{posX}+{posY}')
    root.title('Mesapop:' + str(mesa))

    container1 = tk.Frame(root)
    container1.pack(anchor='w')

    create_label(container1, var1, ('Arial', 14, 'bold'), 'white', var2)

    # Destruir la ventana después de 15 segundos
    root.after(15000, destroy_popup)

    root.mainloop()
