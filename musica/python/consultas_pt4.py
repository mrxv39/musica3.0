import requests
import time

def get_player_hands(player_name):
    url = "http://localhost:5000/query"
    payload = {"player_name": player_name}
    response = requests.post(url, json=payload)
    if response.status_code == 200:
        data = response.json()
        return data
    else:
        return response.json()

# Ejemplo de uso
player_name = "brrr"
start_time = time.time()
result = get_player_hands(player_name)
print(result)
end_time = time.time()
print(f"ejecutar_busqueda_concurrente: {end_time - start_time:.4f} segundos")