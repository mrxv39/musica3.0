

; Función para ejecutar un comando y capturar su salida estándar
StdOutToVar(command) {
    p := ComObject("WScript.Shell").Exec(command)
    s := ""
    while !p.StdOut.AtEndOfStream
        s .= p.StdOut.ReadLine()
    return s
}

; Función para ejecutar un script de Python y capturar su salida
RunPythonScript(scriptPath) {
    command := "python " scriptPath
    output := StdOutToVar(command)
    return output
}

; Función para parsear el JSON manualmente
ParseJSON(jsonStr) {
    result := Map()
    
    ; Remover las llaves
    jsonStr := StrReplace(jsonStr, "{", "")
    jsonStr := StrReplace(jsonStr, "}", "")
    
    ; Dividir la cadena en pares clave:valor
    pairs := StrSplit(jsonStr, ",")
    
    for pair in pairs {
        ; Dividir el par en clave y valor
        if InStr(pair, ":") {
            keyVal := StrSplit(pair, ":")
            key := Trim(StrReplace(keyVal[1], '"', ""))
            value := Trim(StrReplace(keyVal[2], '"', ""))
            
            ; Convertir el valor a un número si es posible
            if RegExMatch(value, "^\d+(\.\d+)?$") {
                value := (InStr(value, ".") ? value + 0.0 : value + 0)
            }
            
            ; Asignar la clave y valor al resultado
            result[key] := value
        }
    }
    
    return result
}

ejecutar()
{
	; Ruta del script de Python
	pythonScript := A_ScriptDir "\python\mi_script.py"

	; Verificar si el archivo de script de Python existe
	if !FileExist(pythonScript) {
	    ;MsgBox "Script de Python no encontrado: " pythonScript
	    ExitApp
	}

	; Ejecutar el script de Python y capturar su salida
	output := RunPythonScript(pythonScript)

	; Mostrar la salida capturada
	;MsgBox "Salida capturada: " output

	; Parsear el JSON manualmente desde la salida capturada
	parsedObj := ParseJSON(output)

	; Asignar las variables individuales
	variable1 := parsedObj["variable1"]
	variable2 := parsedObj["variable2"]
	variable3 := parsedObj["variable3"]

	; Mostrar los valores asignados
	;MsgBox("Variable1: " variable1 "`nVariable2: " variable2 "`nVariable3: " variable3)

	resultado := {}
	resultado.variable1 := variable1
	resultado.variable2 := variable2
	resultado.variable3 := variable3
	return resultado

	
}

ejecutar()


/*
{
    "P2_name": "1247191",
    "P2_stack": "25.5",
    "P2_bet": "0.5",
    "P2_dealer": 1,
    "P3_name": "oldcroc",
    "P3_stack": "19",
    "P3_bet": "1",
    "P3_dealer": 1,
    "stackefectivo": "26",
    "bote_grande": "Pot: 1.5",
    "bote": "",
    "p1bet": "",
    "P1_dealer": 0
}
*/