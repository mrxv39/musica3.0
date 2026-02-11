import time
import sqlite3

inicio = time.time()
# Conectar a la base de datos
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Consultar todos los jugadores
cursor.execute('SELECT * FROM players')
rows = cursor.fetchall()

# Imprimir los resultados
for row in rows:
    print(row)

# Cerrar la conexión
conn.close()
end_time = time.time()
print(f"ejecutar_busqueda_concurrente: {end_time - inicio:.4f} segundos")