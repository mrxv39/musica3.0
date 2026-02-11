import tkinter as tk
import sys


def destroy_popup(event=None):
    root.destroy()


def create_label(container, text, font, fg, bg, padx=0):
    if text.strip():
        frame = tk.Frame(container, bg=bg)
        frame.pack(side=tk.LEFT, padx=padx)
        label = tk.Label(frame, text=text, font=font, fg=fg, bg=bg)
        label.pack(anchor='w')
        label.bind('<Button-1>', destroy_popup)


if __name__ == '__main__':
    try:
        posX = int(sys.argv[1]) if len(sys.argv) > 1 else 0
        posY = int(sys.argv[2]) if len(sys.argv) > 2 else 0
        var1 = sys.argv[3] if len(sys.argv) > 3 else ""
        var2 = sys.argv[4] if len(sys.argv) > 4 else ""
        tamanox = int(sys.argv[5]) if len(sys.argv) > 5 else 0
        tamanoy = int(sys.argv[6]) if len(sys.argv) > 6 else 0
        mesa = int(sys.argv[7]) if len(sys.argv) > 7 else 0
        vip = sys.argv[8] if len(sys.argv) > 8 else 0
        pfr = sys.argv[9] if len(sys.argv) > 9 else 0
        bet_3 = sys.argv[10] if len(sys.argv) > 10 else 0

        root = tk.Tk()
        root.overrideredirect(True)
        root.configure(bg=var2)
        root.attributes('-topmost', True)
        root.geometry(f'{tamanox}x{tamanoy}+{posX}+{posY}')
        root.title('hud_p3_3h:' + str(mesa))

        container1 = tk.Frame(root, bg=var2)
        container1.pack(anchor='w')

        create_label(container1, str(vip), ('Arial', 8, 'bold'), 'white', var2, padx=1)
        create_label(container1, str(pfr), ('Arial', 8, 'bold'), 'white', var2, padx=1)
        create_label(container1, str(bet_3), ('Arial', 8, 'bold'), 'orange', var2, padx=2)
        create_label(container1, str(var1), ('Arial', 8, 'bold'), 'white', var2, padx=2)

        # Destruir la ventana después de 15 segundos
        root.after(15000, destroy_popup)

        root.mainloop()
    except Exception as e:
        print(f"Error: {e}")
    finally:
        input("Presiona Enter para cerrar...")
