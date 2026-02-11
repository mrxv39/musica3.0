from flask import Flask, jsonify, request, render_template
import sqlite3

app = Flask(__name__)

# Ruta para conectar y obtener los datos de la tabla MANOS con filtros
@app.route('/manos')
def get_manos():
    try:
        conn = sqlite3.connect('db_propia.db')
        cursor = conn.cursor()

        # Construye la consulta SQL base
        sql = 'SELECT NUMERO_TORNEO, NUMERO_MANO, MANO_P1, STACKEFECTIVO, PLAYER_NAME_P2, PLAYER_NAME_P3, SITUACION, MANO_XML, FOTO_MANO, DUDA_MANO, MARCADA, FECHA FROM MANOS'

        # Captura los filtros de la consulta (si se proporcionan)
        filters = []
        for param, value in request.args.items():
            if value:
                filters.append(f"{param}='{value}'")

        # Agrega los filtros a la consulta SQL si hay alguno
        if filters:
            sql += ' WHERE ' + ' AND '.join(filters)

        cursor.execute(sql)
        manos_data = cursor.fetchall()
        conn.close()
        return jsonify(manos_data)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Ruta para la página inicial (raíz)
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
