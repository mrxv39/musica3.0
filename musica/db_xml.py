import os
import sqlite3
import xml.etree.ElementTree as ET
from flask import Flask, render_template, request, jsonify 

app = Flask(__name__)

# Ruta a tu base de datos SQLite
DATABASE = 'poker_session.db'

# Conectar a la base de datos
def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

# Crear tablas session y games (si no existen)
def create_tables():
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS session (
        sessioncode TEXT PRIMARY KEY UNIQUE,
        duration TEXT,
        gamecount INTEGER,
        startdate TEXT,
        nickname TEXT,
        tournamentcode TEXT UNIQUE,
        totalbuyin REAL
    )
    ''')

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS games (
        gamecode TEXT PRIMARY KEY,
        tournamentcode TEXT,
        smallblind INTEGER,
        bigblind INTEGER,
        P2stack REAL,
        P2name TEXT,
        P2dealer INTEGER,
        P3stack REAL,
        P3name TEXT,
        P3dealer INTEGER,
        P1stack REAL,
        P1name TEXT,
        P1dealer INTEGER,
        P2pos TEXT,
        P3pos TEXT,
        P1pos TEXT,
        hand_dealt TEXT,
        P1mano TEXT,
        P2mano TEXT,
        P3mano TEXT,
        flop TEXT,
        turn TEXT,
        river TEXT,
        fecha_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Nueva columna con valor por defecto de fecha actual
        FOREIGN KEY (tournamentcode) REFERENCES session (tournamentcode)
    )
    ''')

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS action (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        gamecode TEXT,
        round_no INTEGER,
        action_no INTEGER,
        action_type INTEGER,
        player TEXT,
        sum REAL,
        accion TEXT,
        ronda TEXT,
        ia_move TEXT DEFAULT '',
        FOREIGN KEY (gamecode) REFERENCES games (gamecode)
    )
    ''')

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS players (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        player_name TEXT,
        player_color INTEGER
    )
    ''')

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS notas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_player INTEGER,
        ronda TEXT,
        nota TEXT,
        fecha_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (id_player) REFERENCES players (id)
    )
    ''')

    conn.commit()
    conn.close()




# Función para obtener el texto de un elemento XML de forma segura

def get_xml_text(element, tag):
    found_element = element.find(tag)
    return found_element.text if found_element is not None else None

# Función para obtener el sessioncode de un elemento XML
def get_session_code(xml_file):
    filename = os.path.splitext(os.path.basename(xml_file))[0]
    return filename

# Ruta base donde se encuentran los archivos XML
ruta_base = r"C:\Program Files (x86)\Casino Barcelona Poker\data\punterdark13\History\Data\Tournaments\pruebas"
ruta_notes = r"C:\Program Files (x86)\Casino Barcelona Poker\data\punterdark13"



def session_tabla(conn, cursor, archivo_path):
    sessioncode = get_session_code(archivo_path)
    if sessioncode is None:
        print(f"No se pudo obtener sessioncode del archivo {archivo_path}.")
        return None
    
    tree = ET.parse(archivo_path)
    root = tree.getroot()

    session_data = root.find('general')
    session_values = (
        sessioncode,
        get_xml_text(session_data, 'duration'),
        get_xml_text(session_data, 'gamecount'),
        get_xml_text(session_data, 'startdate'),
        get_xml_text(session_data, 'nickname'),
        get_xml_text(session_data, 'tournamentcode'),
        get_xml_text(session_data, 'totalbuyin')
    )

    try:
        cursor.execute('''
        INSERT INTO session (sessioncode, duration, gamecount, startdate, nickname, tournamentcode, totalbuyin)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', session_values)
        conn.commit()
    except sqlite3.IntegrityError:
        print(f"La sesión con sessioncode {sessioncode} ya existe en la base de datos.")
    
    # Retornar el tournamentcode obtenido
    return get_xml_text(session_data, 'tournamentcode')



def game_tabla(conn, cursor, game, tournamentcode, startdate):
    gamecode = game.get('gamecode')
    general_data = game.find('general')
    smallblind = get_xml_text(general_data, 'smallblind')
    bigblind = get_xml_text(general_data, 'bigblind')

    players = general_data.find('players').findall('player')

    P2stack = P2name = P2dealer = None
    P3stack = P3name = P3dealer = None
    P1stack = P1name = P1dealer = None
    P2pos = P3pos = P1pos = None

    P1 = None
    P2 = None
    P3 = None

    for idx, player in enumerate(players):
        if player.get('reg_code'):  # Comprueba si 'reg_code' tiene un valor
            P1stack = player.get('chips').replace(',', '')
            P1name = player.get('name')
            P1dealer = player.get('dealer')
            P1 = player
            break

    if len(players) > 1:
        P2 = players[(idx + 1) % len(players)]
        P2stack = P2.get('chips').replace(',', '')
        P2name = P2.get('name')
        P2dealer = P2.get('dealer')
    
    if len(players) > 2:
        P3 = players[(idx + 2) % len(players)]
        P3stack = P3.get('chips').replace(',', '')
        P3name = P3.get('name')
        P3dealer = P3.get('dealer')

    if P2stack is not None and bigblind is not None:
        P2stack = float(P2stack) / float(bigblind.replace(',', ''))
        P2stack = f"{P2stack:.2f}".rstrip('0').rstrip('.') if P2stack % 1 != 0 else str(int(P2stack))
    if P3stack is not None and bigblind is not None:
        P3stack = float(P3stack) / float(bigblind.replace(',', ''))
        P3stack = f"{P3stack:.2f}".rstrip('0').rstrip('.') if P3stack % 1 != 0 else str(int(P3stack))
    if P1stack is not None and bigblind is not None:
        P1stack = float(P1stack) / float(bigblind.replace(',', ''))
        P1stack = f"{P1stack:.2f}".rstrip('0').rstrip('.') if P1stack % 1 != 0 else str(int(P1stack))

    if P1dealer == '1' and P2dealer == '0' and P3dealer == '0':
        P1pos = 'BTN'
        P2pos = 'SB'
        P3pos = 'BB'
    elif P1dealer == '1' and P2dealer == '0' and P3dealer is None:
        P1pos = 'SB'
        P2pos = 'BB'
    elif P1dealer == '1' and P2dealer is None and P3dealer == '0':
        P1pos = 'SB'
        P3pos = 'BB'

    if P2dealer == '1' and P3dealer == '0' and P1dealer == '0':
        P2pos = 'BTN'
        P3pos = 'SB'
        P1pos = 'BB'
    elif P2dealer == '1' and P3dealer == '0' and P1dealer is None:
        P2pos = 'SB'
        P3pos = 'BB'
    elif P2dealer == '1' and P3dealer is None and P1dealer == '0':
        P2pos = 'SB'
        P1pos = 'BB'

    if P3dealer == '1' and P1dealer == '0' and P2dealer == '0':
        P3pos = 'BTN'
        P1pos = 'SB'
        P2pos = 'BB'
    elif P3dealer == '1' and P1dealer == '0' and P2dealer is None:
        P3pos = 'SB'
        P1pos = 'BB'
    elif P3dealer == '1' and P1dealer is None and P2dealer == '0':
        P3pos = 'SB'
        P2pos = 'BB'

    if P1dealer is None or P2dealer is None or P3dealer is None:
        hand_dealt = "HU"  # Heads Up
    else:
        hand_dealt = "3H"  # Three-Handed

    P1mano = P2mano = P3mano = flop = turn = river = "N/A"

    for rnd in game.findall('round'):
        round_no = rnd.get('no')
        if round_no == '1':
            for cards in rnd.findall('cards'):
                if cards.get('type') == 'Pocket' and cards.get('player') == P1name:
                    P1mano = cards.text.strip()
                elif cards.get('type') == 'Pocket' and cards.get('player') == P2name:
                    P2mano = cards.text.strip()
                elif cards.get('type') == 'Pocket' and cards.get('player') == P3name:
                    P3mano = cards.text.strip()
        elif round_no == '2':
            for cards in rnd.findall('cards'):
                if cards.get('type') == 'Flop':
                    flop = cards.text.strip()
        elif round_no == '3':
            for cards in rnd.findall('cards'):
                if cards.get('type') == 'Turn':
                    turn = cards.text.strip()
        elif round_no == '4':
            for cards in rnd.findall('cards'):
                if cards.get('type') == 'River':
                    river = cards.text.strip()

    game_values = (
        gamecode,
        tournamentcode,
        smallblind,
        bigblind,
        P2stack,
        P2name,
        P2dealer,
        P3stack,
        P3name,
        P3dealer,
        P1stack,
        P1name,
        P1dealer,
        P2pos,
        P3pos,
        P1pos,
        hand_dealt,
        P1mano,
        P2mano,
        P3mano,
        flop,
        turn,
        river,
        startdate  # Valor para la columna fecha_add
    )
    
    game_values = tuple(value if value is not None else '' for value in game_values)

    try:
        cursor.execute('''
        INSERT INTO games (gamecode, tournamentcode, smallblind, bigblind, P2stack, P2name, P2dealer, P3stack, P3name, P3dealer, P1stack, P1name, P1dealer, P2pos, P3pos, P1pos, hand_dealt, P1mano, P2mano, P3mano, flop, turn, river, fecha_add)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', game_values)
        conn.commit()
    except sqlite3.IntegrityError:
        print(f"El juego con gamecode {tournamentcode} ya existe en la base de datos.")

    return bigblind

def insert_player(cursor, player_name, player_color):
    try:
        cursor.execute(
            'INSERT INTO player (name, color) VALUES (?, ?)', 
            (player_name, player_color)
        )
        player_id = cursor.lastrowid
        print(f"Jugador insertado: {player_name} con ID: {player_id}")
        return player_id
    except sqlite3.Error as e:
        print(f"Error al insertar en 'player': {e}")
        return None

def insert_note(cursor, player_id, player_note):
    try:
        cursor.execute(
            'INSERT INTO notas (player_id, note) VALUES (?, ?)', 
            (player_id, player_note)
        )
        print(f"Nota insertada para el jugador con ID: {player_id}")
    except sqlite3.Error as e:
        print(f"Error al insertar en 'notas': {e}")

def process_player_notes_xml(ruta_notes):
    conn = get_db_connection()
    cursor = conn.cursor()
    

    for archivo in os.listdir(ruta_notes):
        if archivo.endswith('.xml'):
            archivo_path = os.path.join(ruta_notes, archivo)
            print(f"Procesando archivo: {archivo_path}")

            try:
                tree = ET.parse(archivo_path)
                root = tree.getroot()
            except ET.ParseError as e:
                print(f"Error al parsear el archivo {archivo_path}: {e}")
                continue

            players = root.find('players')
            if players is not None:
                for player in players.findall('player'):
                    nickname = player.find('nickname')
                    note = player.find('note')
                    color = player.find('color')

                    player_name = nickname.text if nickname is not None else 'Unknown'
                    player_note = note.text if note is not None else ''
                    player_color = int(color.text) if color is not None else 0

                    # Insertar el jugador en la tabla player
                    player_id = insert_player(cursor, player_name, player_color)

                    # Insertar la nota en la tabla notas
                    if player_note and player_id:
                        insert_note(cursor, player_id, player_note)

    conn.commit()
    conn.close()

    
def action_tabla(conn, cursor, gamecode, round_no, action_elem, bigblind):
    action_type = action_elem.get('type')
    accion = None
    ronda = None

    if action_type == '0':
        accion = 'FOLD'
    elif action_type == '1':
        accion = 'POSTSB'
    elif action_type == '2':
        accion = 'POSTBB'
    elif action_type == '3':
        accion = 'CALL'
    elif action_type == '4':
        accion = 'CHECK'
    elif action_type == '5':
        accion = 'BET'
    elif action_type == '7':
        accion = 'CALL'
    elif action_type == '23':
        accion = 'RAISE'

    if round_no in ['0']:
        ronda = 'POSTBLINDS'
    elif round_no == '1':
        ronda = 'PREFLOP'
    elif round_no == '2':
        ronda = 'FLOP'
    elif round_no == '3':
        ronda = 'TURN'
    elif round_no == '4':
        ronda = 'RIVER'

    # Calcular la apuesta dividiendo por el bigblind
    # Limpiar bigblind de comas u otros caracteres no numéricos
    if bigblind:
        bigblind = bigblind.replace(',', '').replace('.', '')  # Eliminar comas y puntos

    # Obtener el valor de la apuesta y limpiarlo de comas
    sum_value = action_elem.get('sum').replace(',', '') if action_elem.get('sum') else None

    # Intentar calcular la apuesta dividiendo por el bigblind
    try:
        if bigblind and sum_value is not None:
            bet_value = float(sum_value) / float(bigblind)
            bet_value = round(bet_value, 2)  # Redondear a dos decimales
        else:
            bet_value = None
    except ValueError:
        bet_value = None  # En caso de error de conversión

    # Formatear bet_value como cadena con dos decimales si es válido
    if bet_value is not None:
        bet_value = f"{bet_value:.2f}"

    ia_move = ""

    action_values = (
        gamecode,
        round_no,
        action_elem.get('no'),
        action_type,
        action_elem.get('player'),
        bet_value,
        accion,
        ronda,
        ia_move  # Agregar ia_move al tuple de valores a insertar
    )

    try:
        cursor.execute('''
        INSERT INTO action (gamecode, round_no, action_no, action_type, player, sum, accion, ronda, ia_move)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', action_values)
        conn.commit()
    except sqlite3.IntegrityError:
        print(f"La acción con gamecode {gamecode} y action_no {action_elem.get('no')} ya existe en la base de datos.")



def process_xml_files(ruta_base):
    conn = get_db_connection()
    cursor = conn.cursor()

    for archivo in os.listdir(ruta_base):
        if archivo.endswith('.xml'):
            archivo_path = os.path.join(ruta_base, archivo)
            print(f"Procesando archivo: {archivo_path}")

            # Obtener el tournamentcode y startdate desde la función session_tabla
            tournamentcode = session_tabla(conn, cursor, archivo_path)
            if tournamentcode is None:
                print(f"No se pudo obtener tournamentcode del archivo {archivo}.")
                continue

            cursor.execute('SELECT startdate FROM session WHERE tournamentcode = ?', (tournamentcode,))
            startdate = cursor.fetchone()[0]
            
            # Leer el archivo XML
            try:
                tree = ET.parse(archivo_path)
                root = tree.getroot()
            except ET.ParseError as e:
                print(f"Error al parsear el archivo {archivo_path}: {e}")
                continue

            # Procesar y almacenar datos de juegos
            for game in root.findall('game'):
                gamecode = game.get('gamecode')
                bigblind = game_tabla(conn, cursor, game, tournamentcode, startdate)

                # Procesar y almacenar datos de acciones de juego
                for round_elem in game.findall('round'):
                    round_no = round_elem.get('no')
                    for action_elem in round_elem.findall('action'):
                        # Verificar si la acción ya existe en la base de datos
                        cursor.execute('''
                        SELECT COUNT(*) FROM action 
                        WHERE gamecode = ? AND round_no = ? AND action_no = ?
                        ''', (gamecode, round_no, action_elem.get('no')))

                        if cursor.fetchone()[0] == 0:
                            action_tabla(conn, cursor, gamecode, round_no, action_elem, bigblind)
                        else:
                            print(f"La acción con gamecode {gamecode}, round_no {round_no} y action_no {action_elem.get('no')} ya existe en la base de datos.")
    
    # Cerrar conexión a la base de datos
    conn.close()


create_tables()
#process_player_notes_xml(ruta_notes)
process_xml_files(ruta_base)



# Ruta para la vista principal


# Ruta principal para renderizar el template inicial y manejar las solicitudes POST
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        tag = request.form.get('tag', '').strip().upper()

        if tag == 'BTN':  # Solo ejecutar la consulta si el tag es 'BTN'
            conn = get_db_connection()
            cursor = conn.cursor()

            # Ejecuta la consulta SQL para obtener gamecode donde P1pos = 'BTN'
            cursor.execute('''
                SELECT gamecode FROM games
                WHERE P1pos = 'BTN'
            ''')

            games = cursor.fetchall()

            conn.close()

            # Si se encontraron gamecodes, prepara los datos para devolver como JSON
            if games:
                games_list = [game['gamecode'] for game in games]
                return jsonify({'games': games_list})
            else:
                return jsonify({'message': 'No hay manos'})

    # Si es GET o el tag no es 'BTN', devuelve la página renderizada con todos los datos
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute('SELECT * FROM session')
    sessions = cursor.fetchall()

    cursor.execute('SELECT * FROM games')
    games = cursor.fetchall()

    cursor.execute('SELECT * FROM action')
    actions = cursor.fetchall()

    conn.close()

    return render_template('index.html', sessions=sessions, games=games, actions=actions)

# Ruta para manejar la solicitud de filtrado por tag
@app.route('/filter_games', methods=['POST'])

def filter_games():
    pos = request.json.get('pos', '').strip().upper()
    ronda = request.json.get('ronda', '').strip().upper()
    accion = request.json.get('action', '').strip().upper()
    sum_min = int(request.json.get('sumMin', 0))
    sum_max = int(request.json.get('sumMax', 25))
    percentage_min = int(request.json.get('percentageRangeMin', 0))
    percentage_max = int(request.json.get('percentageRangeMax', 200))

    # Mensajes de depuración para mostrar los datos recibidos
    print("Datos recibidos del formulario:")
    print(f"Posición: {pos}")
    print(f"Ronda: {ronda}")
    print(f"Acción: {accion}")
    print(f"Sum Range: {sum_min} - {sum_max}")
    print(f"Percentage Range: {percentage_min}% - {percentage_max}%")

    valid_pos = ['BTN', 'SB', 'BB']
    valid_rondas = ['PREFLOP', 'FLOP', 'TURN', 'RIVER']
    valid_acciones = ['FOLD', 'CALL', 'RAISE']

    # Verificar que todos los tags son válidos si están presentes
    if (not pos or pos in valid_pos) and (not ronda or ronda in valid_rondas) and (not accion or accion in valid_acciones):
        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            # Consulta para obtener los gamecode de los juegos donde P1pos = pos
            games_query = """
                SELECT * FROM games WHERE P1pos = ?
            """
            cursor.execute(games_query, (pos,))
            games = cursor.fetchall()

            # Obtener los gamecode de los juegos que cumplen con la condición de posición
            gamecodes_games = [game['gamecode'] for game in games]

            # Si no hay juegos que cumplan la condición, devolver respuesta vacía
            if not gamecodes_games:
                return jsonify({'games': [], 'actions': []})

            # Obtener P1name de los juegos
            p1names = [game['P1name'] for game in games]

            # Consulta para obtener las acciones donde ronda = ronda y accion = accion (si están presentes)
            action_conditions = []
            action_params = []

            if ronda:
                action_conditions.append("ronda = ?")
                action_params.append(ronda)

            if accion:
                action_conditions.append("accion = ?")
                action_params.append(accion)

            action_conditions.append("gamecode IN ({})".format(','.join(['?']*len(gamecodes_games))))
            action_params.extend(gamecodes_games)

            action_conditions.append("player = ?")
            action_params.append(p1names[0])  # Suponiendo que todos los juegos tienen el mismo P1name

            if ronda == 'PREFLOP':
                action_conditions.append("sum BETWEEN ? AND ?")
                action_params.extend([sum_min, sum_max])

            actions_query = f"""
                SELECT * FROM action WHERE {' AND '.join(action_conditions)}
            """

            cursor.execute(actions_query, action_params)
            actions = cursor.fetchall()

            # Filtrar los gamecode que están tanto en games como en actions
            action_gamecodes = [action['gamecode'] for action in actions]
            common_gamecodes = set(gamecodes_games).intersection(set(action_gamecodes))

            print("Common gamecodes:", common_gamecodes)

            # Consulta para obtener los detalles de los juegos con los common gamecodes
            games_query = """
                SELECT * FROM games WHERE gamecode IN ({})
            """.format(','.join(['?']*len(common_gamecodes)))

            cursor.execute(games_query, list(common_gamecodes))
            filtered_games = cursor.fetchall()

            # Consulta para obtener las acciones con los common_gamecodes
            actions_query = """
                SELECT * FROM action WHERE gamecode IN ({})
            """.format(','.join(['?']*len(common_gamecodes)))

            cursor.execute(actions_query, list(common_gamecodes))
            filtered_actions = cursor.fetchall()

            # Convertir las filas a diccionarios para poder modificarlas
            filtered_actions = [dict(action) for action in filtered_actions]

            # Calcular el porcentaje de sum respecto al bote total para cada acción
            for action in filtered_actions:
                gamecode = action['gamecode']
                round_no = action['round_no']
                sum_value = action['sum']

                if round_no > 0:
                    # Calcular el bote total hasta esta acción
                    total_pot = sum(a['sum'] for a in filtered_actions if a['gamecode'] == gamecode and a['round_no'] <= round_no)
                    action['percentage'] = (sum_value / total_pot) * 100 if total_pot > 0 else 0
                else:
                    action['percentage'] = 0

            # Filtrar las acciones por el rango de porcentaje
            filtered_actions = [action for action in filtered_actions if percentage_min <= action['percentage'] <= percentage_max]

            # Cerrar la conexión a la base de datos
            conn.close()

            # Preparar la respuesta JSON
            games_list = []
            for game in filtered_games:
                game_dict = {
                    'gamecode': game['gamecode'],
                    'tournamentcode': game['tournamentcode'],
                    'smallblind': game['smallblind'],
                    'bigblind': game['bigblind'],
                    'P2stack': game['P2stack'],
                    'P2name': game['P2name'],
                    'P2dealer': game['P2dealer'],
                    'P3stack': game['P3stack'],
                    'P3name': game['P3name'],
                    'P3dealer': game['P3dealer'],
                    'P1stack': game['P1stack'],
                    'P1name': game['P1name'],
                    'P1dealer': game['P1dealer'],
                    'P2pos': game['P2pos'],
                    'P3pos': game['P3pos'],
                    'P1pos': game['P1pos'],
                    'hand_dealt': game['hand_dealt'],
                    'P1mano': game['P1mano'],
                    'P2mano': game['P2mano'],
                    'P3mano': game['P3mano'],
                    'flop': game['flop'],
                    'turn': game['turn'],
                    'river': game['river']
                }
                games_list.append(game_dict)

            actions_list = []
            for action in filtered_actions:
                action_dict = {
                    'gamecode': action['gamecode'],
                    'round_no': action['round_no'],
                    'player': action['player'],
                    'accion': action['accion'],
                    'sum': action['sum'],
                    'action_no': action['action_no'],
                    'ronda': action['ronda'],
                    'ia_move': action['ia_move'],
                    'percentage': action['percentage']
                }
                actions_list.append(action_dict)

            return jsonify({'games': games_list, 'actions': actions_list})

        except sqlite3.OperationalError as e:
            conn.close()
            return jsonify({'message': f'Error en la consulta SQL: {str(e)}'})

    else:
        return jsonify({'message': 'Uno o más tags especificados no son válidos'})

# Ruta para la página de juegos filtrados
@app.route('/filtered_games')
def filtered_games():
    return render_template('filtered_games.html')
if __name__ == '__main__':
    app.run(debug=True)