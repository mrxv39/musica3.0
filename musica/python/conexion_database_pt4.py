from flask import Flask, request, jsonify
import psycopg2
from psycopg2 import pool
import threading

app = Flask(__name__)

class PostgreSQL:
    def __init__(self, hostname, username, password, database, client_encoding='UTF8'):
        self.hostname = hostname
        self.username = username
        self.password = password
        self.database = database
        self.client_encoding = client_encoding
        self.connection_pool = None
        self.create_pool()

    def create_pool(self):
        try:
            self.connection_pool = psycopg2.pool.SimpleConnectionPool(
                1, 10,  # Min and max connections in the pool
                host=self.hostname,
                user=self.username,
                password=self.password,
                dbname=self.database,
                options=f"-c client_encoding={self.client_encoding}"
            )
            if self.connection_pool:
                print(f"Conexión exitosa a la base de datos {self.database} con pool")
        except psycopg2.Error as e:
            print(f"Error al crear el pool de conexiones para la base de datos {self.database}: {e}")
            raise

    def close_pool(self):
        if self.connection_pool:
            self.connection_pool.closeall()
            print(f"Pool de conexiones cerrado para la base de datos {self.database}")

    def execute_query(self, query, params=None):
        conn = None
        try:
            conn = self.connection_pool.getconn()
            if conn:
                with conn.cursor() as cursor:
                    if params:
                        cursor.execute(query, params)
                    else:
                        cursor.execute(query)
                    return cursor.fetchall()
        except psycopg2.Error as e:
            print(f"Error al ejecutar consulta en la base de datos {self.database}: {e}")
            raise
        finally:
            if conn:
                self.connection_pool.putconn(conn)

db_configs = [
    {
        'dbname': 'PT4_2024_06',
        'user': 'postgres',
        'password': 'dbpass',
        'host': 'localhost',
        'port': 5432,
        'client_encoding': 'LATIN1'
    },
    {
        'dbname': '04.i',
        'user': 'faina',
        'password': 'uoa7PCCqyg',
        'host': '185.23.121.243',
        'port': 5432,
        'client_encoding': 'UTF8'
    },
    {
        'dbname': '05.i',
        'user': 'faina',
        'password': 'uoa7PCCqyg',
        'host': '185.23.121.243',
        'port': 5432,
        'client_encoding': 'UTF8'
    },
    {
        'dbname': '03.i',
        'user': 'faina',
        'password': 'uoa7PCCqyg',
        'host': '185.23.121.243',
        'port': 5432,
        'client_encoding': 'UTF8'
    }
]

connections = {}
for db_config in db_configs:
    conn = PostgreSQL(
        hostname=db_config['host'],
        username=db_config['user'],
        password=db_config['password'],
        database=db_config['dbname'],
        client_encoding=db_config['client_encoding']
    )
    connections[db_config['dbname']] = conn

@app.route('/query', methods=['POST'])
def query():
    data = request.get_json()
    player_name = data.get('player_name')

    def get_player_data(conn, results, index):
        try:
            query_player_id = """
            SELECT id_player
            FROM player
            WHERE player_name = %s
            """
            player_id_result = conn.execute_query(query_player_id, (player_name,))
            if player_id_result:
                id_player = player_id_result[0][0]

                query_cnt_hands_2_players = """
                SELECT SUM(CASE WHEN ts.cnt_players = 2 THEN 1 ELSE 0 END) AS cnt_hands
                FROM tourney_hand_player_statistics thps
                JOIN tourney_summary ts ON thps.id_tourney = ts.id_tourney
                WHERE thps.id_player = %s
                """
                cnt_hands_2_players_result = conn.execute_query(query_cnt_hands_2_players, (id_player,))
                cnt_hands_2_players = cnt_hands_2_players_result[0][0] if cnt_hands_2_players_result else 0

                query_cnt_hands_3_players = """
                SELECT SUM(CASE WHEN ts.cnt_players = 3 THEN 1 ELSE 0 END) AS cnt_hands
                FROM tourney_hand_player_statistics thps
                JOIN tourney_summary ts ON thps.id_tourney = ts.id_tourney
                WHERE thps.id_player = %s
                """
                cnt_hands_3_players_result = conn.execute_query(query_cnt_hands_3_players, (id_player,))
                cnt_hands_3_players = cnt_hands_3_players_result[0][0] if cnt_hands_3_players_result else 0

                results[index] = {
                    "dbname": conn.database,
                    "hands_2_players": cnt_hands_2_players,
                    "hands_3_players": cnt_hands_3_players
                }
            else:
                results[index] = {
                    "dbname": conn.database,
                    "error": "Player not found"
                }
        except Exception as e:
            results[index] = {
                "dbname": conn.database,
                "error": str(e)
            }

    threads = []
    results = [None] * len(connections)
    for index, conn in enumerate(connections.values()):
        thread = threading.Thread(target=get_player_data, args=(conn, results, index))
        thread.start()
        threads.append(thread)

    for thread in threads:
        thread.join()

    return jsonify(results)

if __name__ == '__main__':
    app.run(port=5000)
