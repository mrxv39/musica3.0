import psutil
import time
import tkinter as tk
from tkinter import messagebox
from tkinter import ttk

# Lista de procesos críticos de Windows que no deben ser cerrados
CRITICAL_PROCESSES = [
    "System", "winlogon.exe", "csrss.exe", "lsass.exe", "smss.exe",
    "svchost.exe", "explorer.exe", "services.exe", "spoolsv.exe",
    "taskhost.exe", "wininit.exe", "dwm.exe", "audiodg.exe",
    "fontdrvhost.exe", "Registry", "MemCompression"
]

# Lista de procesos que se deben cerrar automáticamente
AUTO_CLOSE_PROCESSES = [
    "AdobeCollabSync.exe", "msedgewebview2.exe", "CalculatorApp.exe",
    "WmiPrvSE.exe", "sihost.exe", "RuntimeBroker.exe", "UserOOBEBroker.exe",
    "tor.exe", "NahimicService.exe", "MsMpEng.exe", "TeamViewer_Service.exe",
    "mongod.exe", "LsaIso.exe"
]

def check_memory(threshold=35):
    mem = psutil.virtual_memory()
    available_percent = (mem.available / mem.total) * 100
    processes_to_close = []

    if available_percent < threshold:
        for proc in psutil.process_iter(['pid', 'name', 'memory_percent']):
            try:
                if proc.info['memory_percent'] > 0 and proc.info['name'] not in CRITICAL_PROCESSES:
                    if proc.info['name'] in AUTO_CLOSE_PROCESSES:
                        try:
                            psutil.Process(proc.info['pid']).terminate()
                            print(f"Proceso {proc.info['name']} con PID {proc.info['pid']} terminado automáticamente.")
                        except psutil.AccessDenied:
                            print(f"No se pudo terminar el proceso {proc.info['name']} con PID {proc.info['pid']} - Acceso denegado.")
                        except psutil.NoSuchProcess:
                            pass  # El proceso ya pudo haber sido cerrado por otro motivo
                    else:
                        processes_to_close.append(proc.info)
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                continue

        return True, available_percent, processes_to_close

    return False, available_percent, []

def show_warning(available_percent, processes_to_close):
    root = tk.Tk()
    root.title("Advertencia de Memoria Baja")
    root.geometry("500x800")

    message = (f"Advertencia: La memoria disponible es menor al 35%. "
               f"Memoria disponible: {available_percent:.2f}%\n"
               "Seleccione los procesos a finalizar (puede copiar el texto si es necesario):")

    label = tk.Label(root, text=message, wraplength=400)
    label.pack(pady=10)

    # Frame para contener los checkboxes con scrollbar
    frame = tk.Frame(root)
    frame.pack(fill=tk.BOTH, expand=True)

    canvas = tk.Canvas(frame)
    scrollbar = ttk.Scrollbar(frame, orient="vertical", command=canvas.yview)
    scrollable_frame = tk.Frame(canvas)

    scrollable_frame.bind(
        "<Configure>",
        lambda e: canvas.configure(
            scrollregion=canvas.bbox("all")
        )
    )

    canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
    canvas.configure(yscrollcommand=scrollbar.set)

    check_vars = []
    entries = []
    for proc in processes_to_close:
        var = tk.BooleanVar()
        frame = tk.Frame(scrollable_frame)
        frame.pack(fill=tk.X)
        check = tk.Checkbutton(frame, text="", variable=var)
        check.pack(side=tk.LEFT)
        entry = tk.Entry(frame, width=80)
        entry.insert(0, f"PID: {proc['pid']} - {proc['name']} - {proc['memory_percent']:.2f}%")
        entry.pack(side=tk.LEFT, fill=tk.X, expand=True)
        entry.configure(state='readonly')
        check_vars.append((proc['pid'], var))
        entries.append(entry)

    canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

    def on_close():
        selected_pids = [pid for pid, var in check_vars if var.get()]
        for pid in selected_pids:
            try:
                psutil.Process(pid).terminate()
                print(f"Proceso con PID {pid} terminado.")
            except psutil.NoSuchProcess:
                pass  # El proceso ya pudo haber sido cerrado por otro motivo
            except psutil.AccessDenied:
                print(f"No se pudo terminar el proceso con PID {pid} - Acceso denegado.")
        root.destroy()

    button = tk.Button(root, text="Finalizar procesos seleccionados", command=on_close)
    button.pack(pady=10)

    root.mainloop()

def main():
    previous_pythonw_processes = set()  # Conjunto para almacenar los procesos pythonw.exe vistos anteriormente

    while True:
        time.sleep(30)  # Espera 10 segundos antes de verificar nuevamente

        # Obtener todos los procesos 'pythonw.exe' en ejecución
        current_pythonw_processes = set()
        for proc in psutil.process_iter(['pid', 'name']):
            if proc.info['name'] == 'pythonw.exe':
                current_pythonw_processes.add((proc.info['pid'], proc.info['name']))

        print("Procesos actuales 'pythonw.exe':")
        for pid, name in current_pythonw_processes:
            print(f"  PID: {pid}, Nombre: {name}")

        print("Procesos previos 'pythonw.exe':")
        for pid, name in previous_pythonw_processes:
            print(f"  PID: {pid}, Nombre: {name}")

        # Verificar si pythonw.exe está presente en dos escaneos consecutivos con el mismo PID
        common_processes = current_pythonw_processes & previous_pythonw_processes
        if common_processes:
            print("Coincidencias entre procesos actuales y previos:")
            for pid, name in common_processes:
                print(f"  PID: {pid}, Nombre: {name}")
                try:
                    psutil.Process(pid).terminate()
                    print(f"Proceso {name} con PID {pid} terminado por estar presente en dos escaneos consecutivos.")
                except psutil.NoSuchProcess:
                    pass  # El proceso ya pudo haber sido cerrado por otro motivo
                except psutil.AccessDenied:
                    print(f"No se pudo terminar el proceso {name} con PID {pid} - Acceso denegado.")
        else:
            print("No hay coincidencias entre procesos actuales y previos.")

        # Actualizar el conjunto de procesos pythonw.exe previos
        previous_pythonw_processes = current_pythonw_processes

        # Comprobar la memoria disponible
        low_memory, available_percent, processes_to_close = check_memory()
        if low_memory:
            show_warning(available_percent, processes_to_close)

if __name__ == "__main__":
    main()
