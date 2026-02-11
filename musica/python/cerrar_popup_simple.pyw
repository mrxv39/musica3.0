import pygetwindow as gw
import time
import sys

def close_window(title):
    time.sleep(0.001)  # Esperar un poco para que se pueda abrir la ventana
    try:
        window = gw.getWindowsWithTitle(title)[0]  # Buscar la ventana por su título
        window.close()  # Cerrar la ventana
    except IndexError:
        print(f'No se encontró una ventana con el título "{title}"')

if __name__ == '__main__':
    mesa = sys.argv[1] if len(sys.argv) > 1 else ""
    #mesa = 1
    close_window('Mesa:' + str(mesa))
    close_window('Mesapop:' + str(mesa))
    close_window('mano:' + str(mesa))
    close_window('hud_p2_3h:' + str(mesa))
    close_window('hud_p3_3h:' + str(mesa))

