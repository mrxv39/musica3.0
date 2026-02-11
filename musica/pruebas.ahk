#Include includes\StdOutToVar.ahk

; Ruta al script Python
scriptPath := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\musica\python\mi_script.py"

x1 := "tomaaaaaaaaaaaaaaaaaa"
; Construir el comando con variables como argumentos
cmd := "python """ . scriptPath . """ """ . x1 . """ """ . y1 . """ """ . ancho . """ """ . alto . """ """ . mesa . """ """ . ruta_img_time . """ """ . ruta_img_dealer . """"

; Ejecutar el comando y capturar la salida estándar
output := StdoutToVar_CreateProcess(cmd)

; Verificar si hubo algún error al ejecutar el script Python
If (output = "") {
    MsgBox, Error ejecutando el script Python.
} Else {
    MsgBox, Salida del script Python:`n%output%  ; Muestra la salida capturada del script de Python
}