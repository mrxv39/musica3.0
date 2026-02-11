import psutil
import time
import traceback

def get_process_list():
    process_list = []
    for proc in psutil.process_iter(['pid', 'name']):
        try:
            process_list.append((proc.info['pid'], proc.info['name']))
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    return process_list

def terminate_process(pid):
    try:
        psutil.Process(pid).terminate()
        print(f"Proceso pythonw.exe con PID {pid} terminado correctamente.")
    except psutil.NoSuchProcess:
        pass  # El proceso ya pudo haber sido cerrado por otro motivo
    except psutil.AccessDenied:
        print(f"No se pudo terminar el proceso con PID {pid} - Acceso denegado.")

def log_error(error_message):
    with open("error_log.txt", "a") as log_file:
        log_file.write(error_message + "\n")

def main():
    previous_processes = set()
    iteration_count = 0

    while True:
        try:
            iteration_count += 1
            print(f"Iteración {iteration_count}: obteniendo lista de procesos.")
            
            current_processes = set(get_process_list())
            print(f"Iteración {iteration_count}: lista de procesos obtenida.")

            # Encontrar los procesos pythonw.exe repetidos
            common_pythonw_processes = [(pid, name) for pid, name in current_processes & previous_processes if name == 'pythonw.exe']
            print(f"Iteración {iteration_count}: procesos comunes encontrados.")

            # Cerrar los procesos pythonw.exe repetidos
            for pid, name in common_pythonw_processes:
                print(f"Iteración {iteration_count}: cerrando proceso con PID {pid}.")
                terminate_process(pid)

            # Actualizar la lista de procesos anteriores
            previous_processes = current_processes
            print(f"Iteración {iteration_count}: lista de procesos anteriores actualizada.")

            # Esperar 10 segundos antes de la próxima comprobación
            time.sleep(10)

        except Exception as e:
            # Captura y registra el error
            error_message = f"Error en el bucle principal (iteración {iteration_count}): {str(e)}\n{traceback.format_exc()}"
            print(error_message)  # Mostrar en consola
            log_error(error_message)  # Registrar en archivo de log

            # Esperar unos segundos antes de continuar para evitar bucles rápidos de errores
            time.sleep(30)

if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        # Captura cualquier excepción no manejada que cause la salida del script
        error_message = f"Error crítico fuera del bucle principal: {str(e)}\n{traceback.format_exc()}"
        print(error_message)  # Mostrar en consola
        log_error(error_message)  # Registrar en archivo de log
