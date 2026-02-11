; Script de AutoHotkey para registrar movimientos y clics del ratón
MsgBox, %A_ScriptDir%
#Persistent
SetTimer, CheckMouse, 100
return

CheckMouse:
CoordMode, Mouse, Screen
MouseGetPos, x, y

; Verifica el estado del botón izquierdo del ratón
if (GetKeyState("LButton", "P"))
{
    FileAppend, %A_Now% - Left Click at (%x%, %y%)`n, %A_ScriptDir%\mouse_log.txt
}
else
{
    FileAppend, %A_Now% - Mouse moved to (%x%, %y%)`n, %A_ScriptDir%\mouse_log.txt
}
return

GetKeyState(key, mode)
{
    return DllCall("GetKeyState", "str", key, "int")
}
