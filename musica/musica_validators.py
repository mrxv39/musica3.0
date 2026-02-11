import re

def verificar_name(name):
    if name is None:
        return ""
    if not isinstance(name, str):
        raise TypeError("El valor proporcionado no es una cadena de texto")
    name = name.replace(".png", "")
    name = name.replace("  ", "")
    name = name.replace(" ", "")
    name = name.replace("|", "")
    return name

def verificar_stack(stack):
    if stack is None:
        return None
    if isinstance(stack, (int, float)):
        return float(stack)
    if not isinstance(stack, str):
        try:
            stack = str(stack)
        except Exception:
            return None
    if stack == ".":
        stack = "0"
    stack = stack.replace(".0", "0")
    if stack.startswith('.'):
        stack = stack[1:]
    return stack

def verificar_stackefectivo(stackefect):
    if stackefect is None:
        return None
    if isinstance(stackefect, (int, float)):
        return float(stackefect)
    if not isinstance(stackefect, str):
        try:
            stackefect = str(stackefect)
        except Exception:
            return None
    s = stackefect.replace(",", ".")
    if s.endswith('.'):
        s = s[:-1]
    s = s.replace("i", "1")
    s = s.replace(" —", "")
    s_limpio = re.sub(r'[^0-9.]', '', s)
    try:
        val = float(s_limpio)
        return val
    except ValueError:
        return s_limpio if s_limpio else s

def verificar_bet(bet):
    if bet == "05":
        bet = 0.5
    if bet == "1s01s":
        bet = ""
    if bet == "1501":
        bet = ""
    return bet

def verificar_mano(mano, x1, y1, x2, y2, save_img_mesa):
    valid_chars = set('AKQJT23456789HSCD')
    mano = mano.replace("‘rojo", "5rojo")
    mano = mano.replace("©gris", "5S")
    mano = mano.replace("‘gris", "5S")
    mano = mano.replace("gris", "S")
    mano = mano.replace("rojo", "H")
    mano = mano.replace("verde", "C")
    mano = mano.replace("azul", "D")
    mano = mano.replace("0H", "6H")
    mano = mano.replace("MC", "2C")
    mano = mano.replace(")S", "5S")
    mano = mano.replace(".png", "")
    mano = mano.replace("  ", "")
    mano = mano.replace(" ", "")
    mano = mano.replace("|", "")
    return mano
