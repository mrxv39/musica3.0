import sqlite3

# Conectar a la base de datos
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Insertar un jugador
cursor.execute('''
    INSERT INTO players (PLAYER_NAME, PLAYER_ALIAS, MANOS_3H, MANOS_HU)
    VALUES (?, ?, ?, ?)
''', ('John Doe', 'Johnny', 100, 200))

# Guardar los cambios
conn.commit()

# Cerrar la conexión
conn.close()