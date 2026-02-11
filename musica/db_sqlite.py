import os
import sqlite3

# Obtener la ruta del directorio donde se encuentra este script
ruta_base = os.path.dirname(os.path.abspath(__file__))

def create_table():
    # Conectar a una base de datos (o crear una si no existe)
    ruta_db = os.path.join(ruta_base, 'db_propia.db')
    conn = sqlite3.connect(ruta_db)
    cursor = conn.cursor()
    
    # Crear tabla players
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS players (
            PLAYER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            PLAYER_NAME TEXT NOT NULL UNIQUE,
            PLAYER_ALIAS TEXT UNIQUE,
            MANOS_3H INTEGER DEFAULT 0,
            MANOS_HU INTEGER DEFAULT 0
        )
    ''')
    
    # Crear tabla HUD_3H
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS HUD_3H (
            PLAYER_ID INTEGER,
            VIP INTEGER,
            PFR INTEGER,
            BET_3 INTEGER,
            FOLD_TO_4BET INTEGER,
            FOLD_TO_3BET INTEGER,
            WWSF INTEGER,
            W_AT_SD INTEGER,
            OVERBET_FREQ INTEGER,
            OVERBET_TURN INTEGER,
            OVERBET_RIVER INTEGER,
            FOREIGN KEY (PLAYER_ID) REFERENCES players(PLAYER_ID)
        )
    ''')
    
    # Crear tabla HUD_HU
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS HUD_HU (
            PLAYER_ID INTEGER,
            VIP INTEGER,
            PFR INTEGER,
            BET_3 INTEGER,
            FOLD_TO_4BET INTEGER,
            FOLD_TO_3BET INTEGER,
            WWSF INTEGER,
            W_AT_SD INTEGER,
            OVERBET_FREQ INTEGER,
            OVERBET_TURN INTEGER,
            OVERBET_RIVER INTEGER,
            FOREIGN KEY (PLAYER_ID) REFERENCES players(PLAYER_ID)
        )
    ''')
    
    # Crear tabla MANOS
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS MANOS (
            MANO_ID INTEGER PRIMARY KEY,
            NUMERO_TORNEO INTEGER,
            NUMERO_MANO INTEGER UNIQUE,
            MANO_P1 TEXT,
            STACKEFECTIVO INTEGER,
            PLAYER_NAME_P2 TEXT,
            PLAYER_NAME_P3 TEXT,
            SITUACION TEXT,
            MANO_XML TEXT,
            FOTO_MANO TEXT,
            DUDA_MANO TEXT,
            MARCADA INTEGER,
            FECHA DATE,
            UNIQUE(MANO_ID, NUMERO_MANO)
        )
    ''')
    
    # Crear tabla NOTAS_PLAYERS
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS NOTAS_PLAYERS (
            PLAYER_ID INTEGER,
            NUMERO_TORNEO INTEGER,
            NUMERO_MANO INTEGER,
            NOTA TEXT,
            SITUACION TEXT,
            FECHA DATE,
            FOREIGN KEY (PLAYER_ID) REFERENCES players(PLAYER_ID)
        )
    ''')

    conn.commit()
    conn.close()



def get_all_tables():
    ruta_db = os.path.join(ruta_base, 'db_propia.db')
    conn = sqlite3.connect(ruta_db)
    cursor = conn.cursor()
    
    # Obtener todas las tablas
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()
    
    # Crear un diccionario para almacenar la información de las tablas y columnas
    tables_info = {}
    
    for table in tables:
        table_name = table[0]
        cursor.execute(f"PRAGMA table_info({table_name});")
        columns = cursor.fetchall()
        # Guardar la información de las columnas en el diccionario
        tables_info[table_name] = columns
    
    conn.close()
    
    return tables_info

def insert_player(player_name, player_alias=None, manos_3h=0, manos_hu=0):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO players (PLAYER_NAME, PLAYER_ALIAS, MANOS_3H, MANOS_HU)
            VALUES (?, ?, ?, ?)
        ''', (player_name, player_alias, manos_3h, manos_hu))
        conn.commit()
        print(f'Jugador {player_name} insertado correctamente.')
    except sqlite3.IntegrityError as e:
        print(f'Error al insertar el jugador: {e}')
    conn.close()

def get_manos_3h(player_name):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    cursor.execute('SELECT MANOS_3H FROM players WHERE PLAYER_NAME = ?', (player_name,))
    result = cursor.fetchone()
    conn.close()
    return result[0] if result else "0"

def update_manos_3h(player_name, new_value):
    try:
        conn = sqlite3.connect('db_propia.db')
        cursor = conn.cursor()
        cursor.execute('UPDATE players SET MANOS_3H = ? WHERE PLAYER_NAME = ?', (new_value, player_name))
        conn.commit()  # Guardar los cambios en la base de datos
        conn.close()
        print(f"Se actualizó MANOS_3H para {player_name} a {new_value}")
    except sqlite3.Error as e:
        print(f"Error al actualizar MANOS_3H para {player_name}: {e}")
        

def get_manos_hu(player_name):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    cursor.execute('SELECT MANOS_HU FROM players WHERE PLAYER_NAME = ?', (player_name,))
    result = cursor.fetchone()
    conn.close()
    return result[0] if result else "0"

def update_manos_hu(player_name, new_hands_hu):
    try:
        conn = sqlite3.connect('db_propia.db')
        cursor = conn.cursor()
        
        # Actualizar el número de manos HU del jugador
        cursor.execute('UPDATE players SET MANOS_HU = ? WHERE PLAYER_NAME = ?', (new_hands_hu, player_name))
        
        # Confirmar la actualización
        conn.commit()
        
        # Cerrar la conexión
        conn.close()
        
        print(f"Actualización exitosa: {player_name} ahora tiene {new_hands_hu} manos HU.")
        
    except sqlite3.Error as e:
        print(f"Error al actualizar manos HU para {player_name}: {e}")



def get_player_id(player_name):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    cursor.execute('SELECT PLAYER_ID FROM players WHERE PLAYER_NAME = ?', (player_name,))
    result = cursor.fetchone()
    conn.close()
    return result[0] if result else None


def get_all_players(db_file='db_propia.db'):
    try:
        # Conectar a la base de datos
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        # Ejecutar la consulta para seleccionar todos los registros
        cursor.execute('SELECT * FROM players')
        rows = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Retornar todos los registros obtenidos
        return rows

    except sqlite3.Error as e:
        print(f"Error al obtener jugadores: {e}")
        return None

def insert_3h_hud(player_id, vip, pfr, bet_3, fold_to_4bet, fold_to_3bet, wwsf, w_at_sd, overbet_freq, overbet_turn, overbet_river):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO HUD_3H (PLAYER_ID, VIP, PFR, BET_3, FOLD_TO_4BET, FOLD_TO_3BET, WWSF, W_AT_SD, OVERBET_FREQ, OVERBET_TURN, OVERBET_RIVER)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (player_id, vip, pfr, bet_3, fold_to_4bet, fold_to_3bet, wwsf, w_at_sd, overbet_freq, overbet_turn, overbet_river))
        conn.commit()
        print(f'Datos 3H_HUD insertados correctamente para el jugador con ID {player_id}.')
    except sqlite3.IntegrityError as e:
        print(f'Error al insertar datos 3H_HUD: {e}')
    conn.close()


def insert_hu_hud(player_id, vip, pfr, bet_3, fold_to_4bet, fold_to_3bet, wwsf, w_at_sd, overbet_freq, overbet_turn, overbet_river):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO HUD_HU (PLAYER_ID, VIP, PFR, BET_3, FOLD_TO_4BET, FOLD_TO_3BET, WWSF, W_AT_SD, OVERBET_FREQ, OVERBET_TURN, OVERBET_RIVER)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (player_id, vip, pfr, bet_3, fold_to_4bet, fold_to_3bet, wwsf, w_at_sd, overbet_freq, overbet_turn, overbet_river))
        conn.commit()
        print(f'Datos HU_HUD insertados correctamente para el jugador con ID {player_id}.')
    except sqlite3.IntegrityError as e:
        print(f'Error al insertar datos HU_HUD: {e}')
    conn.close()


def actualizar_tabla_manos(conn, mano_id, numero_torneo, numero_mano, mano_p1, stack_efectivo,
                           player_name_p2, player_name_p3, situacion, mano_xml, foto_mano,
                           duda_mano, marcada, fecha):
    """ 
    Actualiza el registro en la tabla MANOS con el MANO_ID especificado.
    """
    try:
        cursor = conn.cursor()
        sql_query = """
            UPDATE MANOS
            SET NUMERO_TORNEO = ?,
                NUMERO_MANO = ?,
                MANO_P1 = ?,
                STACKEFECTIVO = ?,
                PLAYER_NAME_P2 = ?,
                PLAYER_NAME_P3 = ?,
                SITUACION = ?,
                MANO_XML = ?,
                FOTO_MANO = ?,
                DUDA_MANO = ?,
                MARCADA = ?,
                FECHA = ?
            WHERE MANO_ID = ?
        """
        cursor.execute(sql_query, (numero_torneo, numero_mano, mano_p1, stack_efectivo, player_name_p2,
                                   player_name_p3, situacion, mano_xml, foto_mano, duda_mano, marcada, fecha, mano_id))
        conn.commit()
        print(f"Registro con MANO_ID {mano_id} actualizado correctamente.")
    except Error as e:
        print(e)
    finally:
        if conn:
            conn.close()

def update_hu_hud(player_id, vip=None, pfr=None, bet_3=None, fold_to_4bet=None, fold_to_3bet=None, wwsf=None, w_at_sd=None, overbet_freq=None, overbet_turn=None, overbet_river=None):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        # Construir la consulta de actualización dinámica
        update_fields = []
        update_values = []
        
        if vip is not None:
            update_fields.append("VIP = ?")
            update_values.append(vip)
        if pfr is not None:
            update_fields.append("PFR = ?")
            update_values.append(pfr)
        if bet_3 is not None:
            update_fields.append("3BET = ?")
            update_values.append(bet_3)
        if fold_to_4bet is not None:
            update_fields.append("FOLD_TO_4BET = ?")
            update_values.append(fold_to_4bet)
        if fold_to_3bet is not None:
            update_fields.append("FOLD_TO_3BET = ?")
            update_values.append(fold_to_3bet)
        if wwsf is not None:
            update_fields.append("WWSF = ?")
            update_values.append(wwsf)
        if w_at_sd is not None:
            update_fields.append("W_AT_SD = ?")
            update_values.append(w_at_sd)
        if overbet_freq is not None:
            update_fields.append("OVERBET_FREQ = ?")
            update_values.append(overbet_freq)
        if overbet_turn is not None:
            update_fields.append("OVERBET_TURN = ?")
            update_values.append(overbet_turn)
        if overbet_river is not None:
            update_fields.append("OVERBET_RIVER = ?")
            update_values.append(overbet_river)
        
        update_values.append(player_id)
        
        cursor.execute(f'''
            UPDATE HUD_HU SET {', '.join(update_fields)} WHERE PLAYER_ID = ?
        ''', update_values)
        
        conn.commit()
        print(f'Datos HU_HUD actualizados correctamente para el jugador con ID {player_id}.')
    except sqlite3.Error as e:
        print(f'Error al actualizar datos HU_HUD: {e}')
    conn.close()


def get_all_3h_hud():
    try:
        conn = sqlite3.connect('db_propia.db')
        cursor = conn.cursor()

        # Ejecutar la consulta para seleccionar todos los registros de 3H_HUD
        cursor.execute('SELECT * FROM HUD_3H')
        rows = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Retornar todos los registros obtenidos
        return rows

    except sqlite3.Error as e:
        print(f"Error al obtener datos de 3H_HUD: {e}")
        return None

def get_all_hu_hud():
    try:
        conn = sqlite3.connect('db_propia.db')
        cursor = conn.cursor()

        # Ejecutar la consulta para seleccionar todos los registros de HU_HUD
        cursor.execute('SELECT * FROM HUD_HU')
        rows = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Retornar todos los registros obtenidos
        return rows

    except sqlite3.Error as e:
        print(f"Error al obtener datos de HUD_HU: {e}")
        return None


def get_all_values_by_player_id_as_dict_3h(player_id):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('SELECT * FROM HUD_3H WHERE PLAYER_ID = ?', (player_id,))
        result = cursor.fetchone()
        if result:
            column_names = [description[0] for description in cursor.description]
            return dict(zip(column_names, result))
        else:
            return None
    except sqlite3.Error as e:
        print(f'Error al consultar los valores para el jugador con ID {player_id}: {e}')
        return None
    finally:
        conn.close()


def get_all_values_by_player_id_as_dict_hu(player_id):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('SELECT * FROM HUD_HU WHERE PLAYER_ID = ?', (player_id,))
        result = cursor.fetchone()
        if result:
            column_names = [description[0] for description in cursor.description]
            return dict(zip(column_names, result))
        else:
            return None
    except sqlite3.Error as e:
        print(f'Error al consultar los valores para el jugador con ID {player_id}: {e}')
        return None
    finally:
        conn.close()


def insertar_mano(torneo, gamecode_numero, mano_db, stackefectivo, p2name, p3name, situacion_db, mano_xml, foto_mano, duda_mano, marcada, fecha):
    ruta_db = os.path.join(ruta_base, 'db_propia.db')
    conn = sqlite3.connect(ruta_db)
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO MANOS (NUMERO_TORNEO, NUMERO_MANO, MANO_P1, STACKEFECTIVO, PLAYER_NAME_P2, PLAYER_NAME_P3, SITUACION, MANO_XML, FOTO_MANO, DUDA_MANO, MARCADA, FECHA)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (torneo, gamecode_numero, mano_db, stackefectivo, p2name, p3name, situacion_db, mano_xml, foto_mano, duda_mano, marcada, fecha))
        conn.commit()
        print('Registro insertado correctamente en la tabla MANOS.')
    except sqlite3.IntegrityError as e:
        print(f'Error al insertar registro: {e}')
    conn.close()

def actualizar_mano(mano_id, **kwargs):
    try:
        # Construir la ruta completa a la base de datos
        ruta_db = os.path.join(ruta_base, 'db_propia.db')

        # Conexión a la base de datos
        conn = sqlite3.connect(ruta_db)
        cursor = conn.cursor()

        # Construir la consulta SQL dinámica
        set_clause = ', '.join([f"{key} = ?" for key in kwargs.keys()])
        query = f"UPDATE MANOS SET {set_clause} WHERE MANO_ID = ?"

        # Ejecutar la consulta
        cursor.execute(query, list(kwargs.values()) + [mano_id])
        conn.commit()

        # Cerrar la conexión
        conn.close()

        print(f"Registro con MANO_ID {mano_id} actualizado correctamente.")

    except sqlite3.Error as e:
        print(f"Error SQLite: {e}")


def insert_nota_player(player_id, numero_torneo, numero_mano, nota, situacion, fecha):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO NOTAS_PLAYERS (PLAYER_ID, NUMERO_TORNEO, NUMERO_MANO, NOTA, SITUACION, FECHA)
            VALUES (?, ?, ?, ?, ?, ?)
        ''', (player_id, numero_torneo, numero_mano, nota, situacion, fecha))
        conn.commit()
        print(f'Nota insertada correctamente: Jugador ID {player_id}, Torneo {numero_torneo}, Mano {numero_mano}.')
    except sqlite3.IntegrityError as e:
        print(f'Error al insertar la nota: {e}')
    conn.close()


def update_mano_marcada(numero_torneo, numero_mano, mano_p1=None, stack_p1=None, situacion=None, mano_xml=None, duda_mano=None, fecha=None):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        update_fields = []
        update_values = []
        
        if mano_p1 is not None:
            update_fields.append("MANO_P1 = ?")
            update_values.append(mano_p1)
        if stack_p1 is not None:
            update_fields.append("STACK_P1 = ?")
            update_values.append(stack_p1)
        if situacion is not None:
            update_fields.append("SITUACION = ?")
            update_values.append(situacion)
        if mano_xml is not None:
            update_fields.append("MANO_XML = ?")
            update_values.append(mano_xml)
        if duda_mano is not None:
            update_fields.append("DUDA_MANO = ?")
            update_values.append(duda_mano)
        if fecha is not None:
            update_fields.append("FECHA = ?")
            update_values.append(fecha)
        
        update_values.append(numero_torneo)
        update_values.append(numero_mano)
        
        cursor.execute(f'''
            UPDATE MANOS_MARCADAS SET {', '.join(update_fields)} WHERE NUMERO_TORNEO = ? AND NUMERO_MANO = ?
        ''', update_values)
        
        conn.commit()
        print(f'Registro de MANOS_MARCADAS actualizado correctamente: Torneo {numero_torneo}, Mano {numero_mano}.')
    except sqlite3.Error as e:
        print(f'Error al actualizar el registro de MANOS_MARCADAS: {e}')
    conn.close()


def update_nota_player(player_id, numero_torneo, numero_mano, nota=None, situacion=None, fecha=None):
    conn = sqlite3.connect('db_propia.db')
    cursor = conn.cursor()
    try:
        update_fields = []
        update_values = []
        
        if nota is not None:
            update_fields.append("NOTA = ?")
            update_values.append(nota)
        if situacion is not None:
            update_fields.append("SITUACION = ?")
            update_values.append(situacion)
        if fecha is not None:
            update_fields.append("FECHA = ?")
            update_values.append(fecha)
        
        update_values.append(player_id)
        update_values.append(numero_torneo)
        update_values.append(numero_mano)
        
        cursor.execute(f'''
            UPDATE NOTAS_PLAYERS SET {', '.join(update_fields)} WHERE PLAYER_ID = ? AND NUMERO_TORNEO = ? AND NUMERO_MANO = ?
        ''', update_values)
        
        conn.commit()
        print(f'Registro de NOTAS_PLAYERS actualizado correctamente: Jugador ID {player_id}, Torneo {numero_torneo}, Mano {numero_mano}.')
    except sqlite3.Error as e:
        print(f'Error al actualizar el registro de NOTAS_PLAYERS: {e}')
    conn.close()


def get_all_manos(db_file='db_propia.db'):
    try:
        # Conectar a la base de datos
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        # Ejecutar la consulta para seleccionar todos los registros de MANOS_MARCADAS
        cursor.execute('SELECT * FROM MANOS')
        rows = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Retornar todos los registros obtenidos
        return rows

    except sqlite3.Error as e:
        print(f"Error al obtener datos de MANOS_MARCADAS: {e}")
        return None

def get_all_notes(db_file='db_propia.db'):
    try:
        # Conectar a la base de datos
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        # Ejecutar la consulta para seleccionar todos los registros de NOTAS_PLAYERS
        cursor.execute('SELECT * FROM NOTAS_PLAYERS')
        rows = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Retornar todos los registros obtenidos
        return rows

    except sqlite3.Error as e:
        print(f"Error al obtener datos de NOTAS_PLAYERS: {e}")
        return None



def get_notes_by_player(player_id):
    ruta_db = os.path.join(ruta_base, 'db_propia.db')
    conn = sqlite3.connect(ruta_db)
    cursor = conn.cursor()
    
    cursor.execute('''
        SELECT NUMERO_TORNEO, NUMERO_MANO, NOTA, SITUACION, FECHA
        FROM NOTAS_PLAYERS
        WHERE PLAYER_ID = ?
    ''', (player_id,))
    
    notas = cursor.fetchall()
    
    conn.close()
    
    return notas


def buscar_registros_numero_mano_null():
    try:
        # Construir la ruta completa a la base de datos
        ruta_db = os.path.join(ruta_base, 'db_propia.db')

        # Conexión a la base de datos
        conn = sqlite3.connect(ruta_db)
        cursor = conn.cursor()

        # Consulta para buscar registros donde NUMERO_MANO es NULL
        cursor.execute('''
            SELECT MANO_ID, NUMERO_TORNEO, MANO_P1 FROM MANOS WHERE NUMERO_MANO IS NULL
        ''')

        # Obtener los valores de MANO_ID, NUMERO_TORNEO y MANO_P1 de la consulta
        null_numero_mano_records = cursor.fetchall()

        # Cerrar la conexión
        conn.close()

        # Devolver los valores de MANO_ID, NUMERO_TORNEO y MANO_P1 como una lista de tuplas
        return [(record[0], record[1], record[2]) for record in null_numero_mano_records]

    except sqlite3.Error as e:
        print(f"Error SQLite: {e}")
        return None