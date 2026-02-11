import psutil
import time
import subprocess

def check_memory():
    while True:
        try:
            memory = psutil.virtual_memory()
            available_memory_percentage = memory.available * 100 / memory.total
            print(f"Memoria disponible: {available_memory_percentage:.2f}%")
            
            if available_memory_percentage < 50:
                print("Memoria disponible es menor al 50%. Ejecutando script...")
                subprocess.run(["python", "kill_old_pythonw_processes.py"])
            
            time.sleep(5)
        except Exception as e:
            print(f"Ocurrió un error: {e}")
            break  # Sal del bucle si ocurre un error

if __name__ == "__main__":
    check_memory()
