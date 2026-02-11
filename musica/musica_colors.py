import webcolors

def safe_name_to_hex(name: str) -> str | None:
    try:
        return webcolors.name_to_hex(name, spec='css3')
    except Exception:
        pass
    return None

def obtener_nombre_color_cercano(rgb_color):
    min_distancia = float('inf')
    nombre_color_cercano = None
    color_names = []
    try:
        color_names = list(webcolors.names(spec='css3'))
    except Exception:
        color_names = [
            "red","green","blue","black","white","gray","yellow","orange","purple","pink","brown"
        ]
    for nombre in color_names:
        try:
            hex_code = webcolors.name_to_hex(nombre, spec='css3')
        except Exception:
            continue
        r_c, g_c, b_c = webcolors.hex_to_rgb(hex_code)
        distancia = (r_c - rgb_color[0])**2 + (g_c - rgb_color[1])**2 + (b_c - rgb_color[2])**2
        if distancia < min_distancia:
            min_distancia = distancia
            nombre_color_cercano = nombre
    return nombre_color_cercano

def obtener_nombre_color(rgb_color):
    try:
        nombre_color = webcolors.rgb_to_name(rgb_color)
    except ValueError:
        nombre_color = obtener_nombre_color_cercano(rgb_color)
    return nombre_color

def categorizar_color(rgb_color):
    categorias_colores = {
        'rojo': ['red', 'firebrick', 'darkred', 'crimson', 'indianred'],
        'verde': ['green', 'darkgreen', 'lime', 'forestgreen', 'seagreen'],
        'azul': ['blue', 'navy', 'royalblue', 'skyblue', 'dodgerblue'],
        'amarillo': ['yellow', 'gold', 'khaki', 'lemonchiffon'],
        'naranja': ['orange', 'darkorange', 'coral', 'tomato'],
        'marron': ['brown', 'saddlebrown', 'chocolate', 'peru'],
        'morado': ['purple', 'indigo', 'darkviolet', 'darkorchid', 'darkmagenta', 'darkslateblue', 'mediumvioletred'],
        'rosa': ['pink', 'lightpink', 'hotpink'],
        'gris': ['gray', 'darkgray', 'dimgray', 'lightgray', 'slategray', 'darkslategray'],
        'negro': ['black'],
        'blanco': ['white', 'snow', 'honeydew', 'mintcream', 'azure', 'aliceblue']
    }
    nombre_color = obtener_nombre_color(rgb_color)
    for categoria, colores in categorias_colores.items():
        if nombre_color in colores:
            return categoria
    return 'desconocido'
