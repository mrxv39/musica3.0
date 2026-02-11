import psutil
import time
import ctypes
import sys
import os

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def list_and_kill_old_pythonw_processes(threshold_seconds=10):
    current_time = time.time()
    pythonw_processes = [proc for proc in psutil.process_iter(['pid', 'name', 'create_time']) if proc.info['name'] == 'pythonw.exe']

    if len(pythonw_processes) == 0:
        print("No hay procesos 'pythonw.exe' en ejecución.")
        return
    
    for proc in pythonw_processes:
        process_age = current_time - proc.info['create_time']
        if process_age > threshold_seconds:
            try:
                proc.kill()
                print(f"Proceso {proc.info['pid']} cerrado (Tiempo en ejecución: {process_age:.2f} segundos).")
            except psutil.NoSuchProcess:
                print(f"El proceso {proc.info['pid']} ya no existe.")
            except psutil.AccessDenied:
                print(f"No se tiene permiso para cerrar el proceso {proc.info['pid']}.")
            except Exception as e:
                print(f"Error al cerrar el proceso {proc.info['pid']}: {e}")

if __name__ == "__main__":
    if is_admin():
        list_and_kill_old_pythonw_processes()
    else:
        print("El script requiere permisos de administrador. Reintentando...")
        # Re-ejecuta el script con privilegios elevados
        script = os.path.abspath(sys.argv[0])
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, script, None, 1)
