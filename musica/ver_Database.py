import db_sqlite
import time

try:
    '''
    tables = db_sqlite.get_all_tables()

    # Imprimir los nombres de las tablas
    print("Tablas en la base de datos:")
    for table in tables:
        print(table[0])
    '''

    print("TABLA PLAYERS")
    # Obtener todos los jugadores de la base de datos
    players = db_sqlite.get_all_players()

    # Verificar si se obtuvieron los registros correctamente
    if players is not None:
        # Iterar sobre los registros y mostrar cada uno en una línea
        for player in players:
            print(player)
    else:
        print("Error al obtener los jugadores de la base de datos.")

    print("TABLA DATOS 3H")
    # Obtener todos los registros de la tabla 3H_HUD
    hud_3h_records = db_sqlite.get_all_3h_hud()

    # Verificar si se obtuvieron los registros correctamente
    if hud_3h_records is not None:
        # Iterar sobre los registros y mostrar cada uno en una línea
        for record in hud_3h_records:
            print(record)
    else:
        print("Error al obtener los registros de 3H_HUD.")

    print("TABLA DATOS HU")
    # Obtener todos los registros de la tabla HU_HUD
    hud_hu_records = db_sqlite.get_all_hu_hud()

    # Verificar si se obtuvieron los registros correctamente
    if hud_hu_records is not None:
        # Iterar sobre los registros y mostrar cada uno en una línea
        for record in hud_hu_records:
            print(record)
    else:
        print("Error al obtener los registros de HU_HUD.")

    print("TABLA MANOS")
    # Obtener todos los registros de MANOS_MARCADAS
    manos_marcadas = db_sqlite.get_all_manos()
    if manos_marcadas:
        print("Registros de MANOS_MARCADAS:")
        for mano in manos_marcadas:
            print(mano)

    print("TABLA NOTAS")
    # Obtener todos los registros de NOTAS_PLAYERS
    notas_players = db_sqlite.get_all_notes()
    if notas_players:
        print("Registros de NOTAS_PLAYERS:")
        for nota in notas_players:
            print(nota)

except Exception as e:
    print(f"Error: {e}")

# Pausa para evitar el cierre inmediato de la ventana de comandos
input("Presiona cualquier tecla para continuar...")
