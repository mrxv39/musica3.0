

IsNumber(n) {
    return RegExMatch(n, "^\s*-?\d+(\.\d+)?\s*$")
}

IsStr(s) {p3col
    return !IsNumber(s)
}

poscionclick(elemento, x1t, y1t, anchot, altot)
{


    ;MsgBox, % elemento
	if (elemento = "IPLA")
	{
		
		clickx := Round(x1t+29+(anchot*0.062))
        clicky := Round(y1t+(altot*0.03285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "IIIPLA")
	{
		
		clickx := Round(x1t+29+(anchot*0.174))
        clicky := Round(y1t+(altot*0.03285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "IMU")
	{
		
		clickx := Round(x1t+29+(anchot*0.286))
        clicky := Round(y1t+(altot*0.03285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "IIIMU")
	{
		
		clickx := Round(x1t+29+(anchot*0.4))
        clicky := Round(y1t+(altot*0.03285))
        clicktablas(clickx, clicky)
	}
	if (elemento = "O31")
	{
		
		clickx := Round(x1t+(anchot*0.146))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O32")
	{
		
		clickx := Round(x1t+(anchot*0.372))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O33")
	{
		
		clickx := Round(x1t+(anchot*0.608))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	if (elemento = "O61")
	{
		
		clickx := Round(x1t+(anchot*0.108))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O62")
	{
		
		clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O63")
	{
		
		clickx := Round(x1t+(anchot*0.432))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	if (elemento = "O64")
	{
		
		clickx := Round(x1t+(anchot*0.6))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O65")
	{
		
		clickx := Round(x1t+(anchot*0.76))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "O66")
	{
		
		clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.19714))
        clicktablas(clickx, clicky)
	}
	if (elemento = "F1P1")
	{
		
		clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F1P2")
	{
		
		clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F1P3")
	{
		
		clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}
	if (elemento = "F1P4")
	{
		
		clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F1P5")
	{
		
		clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F1P6")
	{
		
		clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.24285))
        clicktablas(clickx, clicky)
	}

	if (elemento = "F2P1")
	{
		
		clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F2P2")
	{
		
		clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F2P3")
	{
		
		clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}
	if (elemento = "F2P4")
	{
		
		clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F2P5")
	{
		
		clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F2P6")
	{
		
		clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.3))
        clicktablas(clickx, clicky)
	}

	if (elemento = "F3P1")
	{
		
		clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F3P2")
	{
		
		clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F3P3")
	{
		
		clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}
	if (elemento = "F3P4")
	{
		
		clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F3P5")
	{
		
		clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F3P6")
	{
		
		clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.3228))
        clicktablas(clickx, clicky)
	}

	if (elemento = "F4P1")
	{
		
		clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F4P2")
	{
		
		clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F4P3")
	{
		
		clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	if (elemento = "F4P4")
	{
		
		clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F4P5")
	{
		
		clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "F4P6")
	{
		
		clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.3528))
        clicktablas(clickx, clicky)
	}
	


	
}


movimientos(elemento, x1, y1, ancho, alto)
{
	/*
	MsgBox,  % elemento
	
	if (elemento = "ALLIN")
	{
		
		clickx := Round(x1+(ancho*0.9909))
        clicky := Round(y1+(alto*0.8408))
        clicktablas(clickx, clicky)

        clickx := Round(x1+(ancho*0.9394))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        clickx := Round(x1+(ancho*0.8247))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "FOLD")
	{
		
		clickx := Round(x1+(ancho*0.7061))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)
	}
	else if (elemento = "RAISETO")
	{
		;MsgBox, AQUI
		clickx := Round(x1+(ancho*0.9394))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        ;MsgBox,  % x1 y1
        ;MsgBox,  % clickx clicky
	}
	else if (elemento = "CALL")
	{
		;MsgBox, AQUI
		clickx := Round(x1+(ancho*0.8247))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        
        ;MsgBox,  % clickx clicky
        
	}
	;MsgBox,  % clickx clicky elemento
	situacionaqui := "pushofold"

	Run, pythonw CaptureScreenshot.pyw %x1% %y1% 1296 807 %situacionaqui%, , Hide ;toma foto de la mesa
	;MsgBox, % situacionaqui x1 y1
	*/

}

getstackvalue(mesa)
{
	Loop
	{
	    archivo_stackvalue := "stackvalue" mesa ".txt"
	    if (FileExist(archivo_stackvalue))
	    {
	        FileReadLine, stackvalue, %archivo_stackvalue%, 1
	        break  ; Sale del bucle una vez que se encuentra el archivo y se asigna la primera línea
	    }
	    else
	    {
	        Sleep, 1
	    }
	}


	return stackvalue
}

getorvaluep1(mesa, p)
{
    Loop
    {
        archivo_or := "orocr" mesa p ".txt"
        if (FileExist(archivo_or))
        {
            FileReadLine, p1or, %archivo_or%, 1
            break
        }
        else
        {
        	Sleep, 1
    	}
    }

    return p1or
}

getorvaluep2(mesa, p)
{
    Loop
    {
        archivo_or := "orocr" mesa p ".txt"
        if (FileExist(archivo_or))
        {
            FileReadLine, p2or, %archivo_or%, 1
            break
        }
        else
        {
        	Sleep, 1
    	}
    }

    return p2or
}

getorvaluep3(mesa, p)
{
    Loop
    {
        archivo_or := "orocr" mesa p ".txt"
        if (FileExist(archivo_or))
        {
            FileReadLine, p3or, %archivo_or%, 1
            break
        }
        else
        {
        	Sleep, 1
    	}
    }

    return p3or
}

getcartas(mesa)
{
    tiempo_inicial := A_TickCount
    archivo1 := "cartas" mesa ".txt"
    archivo2 := "cartas" mesa ".txt"
    archivo_encontrado := ""

    Loop
    {
        if (FileExist(archivo1))
        {
            archivo_encontrado := archivo1
            break
        }
        else if (FileExist(archivo2))
        {
            archivo_encontrado := archivo2
            break
        }
        else if (A_TickCount - tiempo_inicial >= 2000)  ; Comprueba si ha pasado 1 segundo
        {
            MsgBox, No se encontró ningún archivo en 1 segundo.
            return
        }
        else
        {
            Sleep, 1
        }
    }

    mano := ""
    manos := ""
    
    if (archivo_encontrado != "")
    {
        FileReadLine, mano, %archivo_encontrado%, 1
        FileReadLine, manos, %archivo_encontrado%, 2
        if (InStr(manos, "T") > 0) 
        {
		    FileReadLine, mano, %archivo2%, 1
        	FileReadLine, manos, %archivo2%, 2
		} 
		else 
		{
		

		}
    }

    resultado := {}
    resultado.mano := mano
    resultado.manos := manos

    return resultado
}

getcartasflop(mesa)
{
    tiempo_inicial := A_TickCount
    archivo1 := "cartasflop" mesa ".txt"
    archivo2 := "cartasflop" mesa ".txt"
    archivo_encontrado := ""

    Loop
    {
        if (FileExist(archivo1))
        {
            archivo_encontrado := archivo1
            break
        }
        else if (FileExist(archivo2))
        {
            archivo_encontrado := archivo2
            break
        }
        else if (A_TickCount - tiempo_inicial >= 2000)  ; Comprueba si ha pasado 1 segundo
        {
            MsgBox, No se encontró ningún archivo en 1 segundo.
            return
        }
        else
        {
            Sleep, 1
        }
    }

    flop := ""
    
    if (archivo_encontrado != "")
    {
        FileReadLine, flop, %archivo_encontrado%, 1
       
    }

    ;MsgBox, flop %flop%
    resultadoflop := {}
    resultadoflop.flop := flop

    return resultadoflop
}

posiciones_mesas_tablas()
{
	 archivo_xml := "C:\Users\Usuario\Desktop\placemint\PlaceMint_WindowGroups.config"

	; Abrir el archivo XML
	FileRead, contenido, %archivo_xml%

	if (ErrorLevel) {
	    MsgBox, No se pudo abrir el archivo "%archivo_xml%"
	    return
	}

	; Contar el número de líneas en el archivo
	lineas := StrSplit(contenido, "`n")

	; Obtener el número de líneas
	num_lineas := lineas.Length()

	; Variables para almacenar las líneas coincidentes
	mesa1 := ""
	mesa2 := ""
	mesa3 := ""
	mesa4 := ""

	; Bucle para recorrer cada línea
	for index, linea in lineas {
	    ; Buscar el texto "<shape X" en la línea actual
	    if InStr(linea, "<shape X") {
	        ; Asignar la línea coincidente a la variable correspondiente
	        if (mesa1 = "") {
	            mesa1 := linea
	        } else if (mesa2 = "") {
	            mesa2 := linea
	        } else if (mesa3 = "") {
	            mesa3 := linea
	        } else if (mesa4 = "") {
	            mesa4 := linea
	        }
	    }
	}

	cadena := StrReplace(mesa1, """", "")
	;MsgBox, %mesa1%
	; Ejemplo de cadena de entrada


	; Extraer los valores de los atributos
	regex := "X=(\d+)\s+Y=(\d+)\s+Height=(\d+)\s+Width=(\d+)"
	RegExMatch(cadena, regex, resultados)

	; Asignar los valores a las variables
	mesa1x1 := resultados1
	mesa1y1 := resultados2
	mesa1_alto:= resultados3
	mesa1_ancho := resultados4


	cadena := StrReplace(mesa2, """", "")
	;MsgBox, %mesa1%
	; Ejemplo de cadena de entrada


	; Extraer los valores de los atributos
	regex := "X=(\d+)\s+Y=(\d+)\s+Height=(\d+)\s+Width=(\d+)"
	RegExMatch(cadena, regex, resultados)

	; Asignar los valores a las variables
	mesa2x1 := resultados1
	mesa2y1 := resultados2
	mesa2_alto:= resultados3
	mesa2_ancho := resultados4

	;MsgBox, mesa2x1: %mesa2x1%`nmesa2y1: %mesa2y1%`nmesa2_alto: %mesa2_alto%`nmesa2_ancho: %mesa2_ancho%


	cadena := StrReplace(mesa3, """", "")

	; Extraer los valores de los atributos
	regex := "X=(\d+)\s+Y=(\d+)\s+Height=(\d+)\s+Width=(\d+)"
	RegExMatch(cadena, regex, resultados)

	; Asignar los valores a las variables
	mesa3x1 := resultados1
	mesa3y1 := resultados2
	mesa3_alto := resultados3
	mesa3_ancho := resultados4

	; Imprimir los valores asignados
	;MsgBox, mesa3x1: %mesa3x1%`nmesa3y1: %mesa3y1%`nmesa3_alto: %mesa3_alto%`nmesa3_ancho: %mesa3_ancho%


	cadena := StrReplace(mesa4, """", "")

	; Extraer los valores de los atributos
	regex := "X=(\d+)\s+Y=(\d+)\s+Height=(\d+)\s+Width=(\d+)"
	RegExMatch(cadena, regex, resultados)

	; Asignar los valores a las variables
	mesa4x1 := resultados1
	mesa4y1 := resultados2
	mesa4_alto := resultados3
	mesa4_ancho := resultados4

	; Imprimir los valores asignados
	;MsgBox, mesa4x1: %mesa4x1%`nmesa4y1: %mesa4y1%`nmesa4_alto: %mesa4_alto%`nmesa4_ancho: %mesa4_ancho%



	; Variable para rastrear si se encontró la línea "Mesas_Ipoker"
	; Variable para rastrear si se encontró la línea "Mesas_Ipoker"
	; Variable para rastrear si se encontró la línea "Mesas_Ipoker"
	encontrado_mesas_ipoker := false

	; Variables para almacenar las líneas coincidentes
	tabla1 := ""
	tabla2 := ""
	tabla3 := ""
	tabla4 := ""

	; Bucle para recorrer cada línea
	for index, linea in lineas {
	    ; Buscar la línea que contiene "Mesas_Ipoker"
	    if (encontrado_mesas_ipoker = false && InStr(linea, "Mesas_Ipoker")) {
	        encontrado_mesas_ipoker := true
	    }
	    
	    ; Si se encontró la línea "Mesas_Ipoker", buscar "<shape X" en la línea actual
	    if (encontrado_mesas_ipoker = true && InStr(linea, "<shape X")) {
	        ; Asignar la línea coincidente a la variable correspondiente
	        if (tabla1 = "") {
	            tabla1 := linea
	        } else if (tabla2 = "") {
	            tabla2 := linea
	        } else if (tabla3 = "") {
	            tabla3 := linea
	        } else if (tabla4 = "") {
	            tabla4 := linea
	        }
	    }
	}

	; Eliminar las comillas de las variables
	tabla1 := StrReplace(tabla1, """", "")
	tabla2 := StrReplace(tabla2, """", "")
	tabla3 := StrReplace(tabla3, """", "")
	tabla4 := StrReplace(tabla4, """", "")

	; Extraer los valores de los atributos para tabla1
	regex := "X=(\d+)\s+Y=(\d+)\s+Height=(\d+)\s+Width=(\d+)"
	RegExMatch(tabla1, regex, resultados)

	; Asignar los valores a las variables para tabla1
	tabla1x1 := resultados1
	tabla1y1 := resultados2
	tabla1_ancho := resultados4
	tabla1_alto := resultados3

	; Extraer los valores de los atributos para tabla2
	RegExMatch(tabla2, regex, resultados)

	; Asignar los valores a las variables para tabla2
	tabla2x1 := resultados1
	tabla2y1 := resultados2
	tabla2_ancho := resultados4
	tabla2_alto := resultados3

	; Extraer los valores de los atributos para tabla3
	RegExMatch(tabla3, regex, resultados)

	; Asignar los valores a las variables para tabla3
	tabla3x1 := resultados1
	tabla3y1 := resultados2
	tabla3_ancho := resultados4
	tabla3_alto := resultados3

	; Extraer los valores de los atributos para tabla4
	RegExMatch(tabla4, regex, resultados)

	; Asignar los valores a las variables para tabla4
	tabla4x1 := resultados1
	tabla4y1 := resultados2
	tabla4_ancho := resultados4
	tabla4_alto := resultados3

	; Imprimir los valores asignados para tabla1
	;MsgBox, tabla1x1: %tabla1x1%`ntabla1y1: %tabla1y1%`ntabla1_ancho: %tabla1_ancho%`ntabla1_alto: %tabla1_alto%

	; Imprimir los valores asignados para tabla2
	;MsgBox, tabla2x1: %tabla2x1%`ntabla2y1: %tabla2y1%`ntabla2_ancho: %tabla2_ancho%`ntabla2_alto: %tabla2_alto%

	; Imprimir los valores asignados para tabla3
	;MsgBox, tabla3x1: %tabla3x1%`ntabla3y1: %tabla3y1%`ntabla3_ancho: %tabla3_ancho%`ntabla3_alto: %tabla3_alto%

	; Imprimir los valores asignados para tabla4
	;MsgBox, tabla4x1: %tabla4x1%`ntabla4y1: %tabla4y1%`ntabla4_ancho: %tabla4_ancho%`ntabla4_alto: %tabla4_alto%

	; Retornar las variables calculadas
    ; Crear el objeto resultado y asignar los valores a las variables correspondientes
    resultado := {}
    resultado.mesa1x1 := mesa1x1
    resultado.mesa1y1 := mesa1y1
    resultado.mesa1_alto := mesa1_alto
    resultado.mesa1_ancho := mesa1_ancho
    resultado.mesa2x1 := mesa2x1
    resultado.mesa2y1 := mesa2y1
    resultado.mesa2_alto := mesa2_alto
    resultado.mesa2_ancho := mesa2_ancho
    resultado.mesa3x1 := mesa3x1
    resultado.mesa3y1 := mesa3y1
    resultado.mesa3_alto := mesa3_alto
    resultado.mesa3_ancho := mesa3_ancho
    resultado.mesa4x1 := mesa4x1
    resultado.mesa4y1 := mesa4y1
    resultado.mesa4_alto := mesa4_alto
    resultado.mesa4_ancho := mesa4_ancho
    resultado.tabla1x1 := tabla1x1
    resultado.tabla1y1 := tabla1y1
    resultado.tabla1_alto := tabla1_alto
    resultado.tabla1_ancho := tabla1_ancho
    resultado.tabla2x1 := tabla2x1
    resultado.tabla2y1 := tabla2y1
    resultado.tabla2_alto := tabla2_alto
    resultado.tabla2_ancho := tabla2_ancho
    resultado.tabla3x1 := tabla3x1
    resultado.tabla3y1 := tabla3y1
    resultado.tabla3_alto := tabla3_alto
    resultado.tabla3_ancho := tabla3_ancho
    resultado.tabla4x1 := tabla4x1
    resultado.tabla4y1 := tabla4y1
    resultado.tabla4_alto := tabla4_alto
    resultado.tabla4_ancho := tabla4_ancho

    ; Retornar el objeto resultado
    return resultado
}




clicktablas(xclic,yclic)
{
	startTime := A_TickCount  ; Guardar el tiempo de inicio antes del bucle

	Loop  ; Bucle indefinido
	{
	    If !FileExist("bloqueo.txt")  ; Si el archivo de bloqueo no existe...
	    {
	        Break  ; ... romper el ciclo
	    }
	    Sleep, 100  ; Esperar 100 ms antes de comprobar de nuevo

	    If (A_TickCount - startTime >= 2000)  ; Si ha transcurrido 2 segundos (2000 ms)
	    {
	        ;MsgBox, Se alcanzó el tiempo máximo de espera. Saliendo del bucle.
	        Break  ; Salir del bucle
	    }
	}
	FileAppend, , bloqueo.txt  ; Crear el archivo de bloqueo



	
	CoordMode,Mouse,Screen



	; Bloquear los clics del ratón
	;DllCall("BlockInput", "int", 1)

	; Aquí puedes realizar tus acciones o ejecutar tu script

	
	BlockInput, MouseMove ; Bloquear el movimiento del ratón

	
	MouseGetPos, originalX, originalY ; Guardar las coordenadas originales del cursor
	SetMouseDelay, 0

	Click, %xclic%, %yclic%
	MouseMove, %originalX%, %originalY% ; Mover el cursor a las coordenadas originales
	; Desbloquear el ratón
	BlockInput, MouseMoveOff ; Desbloquear el movimiento del ratón
	; Desbloquear los clics del ratón
	;DllCall("BlockInput", "int", 0)

	FileDelete, bloqueo.txt  ; Eliminar el archivo de bloqueo al finalizar


}




nashpush(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  20
	manosPoker["KKo"] :=  20
	manosPoker["QQo"] :=  20
	manosPoker["JJo"] :=  20
	manosPoker["TTo"] :=  20
	manosPoker["99o"] :=  20
	manosPoker["88o"] :=  20
	manosPoker["77o"] :=  20
	manosPoker["66o"] :=  20
	manosPoker["55o"] :=  20
	manosPoker["44o"] :=  20
	manosPoker["33o"] :=  20
	manosPoker["22o"] :=  20
	manosPoker["AKs"] :=  20	
	manosPoker["AQs"] :=  20	
	manosPoker["AJs"] :=  20
	manosPoker["ATs"] :=  20
	manosPoker["A9s"] :=  20
	manosPoker["A8s"] :=  20
	manosPoker["A7s"] :=  20
	manosPoker["A6s"] :=  20
	manosPoker["A5s"] :=  20
	manosPoker["A4s"] :=  20
	manosPoker["A3s"] :=  20
	manosPoker["A2s"] :=  20
	manosPoker["AKo"] :=  20	
	manosPoker["AQo"] :=  20	
	manosPoker["AJo"] :=  20
	manosPoker["ATo"] :=  20
	manosPoker["A9o"] :=  20
	manosPoker["A8o"] :=  20
	manosPoker["A7o"] :=  20
	manosPoker["A6o"] :=  20
	manosPoker["A5o"] :=  20
	manosPoker["A4o"] :=  20
	manosPoker["A3o"] :=  20
	manosPoker["A2o"] :=  20	
	manosPoker["KQs"] :=  20
	manosPoker["KJs"] :=  20
	manosPoker["KTs"] :=  20
	manosPoker["K9s"] :=  20
	manosPoker["K8s"] :=  20
	manosPoker["K7s"] :=  20
	manosPoker["K6s"] :=  20
	manosPoker["K5s"] :=  20
	manosPoker["K4s"] :=  20
	manosPoker["K3s"] :=  19.9
	manosPoker["K2s"] :=  19.3
	manosPoker["KQo"] :=  20
	manosPoker["KJo"] :=  20
	manosPoker["KTo"] :=  20
	manosPoker["K9o"] :=  20
	manosPoker["K8o"] :=  18
	manosPoker["K7o"] :=  16.1
	manosPoker["K6o"] :=  15.1
	manosPoker["K5o"] :=  14.2
	manosPoker["K4o"] :=  13.1
	manosPoker["K3o"] :=  12.2
	manosPoker["K2o"] :=  11.6	
	manosPoker["QJs"] :=  20
	manosPoker["QTs"] :=  20
	manosPoker["Q9s"] :=  20
	manosPoker["Q8s"] :=  20
	manosPoker["Q7s"] :=  20
	manosPoker["Q6s"] :=  20
	manosPoker["Q5s"] :=  15
	manosPoker["Q4s"] :=  16.3
	manosPoker["Q3s"] :=  13.5
	manosPoker["Q2s"] :=  12.7
	manosPoker["QJo"] :=  20
	manosPoker["QTo"] :=  20
	manosPoker["Q9o"] :=  20
	manosPoker["Q8o"] :=  13
	manosPoker["Q7o"] :=  10.3
	manosPoker["Q6o"] :=  9.6
	manosPoker["Q5o"] :=  8.9
	manosPoker["Q4o"] :=  7.9
	manosPoker["Q3o"] :=  7.5
	manosPoker["Q2o"] :=  7	
	manosPoker["JTs"] :=  20
	manosPoker["J9s"] :=  20
	manosPoker["J8s"] :=  20
	manosPoker["J7s"] :=  20
	manosPoker["J6s"] :=  18.6
	manosPoker["J5s"] :=  14.7
	manosPoker["J4s"] :=  13.5
	manosPoker["J3s"] :=  10.6
	manosPoker["J2s"] :=  8.5
	manosPoker["JTo"] :=  20
	manosPoker["J9o"] :=  20
	manosPoker["J8o"] :=  13.3
	manosPoker["J7o"] :=  8.5
	manosPoker["J6o"] :=  6.5
	manosPoker["J5o"] :=  6
	manosPoker["J4o"] :=  5.4
	manosPoker["J3o"] :=  5
	manosPoker["J2o"] :=  4.6	
	manosPoker["T9s"] :=  20
	manosPoker["T8s"] :=  20
	manosPoker["T7s"] :=  20
	manosPoker["T6s"] :=  20
	manosPoker["T5s"] :=  11.9
	manosPoker["T4s"] :=  10.5
	manosPoker["T3s"] :=  7.7
	manosPoker["T2s"] :=  6.5
	manosPoker["T9o"] :=  20
	manosPoker["T8o"] :=  17.5
	manosPoker["T7o"] :=  9
	manosPoker["T6o"] :=  5.7
	manosPoker["T5o"] :=  4.1
	manosPoker["T4o"] :=  3.8
	manosPoker["T3o"] :=  3.4
	manosPoker["T2o"] :=  2.9
	manosPoker["98s"] :=  20
	manosPoker["97s"] :=  20
	manosPoker["96s"] :=  20
	manosPoker["95s"] :=  14.4
	manosPoker["94s"] :=  6.9
	manosPoker["93s"] :=  4.9
	manosPoker["92s"] :=  3.7
	manosPoker["98o"] :=  20
	manosPoker["97o"] :=  10.8
	manosPoker["96o"] :=  5.2
	manosPoker["95o"] :=  3.5
	manosPoker["94o"] :=  2.7
	manosPoker["93o"] :=  2.5
	manosPoker["92o"] :=  2.2
	manosPoker["87s"] :=  20
	manosPoker["86s"] :=  20
	manosPoker["85s"] :=  18.8
	manosPoker["84s"] :=  10.1
	manosPoker["83s"] :=  2.7
	manosPoker["82s"] :=  2.5
	manosPoker["87o"] :=  14.7
	manosPoker["86o"] :=  7
	manosPoker["85o"] :=  3
	manosPoker["84o"] :=  2.3
	manosPoker["83o"] :=  1.9
	manosPoker["82o"] :=  1.8
	manosPoker["76s"] :=  20
	manosPoker["75s"] :=  20
	manosPoker["74s"] :=  13.9
	manosPoker["73s"] :=  2.5
	manosPoker["72s"] :=  2.1
	manosPoker["76o"] :=  10.7
	manosPoker["75o"] :=  2.6
	manosPoker["74o"] :=  2.1
	manosPoker["73o"] :=  1.8
	manosPoker["72o"] :=  1.6
	manosPoker["65s"] :=  20
	manosPoker["64s"] :=  16.3
	manosPoker["64s"] :=  16.3
	manosPoker["63s"] :=  "7.1o5.1o2.3"
	manosPoker["62s"] :=  2
	manosPoker["65o"] :=  2.4
	manosPoker["64o"] :=  2
	manosPoker["63o"] :=  1.7
	manosPoker["62o"] :=  1.5
	manosPoker["54s"] :=  20
	manosPoker["53s"] :=  "12.9o3.8o2.4"
	manosPoker["52s"] :=  2
	manosPoker["54o"] :=  2.1
	manosPoker["53o"] :=  1.8
	manosPoker["52o"] :=  1.5
	manosPoker["43s"] :=  "10o4.9o2.2"
	manosPoker["42s"] :=  1.8
	manosPoker["43o"] :=  1.6
	manosPoker["42o"] :=  1.4
	manosPoker["32s"] :=  1.7
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

CountSameSuitInFlop(flop) {
    ; Mensaje de depuración para verificar el contenido de cartasFlop
    cartasFlop := StrSplit(flop, " ")
    ;MsgBox, % "Contenido de cartasFlop: " . cartasFlop[1] . ", " . cartasFlop[2] . ", " . cartasFlop[3]

    suits := {}
    for _, carta in cartasFlop {
        suit := SubStr(carta, 2, 1)
        ; Mensaje de depuración para verificar cada carta y su palo
        ;MsgBox, Carta: %carta% - Palo: %suit%
        if !suits.HasKey(suit) {
            suits[suit] := 0
        }
        suits[suit]++
    }
    count := 0
    for key, value in suits {
        if (value >= 2) {
            count := value
            break
        }
    }
    ; Mostrar un mensaje de verificación
    ;MsgBox, % "Número de cartas del mismo palo en el flop: " . count
    return count
	}

TieneProyectoColor(mano, flop) {
    cartasFlop := StrSplit(flop, " ")

    ; Contar cartas del mismo palo en el flop
    sameSuitCount := CountSameSuitInFlop(flop)

    ; Obtener los palos de las cartas en la mano
    suit1 := SubStr(mano, 2, 1)
    suit2 := SubStr(mano, 4, 1)

    ; Verificar si al menos una carta de la mano coincide con el palo de las cartas del flop
    if (sameSuitCount >= 3) {
        if (suit1 = SubStr(cartasFlop[1], 2, 1) || suit1 = SubStr(cartasFlop[2], 2, 1) || suit1 = SubStr(cartasFlop[3], 2, 1) || suit2 = SubStr(cartasFlop[1], 2, 1) || suit2 = SubStr(cartasFlop[2], 2, 1) || suit2 = SubStr(cartasFlop[3], 2, 1))
        {  
            Return true
        }
    } else if (sameSuitCount = 2) 
    {
        if ((suit1 = SubStr(cartasFlop[1], 2, 1) && suit2 = SubStr(cartasFlop[2], 2, 1)) || (suit1 = SubStr(cartasFlop[1], 2, 1) && suit2 = SubStr(cartasFlop[3], 2, 1)) || (suit1 = SubStr(cartasFlop[2], 2, 1) && suit2 = SubStr(cartasFlop[3], 2, 1)))
        {
            if(suit1 = suit2)
            {
            	Return true
            }
        }
    }
    return false 
}





proyectocolorflop(manosArray, flop)
{
    ; Asumir que manosArray ya es un array de manos
    cartasFlop := StrSplit(flop, " ")
    sameSuitCount := CountSameSuitInFlop(flop)

    ; Lista para almacenar manos con proyecto de color
    manosConProyectoColor := []

    ; Iterar sobre cada mano y verificar si tiene proyecto de color
    for index, mano in manosArray {
         ;MsgBox, Iterando sobre la mano: %mano%
        ; Verificar si la mano tiene un proyecto de color
        if (TieneProyectoColor(mano, flop)) {
            manosConProyectoColor.Push(mano)
            ; No usar break aquí para continuar verificando otras manos
        }
    }

    return manosConProyectoColor
}


TieneParejaEnFlop(rango, flop) 
{
	cartasFlop := StrSplit(flop, " ")
    manosConPareja := []
    
    ; Iterar sobre cada mano en el rango
    for index, mano in rango {
        tienePareja := false
        
        ; Dividir la mano en cartas individuales
        cartasMano := StrSplit(mano, "")
        
        ; Contar coincidencias
        for _, cartaMano in cartasMano {
            for _, cartaFlop in cartasFlop {
                if (SubStr(cartaMano, 1, 1) = SubStr(cartaFlop, 1, 1)) {
                    tienePareja := true
                    break
                }
            }
        }
        
        ; Si la mano tiene pareja, agregarla a manosConPareja
        if (tienePareja) {
            manosConPareja.Push(mano)
        }
    }
    
    ; Devolver el array de manos con pareja en el flop
    return manosConPareja
}








rangomanos(manos) ;Convertimos un rango suited y offsuited en todas las combinaciones posibles
{

	;MsgBox, % manos
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	if(StrLen(manos) < 3)
    {
        manos := manos . "o"  ; Agrega "o" al final de la variable manos
        ;MsgBox, % mano  ; Muestra el contenido actualizado de manos
    }
	
	manosPoker["AAo"] := "AhAd,AhAc,AhAs,AdAc,AdAs,AcAs"
    manosPoker["KKo"] := "KhKd,KhKc,KhKs,KdKc,KdKs,KcKs"
	manosPoker["QQo"] := "QhQd,QhQc,QhQs,QdQc,QdQs,QcQs"
	manosPoker["JJo"] := "JhJd,JhJc,JhJs,JdJc,JdJs,JcJs"
	manosPoker["TTo"] := "ThTd,ThTc,ThTs,TdTc,TdTs,TcTs"
	manosPoker["99o"] := "9h9d,9h9c,9h9s,9d9c,9d9s,9c9s"
	manosPoker["88o"] := "8h8d,8h8c,8h8s,8d8c,8d8s,8c8s"
	manosPoker["77o"] := "7h7d,7h7c,7h7s,7d7c,7d7s,7c7s"
	manosPoker["66o"] := "6h6d,6h6c,6h6s,6d6c,6d6s,6c6s"
	manosPoker["55o"] := "5h5d,5h5c,5h5s,5d5c,5d5s,5c5s"
	manosPoker["44o"] := "4h4d,4h4c,4h4s,4d4c,4d4s,4c4s"
	manosPoker["33o"] := "3h3d,3h3c,3h3s,3d3c,3d3s,3c3s"
	manosPoker["22o"] := "2h2d,2h2c,2h2s,2d2c,2d2s,2c2s"

	manosPoker["AKo"] := "AhKd,AhKc,AhKs,AdKc,AdKs,AcKs,KhAd,KhAc,KhAs,KdAc,KdAs,KcAs"
	manosPoker["AQo"] := "AhQd,AhQc,AhQs,AdQc,AdQs,AcQs,QhAd,QhAc,QhAs,QdAc,QdAs,QcAs"
	manosPoker["AJo"] := "AhJd,AhJc,AhJs,AdJc,AdJs,AcJs,JhAd,JhAc,JhAs,JdAc,JdAs,JcAs"
	manosPoker["ATo"] := "AhTd,AhTc,AhTs,AdTc,AdTs,AcTs,ThAd,ThAc,ThAs,TdAc,TdAs,TcAs"
	manosPoker["A9o"] := "Ah9d,Ah9c,Ah9s,Ad9c,Ad9s,Ac9s,9hAd,9hAc,9hAs,9dAc,9dAs,9cAs"
	manosPoker["A8o"] := "Ah8d,Ah8c,Ah8s,Ad8c,Ad8s,Ac8s,8hAd,8hAc,8hAs,8dAc,8dAs,8cAs"
	manosPoker["A7o"] := "Ah7d,Ah7c,Ah7s,Ad7c,Ad7s,Ac7s,7hAd,7hAc,7hAs,7dAc,7dAs,7cAs"
	manosPoker["A6o"] := "Ah6d,Ah6c,Ah6s,Ad6c,Ad6s,Ac6s,6hAd,6hAc,6hAs,6dAc,6dAs,6cAs"
	manosPoker["A5o"] := "Ah5d,Ah5c,Ah5s,Ad5c,Ad5s,Ac5s,5hAd,5hAc,5hAs,5dAc,5dAs,5cAs"
	manosPoker["A4o"] := "Ah4d,Ah4c,Ah4s,Ad4c,Ad4s,Ac4s,4hAd,4hAc,4hAs,4dAc,4dAs,4cAs"
	manosPoker["A3o"] := "Ah3d,Ah3c,Ah3s,Ad3c,Ad3s,Ac3s,3hAd,3hAc,3hAs,3dAc,3dAs,3cAs"
	manosPoker["A2o"] := "Ah2d,Ah2c,Ah2s,Ad2c,Ad2s,Ac2s,2hAd,2hAc,2hAs,2dAc,2dAs,2cAs"

	manosPoker["KQo"] := "KhQd,KhQc,KhQs,KdQc,KdQs,KcQs,QhKd,QhKc,QhKs,QdKc,QdKs,QcKs"
	manosPoker["KJo"] := "KhJd,KhJc,KhJs,KdJc,KdJs,KcJs,JhKd,JhKc,JhKs,JdKc,JdKs,JcKs"
	manosPoker["KTo"] := "KhTd,KhTc,KhTs,KdTc,KdTs,KcTs,ThKd,ThKc,ThKs,TdKc,TdKs,TcKs"
	manosPoker["K9o"] := "Kh9d,Kh9c,Kh9s,Kd9c,Kd9s,Kc9s,9hKd,9hKc,9hKs,9dKc,9dKs,9cKs"
	manosPoker["K8o"] := "Kh8d,Kh8c,Kh8s,Kd8c,Kd8s,Kc8s,8hKd,8hKc,8hKs,8dKc,8dKs,8cKs"
	manosPoker["K7o"] := "Kh7d,Kh7c,Kh7s,Kd7c,Kd7s,Kc7s,7hKd,7hKc,7hKs,7dKc,7dKs,7cKs"
	manosPoker["K6o"] := "Kh6d,Kh6c,Kh6s,Kd6c,Kd6s,Kc6s,6hKd,6hKc,6hKs,6dKc,6dKs,6cKs"
	manosPoker["K5o"] := "Kh5d,Kh5c,Kh5s,Kd5c,Kd5s,Kc5s,5hKd,5hKc,5hKs,5dKc,5dKs,5cKs"
	manosPoker["K4o"] := "Kh4d,Kh4c,Kh4s,Kd4c,Kd4s,Kc4s,4hKd,4hKc,4hKs,4dKc,4dKs,4cKs"
	manosPoker["K3o"] := "Kh3d,Kh3c,Kh3s,Kd3c,Kd3s,Kc3s,3hKd,3hKc,3hKs,3dKc,3dKs,3cKs"
	manosPoker["K2o"] := "Kh2d,Kh2c,Kh2s,Kd2c,Kd2s,Kc2s,2hKd,2hKc,2hKs,2dKc,2dKs,2cKs"

	manosPoker["QJo"] := "QhJd,QhJc,QhJs,QdJc,QdJs,QcJs,JhQd,JhQc,JhQs,JdQc,JdQs,JcQs"
	manosPoker["QTo"] := "QhTd,QhTc,QhTs,QdTc,QdTs,QcTs,ThQd,ThQc,ThQs,TdQc,TdQs,TcQs"
	manosPoker["Q9o"] := "Qh9d,Qh9c,Qh9s,Qd9c,Qd9s,Qc9s,9hQd,9hQc,9hQs,9dQc,9dQs,9cQs"
	manosPoker["Q8o"] := "Qh8d,Qh8c,Qh8s,Qd8c,Qd8s,Qc8s,8hQd,8hQc,8hQs,8dQc,8dQs,8cQs"
	manosPoker["Q7o"] := "Qh7d,Qh7c,Qh7s,Qd7c,Qd7s,Qc7s,7hQd,7hQc,7hQs,7dQc,7dQs,7cQs"
	manosPoker["Q6o"] := "Qh6d,Qh6c,Qh6s,Qd6c,Qd6s,Qc6s,6hQd,6hQc,6hQs,6dQc,6dQs,6cQs"
	manosPoker["Q5o"] := "Qh5d,Qh5c,Qh5s,Qd5c,Qd5s,Qc5s,5hQd,5hQc,5hQs,5dQc,5dQs,5cQs"
	manosPoker["Q4o"] := "Qh4d,Qh4c,Qh4s,Qd4c,Qd4s,Qc4s,4hQd,4hQc,4hQs,4dQc,4dQs,4cQs"
	manosPoker["Q3o"] := "Qh3d,Qh3c,Qh3s,Qd3c,Qd3s,Qc3s,3hQd,3hQc,3hQs,3dQc,3dQs,3cQs"
	manosPoker["Q2o"] := "Qh2d,Qh2c,Qh2s,Qd2c,Qd2s,Qc2s,2hQd,2hQc,2hQs,2dQc,2dQs,2cQs"

	manosPoker["JTo"] := "JhTd,JhTc,JhTs,JdTc,JdTs,JcTs,ThJd,ThJc,ThJs,TdJc,TdJs,TcJs"
	manosPoker["J9o"] := "Jh9d,Jh9c,Jh9s,Jd9c,Jd9s,Jc9s,9hJd,9hJc,9hJs,9dJc,9dJs,9cJs"
	manosPoker["J8o"] := "Jh8d,Jh8c,Jh8s,Jd8c,Jd8s,Jc8s,8hJd,8hJc,8hJs,8dJc,8dJs,8cJs"
	manosPoker["J7o"] := "Jh7d,Jh7c,Jh7s,Jd7c,Jd7s,Jc7s,7hJd,7hJc,7hJs,7dJc,7dJs,7cJs"
	manosPoker["J6o"] := "Jh6d,Jh6c,Jh6s,Jd6c,Jd6s,Jc6s,6hJd,6hJc,6hJs,6dJc,6dJs,6cJs"
	manosPoker["J5o"] := "Jh5d,Jh5c,Jh5s,Jd5c,Jd5s,Jc5s,5hJd,5hJc,5hJs,5dJc,5dJs,5cJs"
	manosPoker["J4o"] := "Jh4d,Jh4c,Jh4s,Jd4c,Jd4s,Jc4s,4hJd,4hJc,4hJs,4dJc,4dJs,4cJs"
	manosPoker["J3o"] := "Jh3d,Jh3c,Jh3s,Jd3c,Jd3s,Jc3s,3hJd,3hJc,3hJs,3dJc,3dJs,3cJs"
	manosPoker["J2o"] := "Jh2d,Jh2c,Jh2s,Jd2c,Jd2s,Jc2s,2hJd,2hJc,2hJs,2dJc,2dJs,2cJs"

	manosPoker["T9o"] := "Th9d,Th9c,Th9s,Td9c,Td9s,Tc9s,9hTd,9hTc,9hTs,9dTc,9dTs,9cTs"
	manosPoker["T8o"] := "Th8d,Th8c,Th8s,Td8c,Td8s,Tc8s,8hTd,8hTc,8hTs,8dTc,8dTs,8cTs"
	manosPoker["T7o"] := "Th7d,Th7c,Th7s,Td7c,Td7s,Tc7s,7hTd,7hTc,7hTs,7dTc,7dTs,7cTs"
	manosPoker["T6o"] := "Th6d,Th6c,Th6s,Td6c,Td6s,Tc6s,6hTd,6hTc,6hTs,6dTc,6dTs,6cTs"
	manosPoker["T5o"] := "Th5d,Th5c,Th5s,Td5c,Td5s,Tc5s,5hTd,5hTc,5hTs,5dTc,5dTs,5cTs"
	manosPoker["T4o"] := "Th4d,Th4c,Th4s,Td4c,Td4s,Tc4s,4hTd,4hTc,4hTs,4dTc,4dTs,4cTs"
	manosPoker["T3o"] := "Th3d,Th3c,Th3s,Td3c,Td3s,Tc3s,3hTd,3hTc,3hTs,3dTc,3dTs,3cTs"
	manosPoker["T2o"] := "Th2d,Th2c,Th2s,Td2c,Td2s,Tc2s,2hTd,2hTc,2hTs,2dTc,2dTs,2cTs"

	manosPoker["98o"] := "9h8d,9h8c,9h8s,8d9c,8d9s,8c9s,9d8h,9d8c,9d8s,8c9h,8c9s,8s9h"
	manosPoker["97o"] := "9h7d,9h7c,9h7s,7d9c,7d9s,7c9s,9d7h,9d7c,9d7s,7c9h,7c9s,7s9h"
	manosPoker["96o"] := "9h6d,9h6c,9h6s,9d6c,9d6s,9c6s,6h9d,6h9c,6h9s,6d9c,6d9s,6c9s"
	manosPoker["95o"] := "9h5d,9h5c,9h5s,9d5c,9d5s,9c5s,5h9d,5h9c,5h9s,5d9c,5d9s,5c9s"
	manosPoker["94o"] := "9h4d,9h4c,9h4s,4d9c,4d9s,4c9s,9d4h,9d4c,9d4s,4c9h,4c9s,4s9h"
	manosPoker["93o"] := "9h3d,9h3c,9h3s,3d9c,3d9s,3c9s,9d3h,9d3c,9d3s,3c9h,3c9s,3s9h"
	manosPoker["92o"] := "9h2d,9h2c,9h2s,2d9c,2d9s,2c9s,9d2h,9d2c,9d2s,2c9h,2c9s,2s9h"

	manosPoker["87o"] := "8h7d,8h7c,8h7s,7d8c,7d8s,7c8s,7h8d,7h8c,7h8s,8d7c,8d7s,8c7s"
	manosPoker["86o"] := "8h6d,8h6c,8h6s,6d8c,6d8s,6c8s,6h8d,6h8c,6h8s,8d6c,8d6s,8c6s"
	manosPoker["85o"] := "8h5d,8h5c,8h5s,5d8c,5d8s,5c8s,5h8d,5h8c,5h8s,8d5c,8d5s,8c5s"
	manosPoker["84o"] := "8h4d,8h4c,8h4s,4d8c,4d8s,4c8s,4h8d,4h8c,4h8s,8d4c,8d4s,8c4s"
	manosPoker["83o"] := "8h3d,8h3c,8h3s,3d8c,3d8s,3c8s,3h8d,3h8c,3h8s,8d3c,8d3s,8c3s"
	manosPoker["82o"] := "8h2d,8h2c,8h2s,2d8c,2d8s,2c8s,2h8d,2h8c,2h8s,8d2c,8d2s,8c2s"

	manosPoker["76o"] := "7h6d,7h6c,7h6s,6d7c,6d7s,6c7s,6h7d,6h7c,6h7s,7d6c,7d6s,7c6s"
	manosPoker["75o"] := "7h5d,7h5c,7h5s,5d7c,5d7s,5c7s,5h7d,5h7c,5h7s,7d5c,7d5s,7c5s"
	manosPoker["74o"] := "7h4d,7h4c,7h4s,4d7c,4d7s,4c7s,4h7d,4h7c,4h7s,7d4c,7d4s,7c4s"
	manosPoker["73o"] := "7h3d,7h3c,7h3s,3d7c,3d7s,3c7s,3h7d,3h7c,3h7s,7d3c,7d3s,7c3s"
	manosPoker["72o"] := "7h2d,7h2c,7h2s,2d7c,2d7s,2c7s,2h7d,2h7c,2h7s,7d2c,7d2s,7c2s"

	manosPoker["65o"] := "6h5d,6h5c,6h5s,5d6c,5d6s,5c6s,5h6d,5h6c,5h6s,6d5c,6d5s,6c5s"
	manosPoker["64o"] := "6h4d,6h4c,6h4s,4d6c,4d6s,4c6s,4h6d,4h6c,4h6s,6d4c,6d4s,6c4s"
	manosPoker["63o"] := "6h3d,6h3c,6h3s,3d6c,3d6s,3c6s,3h6d,3h6c,3h6s,6d3c,6d3s,6c3s"
	manosPoker["62o"] := "6h2d,6h2c,6h2s,2d6c,2d6s,2c6s,2h6d,2h6c,2h6s,6d2c,6d2s,6c2s"

	manosPoker["54o"] := "5h4d,5h4c,5h4s,4d5c,4d5s,4c5s,4h5d,4h5c,4h5s,5d4c,5d4s,5c4s"
	manosPoker["53o"] := "5h3d,5h3c,5h3s,3d5c,3d5s,3c5s,3h5d,3h5c,3h5s,5d3c,5d3s,5c3s"
	manosPoker["52o"] := "5h2d,5h2c,5h2s,2d5c,2d5s,2c5s,2h5d,2h5c,2h5s,5d2c,5d2s,5c2s"

	manosPoker["43o"] := "4h3d,4h3c,4h3s,3d4c,3d4s,3c4s,3h4d,3h4c,3h4s,4d3c,4d3s,4c3s"
	manosPoker["42o"] := "4h2d,4h2c,4h2s,2d4c,2d4s,2c4s,2h4d,2h4c,2h4s,4d2c,4d2s,4c2s"

	manosPoker["32o"] := "3h2d,3h2c,3h2s,2d3c,2d3s,2c3s,2h3d,2h3c,2h3s,3d2c,3d2s,3c2s"

	manosPoker["AKs"] := "AhKh,AdKd,AcKc,AsKs"
    manosPoker["AQs"] := "AhQh,AdQd,AcQc,AsQs"
    manosPoker["AJs"] := "AhJh,AdJd,AcJc,AsJs"
    manosPoker["ATs"] := "AhTh,AdTd,AcTc,AsTs"
    manosPoker["A9s"] := "Ah9h,Ad9d,Ac9c,As9s"
    manosPoker["A8s"] := "Ah8h,Ad8d,Ac8c,As8s"
    manosPoker["A7s"] := "Ah7h,Ad7d,Ac7c,As7s"
    manosPoker["A6s"] := "Ah6h,Ad6d,Ac6c,As6s"
    manosPoker["A5s"] := "Ah5h,Ad5d,Ac5c,As5s"
    manosPoker["A4s"] := "Ah4h,Ad4d,Ac4c,As4s"
    manosPoker["A3s"] := "Ah3h,Ad3d,Ac3c,As3s"
    manosPoker["A2s"] := "Ah2h,Ad2d,Ac2c,As2s"

    manosPoker["KQs"] := "KhQh,KdQd,KcQc,KsQs"
    manosPoker["KJs"] := "KhJh,KdJd,KcJc,KsJs"
    manosPoker["KTs"] := "KhTh,KdTd,KcTc,KsTs"
    manosPoker["K9s"] := "Kh9h,Kd9d,Kc9c,Ks9s"
    manosPoker["K8s"] := "Kh8h,Kd8d,Kc8c,Ks8s"
    manosPoker["K7s"] := "Kh7h,Kd7d,Kc7c,Ks7s"
    manosPoker["K6s"] := "Kh6h,Kd6d,Kc6c,Ks6s"
    manosPoker["K5s"] := "Kh5h,Kd5d,Kc5c,Ks5s"
    manosPoker["K4s"] := "Kh4h,Kd4d,Kc4c,Ks4s"
    manosPoker["K3s"] := "Kh3h,Kd3d,Kc3c,Ks3s"
    manosPoker["K2s"] := "Kh2h,Kd2d,Kc2c,Ks2s"

    manosPoker["QJs"] := "QhJh,QdJd,QcJc,QsJs"
    manosPoker["QTs"] := "QhTh,QdTd,QcTc,QsTs"
    manosPoker["Q9s"] := "Qh9h,Qd9d,Qc9c,Qs9s"
    manosPoker["Q8s"] := "Qh8h,Qd8d,Qc8c,Qs8s"
    manosPoker["Q7s"] := "Qh7h,Qd7d,Qc7c,Qs7s"
    manosPoker["Q6s"] := "Qh6h,Qd6d,Qc6c,Qs6s"
    manosPoker["Q5s"] := "Qh5h,Qd5d,Qc5c,Qs5s"
    manosPoker["Q4s"] := "Qh4h,Qd4d,Qc4c,Qs4s"
    manosPoker["Q3s"] := "Qh3h,Qd3d,Qc3c,Qs3s"
    manosPoker["Q2s"] := "Qh2h,Qd2d,Qc2c,Qs2s"

    manosPoker["JTs"] := "JhTh,JdTd,JcTc,JsTs"
    manosPoker["J9s"] := "Jh9h,Jd9d,Jc9c,Js9s"
    manosPoker["J8s"] := "Jh8h,Jd8d,Jc8c,Js8s"
    manosPoker["J7s"] := "Jh7h,Jd7d,Jc7c,Js7s"
    manosPoker["J6s"] := "Jh6h,Jd6d,Jc6c,Js6s"
    manosPoker["J5s"] := "Jh5h,Jd5d,Jc5c,Js5s"
    manosPoker["J4s"] := "Jh4h,Jd4d,Jc4c,Js4s"
    manosPoker["J3s"] := "Jh3h,Jd3d,Jc3c,Js3s"
    manosPoker["J2s"] := "Jh2h,Jd2d,Jc2c,Js2s"

    manosPoker["T9s"] := "Th9h,Td9d,Tc9c,Ts9s"
    manosPoker["T8s"] := "Th8h,Td8d,Tc8c,Ts8s"
    manosPoker["T7s"] := "Th7h,Td7d,Tc7c,Ts7s"
    manosPoker["T6s"] := "Th6h,Td6d,Tc6c,Ts6s"
    manosPoker["T5s"] := "Th5h,Td5d,Tc5c,Ts5s"
    manosPoker["T4s"] := "Th4h,Td4d,Tc4c,Ts4s"
    manosPoker["T3s"] := "Th3h,Td3d,Tc3c,Ts3s"
    manosPoker["T2s"] := "Th2h,Td2d,Tc2c,Ts2s"

    manosPoker["98s"] := "9h8h,9d8d,9c8c,9s8s"
    manosPoker["97s"] := "9h7h,9d7d,9c7c,9s7s"
    manosPoker["96s"] := "9h6h,9d6d,9c6c,9s6s"
    manosPoker["95s"] := "9h5h,9d5d,9c5c,9s5s"
    manosPoker["94s"] := "9h4h,9d4d,9c4c,9s4s"
    manosPoker["93s"] := "9h3h,9d3d,9c3c,9s3s"
    manosPoker["92s"] := "9h2h,9d2d,9c2c,9s2s"

    manosPoker["87s"] := "8h7h,8d7d,8c7c,8s7s"
    manosPoker["86s"] := "8h6h,8d6d,8c6c,8s6s"
    manosPoker["85s"] := "8h5h,8d5d,8c5c,8s5s"
    manosPoker["84s"] := "8h4h,8d4d,8c4c,8s4s"
    manosPoker["83s"] := "8h3h,8d3d,8c3c,8s3s"
    manosPoker["82s"] := "8h2h,8d2d,8c2c,8s2s"

    manosPoker["76s"] := "7h6h,7d6d,7c6c,7s6s"
    manosPoker["75s"] := "7h5h,7d5d,7c5c,7s5s"
    manosPoker["74s"] := "7h4h,7d4d,7c4c,7s4s"
    manosPoker["73s"] := "7h3h,7d3d,7c3c,7s3s"
    manosPoker["72s"] := "7h2h,7d2d,7c2c,7s2s"

    manosPoker["65s"] := "6h5h,6d5d,6c5c,6s5s"
    manosPoker["64s"] := "6h4h,6d4d,6c4c,6s4s"
    manosPoker["63s"] := "6h3h,6d3d,6c3c,6s3s"
    manosPoker["62s"] := "6h2h,6d2d,6c2c,6s2s"

    manosPoker["54s"] := "5h4h,5d4d,5c4c,5s4s"
    manosPoker["53s"] := "5h3h,5d3d,5c3c,5s3s"
    manosPoker["52s"] := "5h2h,5d2d,5c2c,5s2s"

    manosPoker["43s"] := "4h3h,4d3d,4c3c,4s3s"
    manosPoker["42s"] := "4h2h,4d2d,4c2c,4s2s"

    manosPoker["32s"] := "3h2h,3d2d,3c2c,3s2s"

	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}


rangomanospokerengine(manos) ;Convertimos un rango suited y offsuited en todas las combinaciones posibles
{

	;MsgBox, % manos
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	if(StrLen(manos) < 3)
    {
        manos := manos . "o"  ; Agrega "o" al final de la variable manos
        ;MsgBox, % mano  ; Muestra el contenido actualizado de manos
    }
	
	manosPoker["AAo"] := "AhAd,AhAc,AhAs,AdAc,AdAs,AcAs"
    manosPoker["KKo"] := "KhKd,KhKc,KhKs,KdKc,KdKs,KcKs"
	manosPoker["QQo"] := "QhQd,QhQc,QhQs,QdQc,QdQs,QcQs"
	manosPoker["JJo"] := "JhJd,JhJc,JhJs,JdJc,JdJs,JcJs"
	manosPoker["TTo"] := "ThTd,ThTc,ThTs,TdTc,TdTs,TcTs"
	manosPoker["99o"] := "9h9d,9h9c,9h9s,9d9c,9d9s,9c9s"
	manosPoker["88o"] := "8h8d,8h8c,8h8s,8d8c,8d8s,8c8s"
	manosPoker["77o"] := "7h7d,7h7c,7h7s,7d7c,7d7s,7c7s"
	manosPoker["66o"] := "6h6d,6h6c,6h6s,6d6c,6d6s,6c6s"
	manosPoker["55o"] := "5h5d,5h5c,5h5s,5d5c,5d5s,5c5s"
	manosPoker["44o"] := "4h4d,4h4c,4h4s,4d4c,4d4s,4c4s"
	manosPoker["33o"] := "3h3d,3h3c,3h3s,3d3c,3d3s,3c3s"
	manosPoker["22o"] := "2h2d,2h2c,2h2s,2d2c,2d2s,2c2s"

	manosPoker["AKo"] := "AhKd,AhKc,AhKs,AdKc,AdKs,AcKs,KhAd,KhAc,KhAs,KdAc,KdAs,KcAs"
	manosPoker["AQo"] := "AhQd,AhQc,AhQs,AdQc,AdQs,AcQs,QhAd,QhAc,QhAs,QdAc,QdAs,QcAs"
	manosPoker["AJo"] := "AhJd,AhJc,AhJs,AdJc,AdJs,AcJs,JhAd,JhAc,JhAs,JdAc,JdAs,JcAs"
	manosPoker["ATo"] := "AhTd,AhTc,AhTs,AdTc,AdTs,AcTs,ThAd,ThAc,ThAs,TdAc,TdAs,TcAs"
	manosPoker["A9o"] := "Ah9d,Ah9c,Ah9s,Ad9c,Ad9s,Ac9s,9hAd,9hAc,9hAs,9dAc,9dAs,9cAs"
	manosPoker["A8o"] := "Ah8d,Ah8c,Ah8s,Ad8c,Ad8s,Ac8s,8hAd,8hAc,8hAs,8dAc,8dAs,8cAs"
	manosPoker["A7o"] := "Ah7d,Ah7c,Ah7s,Ad7c,Ad7s,Ac7s,7hAd,7hAc,7hAs,7dAc,7dAs,7cAs"
	manosPoker["A6o"] := "Ah6d,Ah6c,Ah6s,Ad6c,Ad6s,Ac6s,6hAd,6hAc,6hAs,6dAc,6dAs,6cAs"
	manosPoker["A5o"] := "Ah5d,Ah5c,Ah5s,Ad5c,Ad5s,Ac5s,5hAd,5hAc,5hAs,5dAc,5dAs,5cAs"
	manosPoker["A4o"] := "Ah4d,Ah4c,Ah4s,Ad4c,Ad4s,Ac4s,4hAd,4hAc,4hAs,4dAc,4dAs,4cAs"
	manosPoker["A3o"] := "Ah3d,Ah3c,Ah3s,Ad3c,Ad3s,Ac3s,3hAd,3hAc,3hAs,3dAc,3dAs,3cAs"
	manosPoker["A2o"] := "Ah2d,Ah2c,Ah2s,Ad2c,Ad2s,Ac2s,2hAd,2hAc,2hAs,2dAc,2dAs,2cAs"

	manosPoker["KQo"] := "KhQd,KhQc,KhQs,KdQc,KdQs,KcQs,QhKd,QhKc,QhKs,QdKc,QdKs,QcKs"
	manosPoker["KJo"] := "KhJd,KhJc,KhJs,KdJc,KdJs,KcJs,JhKd,JhKc,JhKs,JdKc,JdKs,JcKs"
	manosPoker["KTo"] := "KhTd,KhTc,KhTs,KdTc,KdTs,KcTs,ThKd,ThKc,ThKs,TdKc,TdKs,TcKs"
	manosPoker["K9o"] := "Kh9d,Kh9c,Kh9s,Kd9c,Kd9s,Kc9s,9hKd,9hKc,9hKs,9dKc,9dKs,9cKs"
	manosPoker["K8o"] := "Kh8d,Kh8c,Kh8s,Kd8c,Kd8s,Kc8s,8hKd,8hKc,8hKs,8dKc,8dKs,8cKs"
	manosPoker["K7o"] := "Kh7d,Kh7c,Kh7s,Kd7c,Kd7s,Kc7s,7hKd,7hKc,7hKs,7dKc,7dKs,7cKs"
	manosPoker["K6o"] := "Kh6d,Kh6c,Kh6s,Kd6c,Kd6s,Kc6s,6hKd,6hKc,6hKs,6dKc,6dKs,6cKs"
	manosPoker["K5o"] := "Kh5d,Kh5c,Kh5s,Kd5c,Kd5s,Kc5s,5hKd,5hKc,5hKs,5dKc,5dKs,5cKs"
	manosPoker["K4o"] := "Kh4d,Kh4c,Kh4s,Kd4c,Kd4s,Kc4s,4hKd,4hKc,4hKs,4dKc,4dKs,4cKs"
	manosPoker["K3o"] := "Kh3d,Kh3c,Kh3s,Kd3c,Kd3s,Kc3s,3hKd,3hKc,3hKs,3dKc,3dKs,3cKs"
	manosPoker["K2o"] := "Kh2d,Kh2c,Kh2s,Kd2c,Kd2s,Kc2s,2hKd,2hKc,2hKs,2dKc,2dKs,2cKs"

	manosPoker["QJo"] := "QhJd,QhJc,QhJs,QdJc,QdJs,QcJs,JhQd,JhQc,JhQs,JdQc,JdQs,JcQs"
	manosPoker["QTo"] := "QhTd,QhTc,QhTs,QdTc,QdTs,QcTs,ThQd,ThQc,ThQs,TdQc,TdQs,TcQs"
	manosPoker["Q9o"] := "Qh9d,Qh9c,Qh9s,Qd9c,Qd9s,Qc9s,9hQd,9hQc,9hQs,9dQc,9dQs,9cQs"
	manosPoker["Q8o"] := "Qh8d,Qh8c,Qh8s,Qd8c,Qd8s,Qc8s,8hQd,8hQc,8hQs,8dQc,8dQs,8cQs"
	manosPoker["Q7o"] := "Qh7d,Qh7c,Qh7s,Qd7c,Qd7s,Qc7s,7hQd,7hQc,7hQs,7dQc,7dQs,7cQs"
	manosPoker["Q6o"] := "Qh6d,Qh6c,Qh6s,Qd6c,Qd6s,Qc6s,6hQd,6hQc,6hQs,6dQc,6dQs,6cQs"
	manosPoker["Q5o"] := "Qh5d,Qh5c,Qh5s,Qd5c,Qd5s,Qc5s,5hQd,5hQc,5hQs,5dQc,5dQs,5cQs"
	manosPoker["Q4o"] := "Qh4d,Qh4c,Qh4s,Qd4c,Qd4s,Qc4s,4hQd,4hQc,4hQs,4dQc,4dQs,4cQs"
	manosPoker["Q3o"] := "Qh3d,Qh3c,Qh3s,Qd3c,Qd3s,Qc3s,3hQd,3hQc,3hQs,3dQc,3dQs,3cQs"
	manosPoker["Q2o"] := "Qh2d,Qh2c,Qh2s,Qd2c,Qd2s,Qc2s,2hQd,2hQc,2hQs,2dQc,2dQs,2cQs"

	manosPoker["JTo"] := "JhTd,JhTc,JhTs,JdTc,JdTs,JcTs,ThJd,ThJc,ThJs,TdJc,TdJs,TcJs"
	manosPoker["J9o"] := "Jh9d,Jh9c,Jh9s,Jd9c,Jd9s,Jc9s,9hJd,9hJc,9hJs,9dJc,9dJs,9cJs"
	manosPoker["J8o"] := "Jh8d,Jh8c,Jh8s,Jd8c,Jd8s,Jc8s,8hJd,8hJc,8hJs,8dJc,8dJs,8cJs"
	manosPoker["J7o"] := "Jh7d,Jh7c,Jh7s,Jd7c,Jd7s,Jc7s,7hJd,7hJc,7hJs,7dJc,7dJs,7cJs"
	manosPoker["J6o"] := "Jh6d,Jh6c,Jh6s,Jd6c,Jd6s,Jc6s,6hJd,6hJc,6hJs,6dJc,6dJs,6cJs"
	manosPoker["J5o"] := "Jh5d,Jh5c,Jh5s,Jd5c,Jd5s,Jc5s,5hJd,5hJc,5hJs,5dJc,5dJs,5cJs"
	manosPoker["J4o"] := "Jh4d,Jh4c,Jh4s,Jd4c,Jd4s,Jc4s,4hJd,4hJc,4hJs,4dJc,4dJs,4cJs"
	manosPoker["J3o"] := "Jh3d,Jh3c,Jh3s,Jd3c,Jd3s,Jc3s,3hJd,3hJc,3hJs,3dJc,3dJs,3cJs"
	manosPoker["J2o"] := "Jh2d,Jh2c,Jh2s,Jd2c,Jd2s,Jc2s,2hJd,2hJc,2hJs,2dJc,2dJs,2cJs"

	manosPoker["T9o"] := "Th9d,Th9c,Th9s,Td9c,Td9s,Tc9s,9hTd,9hTc,9hTs,9dTc,9dTs,9cTs"
	manosPoker["T8o"] := "Th8d,Th8c,Th8s,Td8c,Td8s,Tc8s,8hTd,8hTc,8hTs,8dTc,8dTs,8cTs"
	manosPoker["T7o"] := "Th7d,Th7c,Th7s,Td7c,Td7s,Tc7s,7hTd,7hTc,7hTs,7dTc,7dTs,7cTs"
	manosPoker["T6o"] := "Th6d,Th6c,Th6s,Td6c,Td6s,Tc6s,6hTd,6hTc,6hTs,6dTc,6dTs,6cTs"
	manosPoker["T5o"] := "Th5d,Th5c,Th5s,Td5c,Td5s,Tc5s,5hTd,5hTc,5hTs,5dTc,5dTs,5cTs"
	manosPoker["T4o"] := "Th4d,Th4c,Th4s,Td4c,Td4s,Tc4s,4hTd,4hTc,4hTs,4dTc,4dTs,4cTs"
	manosPoker["T3o"] := "Th3d,Th3c,Th3s,Td3c,Td3s,Tc3s,3hTd,3hTc,3hTs,3dTc,3dTs,3cTs"
	manosPoker["T2o"] := "Th2d,Th2c,Th2s,Td2c,Td2s,Tc2s,2hTd,2hTc,2hTs,2dTc,2dTs,2cTs"

	manosPoker["98o"] := "9h8d,9h8c,9h8s,8d9c,8d9s,8c9s,9d8h,9d8c,9d8s,8c9h,8c9s,8s9h"
	manosPoker["97o"] := "9h7d,9h7c,9h7s,7d9c,7d9s,7c9s,9d7h,9d7c,9d7s,7c9h,7c9s,7s9h"
	manosPoker["96o"] := "9h6d,9h6c,9h6s,9d6c,9d6s,9c6s,6h9d,6h9c,6h9s,6d9c,6d9s,6c9s"
	manosPoker["95o"] := "9h5d,9h5c,9h5s,9d5c,9d5s,9c5s,5h9d,5h9c,5h9s,5d9c,5d9s,5c9s"
	manosPoker["94o"] := "9h4d,9h4c,9h4s,4d9c,4d9s,4c9s,9d4h,9d4c,9d4s,4c9h,4c9s,4s9h"
	manosPoker["93o"] := "9h3d,9h3c,9h3s,3d9c,3d9s,3c9s,9d3h,9d3c,9d3s,3c9h,3c9s,3s9h"
	manosPoker["92o"] := "9h2d,9h2c,9h2s,2d9c,2d9s,2c9s,9d2h,9d2c,9d2s,2c9h,2c9s,2s9h"

	manosPoker["87o"] := "8h7d,8h7c,8h7s,7d8c,7d8s,7c8s,7h8d,7h8c,7h8s,8d7c,8d7s,8c7s"
	manosPoker["86o"] := "8h6d,8h6c,8h6s,6d8c,6d8s,6c8s,6h8d,6h8c,6h8s,8d6c,8d6s,8c6s"
	manosPoker["85o"] := "8h5d,8h5c,8h5s,5d8c,5d8s,5c8s,5h8d,5h8c,5h8s,8d5c,8d5s,8c5s"
	manosPoker["84o"] := "8h4d,8h4c,8h4s,4d8c,4d8s,4c8s,4h8d,4h8c,4h8s,8d4c,8d4s,8c4s"
	manosPoker["83o"] := "8h3d,8h3c,8h3s,3d8c,3d8s,3c8s,3h8d,3h8c,3h8s,8d3c,8d3s,8c3s"
	manosPoker["82o"] := "8h2d,8h2c,8h2s,2d8c,2d8s,2c8s,2h8d,2h8c,2h8s,8d2c,8d2s,8c2s"

	manosPoker["76o"] := "7h6d,7h6c,7h6s,6d7c,6d7s,6c7s,6h7d,6h7c,6h7s,7d6c,7d6s,7c6s"
	manosPoker["75o"] := "7h5d,7h5c,7h5s,5d7c,5d7s,5c7s,5h7d,5h7c,5h7s,7d5c,7d5s,7c5s"
	manosPoker["74o"] := "7h4d,7h4c,7h4s,4d7c,4d7s,4c7s,4h7d,4h7c,4h7s,7d4c,7d4s,7c4s"
	manosPoker["73o"] := "7h3d,7h3c,7h3s,3d7c,3d7s,3c7s,3h7d,3h7c,3h7s,7d3c,7d3s,7c3s"
	manosPoker["72o"] := "7h2d,7h2c,7h2s,2d7c,2d7s,2c7s,2h7d,2h7c,2h7s,7d2c,7d2s,7c2s"

	manosPoker["65o"] := "6h5d,6h5c,6h5s,5d6c,5d6s,5c6s,5h6d,5h6c,5h6s,6d5c,6d5s,6c5s"
	manosPoker["64o"] := "6h4d,6h4c,6h4s,4d6c,4d6s,4c6s,4h6d,4h6c,4h6s,6d4c,6d4s,6c4s"
	manosPoker["63o"] := "6h3d,6h3c,6h3s,3d6c,3d6s,3c6s,3h6d,3h6c,3h6s,6d3c,6d3s,6c3s"
	manosPoker["62o"] := "6h2d,6h2c,6h2s,2d6c,2d6s,2c6s,2h6d,2h6c,2h6s,6d2c,6d2s,6c2s"

	manosPoker["54o"] := "5h4d,5h4c,5h4s,4d5c,4d5s,4c5s,4h5d,4h5c,4h5s,5d4c,5d4s,5c4s"
	manosPoker["53o"] := "5h3d,5h3c,5h3s,3d5c,3d5s,3c5s,3h5d,3h5c,3h5s,5d3c,5d3s,5c3s"
	manosPoker["52o"] := "5h2d,5h2c,5h2s,2d5c,2d5s,2c5s,2h5d,2h5c,2h5s,5d2c,5d2s,5c2s"

	manosPoker["43o"] := "4h3d,4h3c,4h3s,3d4c,3d4s,3c4s,3h4d,3h4c,3h4s,4d3c,4d3s,4c3s"
	manosPoker["42o"] := "4h2d,4h2c,4h2s,2d4c,2d4s,2c4s,2h4d,2h4c,2h4s,4d2c,4d2s,4c2s"

	manosPoker["32o"] := "3h2d,3h2c,3h2s,2d3c,2d3s,2c3s,2h3d,2h3c,2h3s,3d2c,3d2s,3c2s"

	manosPoker["AKs"] := "AhKh,AdKd,AcKc,AsKs"
    manosPoker["AQs"] := "AhQh,AdQd,AcQc,AsQs"
    manosPoker["AJs"] := "AhJh,AdJd,AcJc,AsJs"
    manosPoker["ATs"] := "AhTh,AdTd,AcTc,AsTs"
    manosPoker["A9s"] := "Ah9h,Ad9d,Ac9c,As9s"
    manosPoker["A8s"] := "Ah8h,Ad8d,Ac8c,As8s"
    manosPoker["A7s"] := "Ah7h,Ad7d,Ac7c,As7s"
    manosPoker["A6s"] := "Ah6h,Ad6d,Ac6c,As6s"
    manosPoker["A5s"] := "Ah5h,Ad5d,Ac5c,As5s"
    manosPoker["A4s"] := "Ah4h,Ad4d,Ac4c,As4s"
    manosPoker["A3s"] := "Ah3h,Ad3d,Ac3c,As3s"
    manosPoker["A2s"] := "Ah2h,Ad2d,Ac2c,As2s"

    manosPoker["KQs"] := "KhQh,KdQd,KcQc,KsQs"
    manosPoker["KJs"] := "KhJh,KdJd,KcJc,KsJs"
    manosPoker["KTs"] := "KhTh,KdTd,KcTc,KsTs"
    manosPoker["K9s"] := "Kh9h,Kd9d,Kc9c,Ks9s"
    manosPoker["K8s"] := "Kh8h,Kd8d,Kc8c,Ks8s"
    manosPoker["K7s"] := "Kh7h,Kd7d,Kc7c,Ks7s"
    manosPoker["K6s"] := "Kh6h,Kd6d,Kc6c,Ks6s"
    manosPoker["K5s"] := "Kh5h,Kd5d,Kc5c,Ks5s"
    manosPoker["K4s"] := "Kh4h,Kd4d,Kc4c,Ks4s"
    manosPoker["K3s"] := "Kh3h,Kd3d,Kc3c,Ks3s"
    manosPoker["K2s"] := "Kh2h,Kd2d,Kc2c,Ks2s"

    manosPoker["QJs"] := "QhJh,QdJd,QcJc,QsJs"
    manosPoker["QTs"] := "QhTh,QdTd,QcTc,QsTs"
    manosPoker["Q9s"] := "Qh9h,Qd9d,Qc9c,Qs9s"
    manosPoker["Q8s"] := "Qh8h,Qd8d,Qc8c,Qs8s"
    manosPoker["Q7s"] := "Qh7h,Qd7d,Qc7c,Qs7s"
    manosPoker["Q6s"] := "Qh6h,Qd6d,Qc6c,Qs6s"
    manosPoker["Q5s"] := "Qh5h,Qd5d,Qc5c,Qs5s"
    manosPoker["Q4s"] := "Qh4h,Qd4d,Qc4c,Qs4s"
    manosPoker["Q3s"] := "Qh3h,Qd3d,Qc3c,Qs3s"
    manosPoker["Q2s"] := "Qh2h,Qd2d,Qc2c,Qs2s"

    manosPoker["JTs"] := "JhTh,JdTd,JcTc,JsTs"
    manosPoker["J9s"] := "Jh9h,Jd9d,Jc9c,Js9s"
    manosPoker["J8s"] := "Jh8h,Jd8d,Jc8c,Js8s"
    manosPoker["J7s"] := "Jh7h,Jd7d,Jc7c,Js7s"
    manosPoker["J6s"] := "Jh6h,Jd6d,Jc6c,Js6s"
    manosPoker["J5s"] := "Jh5h,Jd5d,Jc5c,Js5s"
    manosPoker["J4s"] := "Jh4h,Jd4d,Jc4c,Js4s"
    manosPoker["J3s"] := "Jh3h,Jd3d,Jc3c,Js3s"
    manosPoker["J2s"] := "Jh2h,Jd2d,Jc2c,Js2s"

    manosPoker["T9s"] := "Th9h,Td9d,Tc9c,Ts9s"
    manosPoker["T8s"] := "Th8h,Td8d,Tc8c,Ts8s"
    manosPoker["T7s"] := "Th7h,Td7d,Tc7c,Ts7s"
    manosPoker["T6s"] := "Th6h,Td6d,Tc6c,Ts6s"
    manosPoker["T5s"] := "Th5h,Td5d,Tc5c,Ts5s"
    manosPoker["T4s"] := "Th4h,Td4d,Tc4c,Ts4s"
    manosPoker["T3s"] := "Th3h,Td3d,Tc3c,Ts3s"
    manosPoker["T2s"] := "Th2h,Td2d,Tc2c,Ts2s"

    manosPoker["98s"] := "9h8h,9d8d,9c8c,9s8s"
    manosPoker["97s"] := "9h7h,9d7d,9c7c,9s7s"
    manosPoker["96s"] := "9h6h,9d6d,9c6c,9s6s"
    manosPoker["95s"] := "9h5h,9d5d,9c5c,9s5s"
    manosPoker["94s"] := "9h4h,9d4d,9c4c,9s4s"
    manosPoker["93s"] := "9h3h,9d3d,9c3c,9s3s"
    manosPoker["92s"] := "9h2h,9d2d,9c2c,9s2s"

    manosPoker["87s"] := "8h7h,8d7d,8c7c,8s7s"
    manosPoker["86s"] := "8h6h,8d6d,8c6c,8s6s"
    manosPoker["85s"] := "8h5h,8d5d,8c5c,8s5s"
    manosPoker["84s"] := "8h4h,8d4d,8c4c,8s4s"
    manosPoker["83s"] := "8h3h,8d3d,8c3c,8s3s"
    manosPoker["82s"] := "8h2h,8d2d,8c2c,8s2s"

    manosPoker["76s"] := "7h6h,7d6d,7c6c,7s6s"
    manosPoker["75s"] := "7h5h,7d5d,7c5c,7s5s"
    manosPoker["74s"] := "7h4h,7d4d,7c4c,7s4s"
    manosPoker["73s"] := "7h3h,7d3d,7c3c,7s3s"
    manosPoker["72s"] := "7h2h,7d2d,7c2c,7s2s"

    manosPoker["65s"] := "6h5h,6d5d,6c5c,6s5s"
    manosPoker["64s"] := "6h4h,6d4d,6c4c,6s4s"
    manosPoker["63s"] := "6h3h,6d3d,6c3c,6s3s"
    manosPoker["62s"] := "6h2h,6d2d,6c2c,6s2s"

    manosPoker["54s"] := "5h4h,5d4d,5c4c,5s4s"
    manosPoker["53s"] := "5h3h,5d3d,5c3c,5s3s"
    manosPoker["52s"] := "5h2h,5d2d,5c2c,5s2s"

    manosPoker["43s"] := "4h3h,4d3d,4c3c,4s3s"
    manosPoker["42s"] := "4h2h,4d2d,4c2c,4s2s"

    manosPoker["32s"] := "3h2h,3d2d,3c2c,3s2s"

	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}



popupnashpush(valormanos, color, posx, posy, mesa)
{
	
	

	posx := posx+80
	posy := posy-30
	
	
	tamanox := 30
	tamanoy := 30
	
	;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
	Run, pythonw popupsimple.pyw %posx% %posy% %valormanos% %color% %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}



popuptabla(posx, posy, mesa, imagen)
{
	
	;MsgBox, % mesa imagen

	posx := posx+80
	posy := posy
	
	
	tamanox := 30
	tamanoy := 30
	
	;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
	Run, pythonw ventana_tabla.pyw %posx% %posy% T grey %tamanox% %tamanoy% %mesa% %imagen%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}

popupsayuda(posx, posy, mesa, stackefect, mano, situacion)
{
	
	;MsgBox, % mesa imagen

	posx := posx-405
	posy := posy-460
	
	
	tamanox := 55
	tamanoy := 30
	
	;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
	;Runwait, cmd /k python popupsimple.pyw %posx% %posy% %mano% black %tamanox% %tamanoy% %mesa%, , UseErrorLevel y que el script de python reciba las variables
	Run, pythonw ventana_mano.pyw %posx% %posy% %mano% black %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}

popupsayuda_flop_mano(posx, posy, mesa, stackefect, mano, flop, situacion)
{
	

	;MsgBox, % mesa imagen

	posx := posx-425
	posy := posy-460
	
	
	tamanox := 75
	tamanoy := 30
	
	;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
	;Runwait, cmd /k python popupsimple.pyw %posx% %posy% %flop% black %tamanox% %tamanoy% %mesa%, , UseErrorLevel y que el script de python reciba las variables
	Run, pythonw ventana_mano.pyw %posx% %posy% %mano% black %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}

popupsayuda_flop_flop(posx, posy, mesa, stackefect, mano, flop, situacion)
{
	

	;MsgBox, % mesa imagen

	posx := posx-425
	posy := posy-430
	
	
	tamanox := 75
	tamanoy := 30
	
	;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
	;Runwait, cmd /k python popupsimple.pyw %posx% %posy% %flop% black %tamanox% %tamanoy% %mesa%, , UseErrorLevel y que el script de python reciba las variables
	Run, pythonw ventana_mano.pyw %posx% %posy% %flop% black %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}






guardartiempos(fecha, situacionglobal, duracionSegundos)
{
	fecha := %1%
	situacionglobal := %2%
	duracionSegundos := %3%
	; Al inicio del script, comprueba si el archivo "lockfile" existe
	/*
	Loop
	{
	   IfNotExist, lockfile
	      Break  ; Si no existe, sal del bucle
	   Sleep, 1000 ; Si existe, duerme un segundo y luego vuelve a comprobar
	}
	; Crea el archivo "lockfile"
	FileAppend,, lockfile
	*/
	
	FormatTime, fecha, % A_Now, dd/MM/yy
	File := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\musica\resultadosMUSICA1.0.txt"
	FileAppend, % fecha ", " situacionglobal ", " duracionSegundos "`n", % File


	; Al final del script, elimina el archivo "lockfile"
	;FileDelete, lockfile
}




result(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto)  
{
	
	CoordMode,Pixel,Screen

	;MsgBox, mesa:, %mesa%
	x1b := Round(x1 + (ancho * 0.4639))
	y1b := Round(y1 + (alto * 0.7755))
	x2b := Round(x1b + (ancho * 0.07))
	y2b := Round(y1b + (alto * 0.04187))
	
	;MsgBox, %x1b% %y1b% %x2b% %y2b%
	;Run, pythonw CaptureScreenshot.pyw %x1b% %y1b% %x2b% %y2b%, , Hide ;toma foto de la mesa
	ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*160 %rutaimg%img\time1.bmp
	verrorlevel := ErrorLevel
	
	;MsgBox, %ErrorLevel%
	posx := x
	posy := y

	Run, pythonw CaptureScreenshot.pyw %x1% %y1% %x2% %y2% %situacionglobal%, , Hide ;toma foto de la mesa
	ruta_archivo := "result" mesa ".txt"
	; Guardar las variables en el archivo de texto
	FileDelete, %ruta_archivo%  ; Eliminar el archivo si ya existe
	FileAppend, % "stackvalue: " . stackvalue . "`n"
	          . "mesa: " . mesa . "`n"
	          . "mano: " . mano . "`n"
	          . "situacionglobal: " . situacionglobal . "`n"
	          . "situacionfinal: " . situacionfinal, %ruta_archivo%

	popupsayuda(posx, posy, mesa, stackefect, mano, situacion)
	;MsgBox, Stack:%stackvalue%'n%situacionglobal%,%mano%,%mesa%,%situacionfinal%
	;MsgBox, %review%
	
	if( review =1)
	{
		popupreview(stackvalue, mesa, mano, situacionfinal)
		;MsgBox, % situacionglobal
	}
	else
	{
		if(ErrorLevel = 0)
		{
		    

		    StartTime := A_TickCount
		    while ((ErrorLevel = 0) && ((A_TickCount - StartTime) <= 10000))  ; continuar hasta que ErrorLevel sea 1 o hayan pasado 10 segundos
		    {
		        ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*160 %rutaimg%img\time1.bmp
		    	;MsgBox, vamos a espera a que acabe la mano

		        Sleep, 100  ; dormir por un corto tiempo para evitar la utilización excesiva de la CPU
		        tiempo := A_TickCount - StartTime
		        ;MsgBox, %tiempo%
		    }
		    ; el bucle ha terminado, por lo que ErrorLevel debe ser 1 o debieron haber pasado 10 segundos
		}
		;MsgBox ,salimos
	}
	
	
	;popupgame()
	
	;MsgBox, %situacionglobal%
	;MsgBox, %x1% %y1% %x2% %y2%
	
	;Run, run_python.bat %x1% %y1% %x2% %y2% %situacionglobal%
	
	
	;MsgBox, %situacionglobal%
	;Run, run_python.bat %x1% %y1% %x2% %y2% %situacionglobal%
	
	; activar esta opcion cuando tenga todas las situaciones estandart hechas
	
	
	/*
		
		
		
		archivo := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\bot\archivo.txt"
		
; Guardar la variable en el archivo
		FileAppend, %stackvalue%, %archivo%
		
		MsgBox, La variable se ha guardado en el archivo.
	*/
	
	sleep, 200
}

resultflop(x1, y1, x2, y2, stackefect, mesa, mano, situacionglobal, situacionfinal, ancho, alto, rival, flop, review)  
{
	
	CoordMode,Pixel,Screen

	;MsgBox, mesa:, %situacionglobal%

	x1b := Round(x1 + (ancho * 0.455))
	y1b := Round(y1 + (alto * 0.7755))
	x2b := Round(x1b + (ancho * 0.07))
	y2b := Round(y1b + (alto * 0.04187))
	
	;MsgBox, %x1b% %y1b% %x2b% %y2b%
	;Run, pythonw CaptureScreenshot.pyw %x1b% %y1b% %x2b% %y2b%, , Hide ;toma foto de la mesa
	ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*130 %rutaimg%img\time1.bmp
	verrorlevel := ErrorLevel
	
	;MsgBox, aquiii%ErrorLevel%
	posx := x
	posy := y

	Run, pythonw CaptureScreenshot.pyw %x1% %y1% %x2% %y2% %situacionglobal%, , Hide ;toma foto de la mesa
	ruta_archivo := "resultflop" mesa ".txt"
	; Guardar las variables en el archivo de texto
	FileDelete, %ruta_archivo%  ; Eliminar el archivo si ya existe
	FileAppend, % "stackefect: " . stackefect . "`n"
	          . "mesa: " . mesa . "`n"
	          . "mano: " . mano . "`n"
	          . "flop: " . flop . "`n"
	          . "situacionglobal: " . situacionglobal . "`n"
	          . "situacionfinal: " . situacionfinal, %ruta_archivo%

	popupsayuda_flop_mano(posx, posy, mesa, stackefect, mano, flop, situacion)
	popupsayuda_flop_flop(posx, posy, mesa, stackefect, mano, flop, situacion)
	;MsgBox, Stack:%stackvalue%'n%situacionglobal%,%mano%,%mesa%,%situacionfinal%
	;MsgBox, %review%
	
	if( review =1)
	{
		popupreviewflop(stackefect, mano, flop, situacionglobal ,situacionfinal)
		;MsgBox, %stackvalue% %situacionfinal%
	}
	else
	{
		if(ErrorLevel = 0)
		{
		    MsgBox, ent

		    StartTime := A_TickCount
		    while ((ErrorLevel != 1) && ((A_TickCount - StartTime) <= 10000))  ; continuar hasta que ErrorLevel sea 1 o hayan pasado 10 segundos
		    {
		        ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*150 %rutaimg%img\time1.bmp
		    	;MsgBox, vamos a espera a que acabe la mano

		        Sleep, 100  ; dormir por un corto tiempo para evitar la utilización excesiva de la CPU
		        ;MsgBox, ESPERAMOS A QUE TERMINEMOS DE ACTUAR %ErrorLevel%
		    }
		    ; el bucle ha terminado, por lo que ErrorLevel debe ser 1 o debieron haber pasado 10 segundos
		}
		;MsgBox ,salimos
	}
	
	
	if(ErrorLevel = 0)
		{
		    
			
		    StartTime := A_TickCount
		    while ((ErrorLevel != 1) && ((A_TickCount - StartTime) <= 10000))  ; continuar hasta que ErrorLevel sea 1 o hayan pasado 10 segundos
		    {
		        ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*150 %rutaimg%img\time1.bmp
		    	;MsgBox, vamos a espera actue en el flop

		        Sleep, 100  ; dormir por un corto tiempo para evitar la utilización excesiva de la CPU
		        ;MsgBox, ESPERAMOS A QUE TERMINEMOS DE ACTUAR %ErrorLevel%
		    }
		    ; el bucle ha terminado, por lo que ErrorLevel debe ser 1 o debieron haber pasado 10 segundos
		}
	
	;popupgame()
	
	;MsgBox, %situacionglobal%
	;MsgBox, %x1% %y1% %x2% %y2%
	
	;Run, run_python.bat %x1% %y1% %x2% %y2% %situacionglobal%
	
	
	;MsgBox, %situacionglobal%
	;Run, run_python.bat %x1% %y1% %x2% %y2% %situacionglobal%
	
	; activar esta opcion cuando tenga todas las situaciones estandart hechas
	
	
	/*
		
		
		
		archivo := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\bot\archivo.txt"
		
; Guardar la variable en el archivo
		FileAppend, %stackvalue%, %archivo%
		
		MsgBox, La variable se ha guardado en el archivo.
	*/
	
	
}

resultnoreco(x1, y1, x2, y2, situacion)
{
	
	CoordMode,Pixel,Screen

	;MsgBox, mesa:, %situacionglobal%

	x1b := Round(x1 + (ancho * 0.455))
	y1b := Round(y1 + (alto * 0.7755))
	x2b := Round(x1b + (ancho * 0.07))
	y2b := Round(y1b + (alto * 0.04187))
	
	;MsgBox, %x1b% %y1b% %x2b% %y2b%
	;Run, pythonw CaptureScreenshot.pyw %x1b% %y1b% %x2b% %y2b%, , Hide ;toma foto de la mesa
	ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*130 %rutaimg%img\time1.bmp
	verrorlevel := ErrorLevel
	
	;MsgBox, aquiii%ErrorLevel%
	posx := x
	posy := y

	Run, pythonw CaptureScreenshot.pyw %x1% %y1% %x2% %y2% %situacionglobal%, , Hide ;toma foto de la mesa
	

	
	if(ErrorLevel = 0)
		{
		    
			
		    StartTime := A_TickCount
		    while ((ErrorLevel != 1) && ((A_TickCount - StartTime) <= 10000))  ; continuar hasta que ErrorLevel sea 1 o hayan pasado 10 segundos
		    {
		        ImageSearch,x,y,%x1b%,%y1b%,%x2b%,%y2b%,*150 %rutaimg%img\time1.bmp
		    	;MsgBox, vamos a espera actue en el flop

		        Sleep, 100  ; dormir por un corto tiempo para evitar la utilización excesiva de la CPU
		        ;MsgBox, ESPERAMOS A QUE TERMINEMOS DE ACTUAR %ErrorLevel%
		    }
		    ; el bucle ha terminado, por lo que ErrorLevel debe ser 1 o debieron haber pasado 10 segundos
		}
	
	
	
}



popupreview(stackvalue, mesa, mano, situacionfinal)
{
	
	
	
	posx := 1300
	posy := 1000
	
	tamanox := 450
	tamanoy := 100
	
	;MsgBox, %mano%
	;MsgBox, %posx% %posy% %var1% %var2% %tamanox% %tamanoy% %var3% %mano%
	
	Run, pythonw popup.pyw %posx% %posy% %mesa% %stackvalue% %tamanox% %tamanoy% %situacionfinal% %mano%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}


popupreviewflop(stackefect, mano, flop, situacionglobal ,situacionfinal)
{
	posx := 1300
	posy := 1000
	
	tamanox := 450
	tamanoy := 100
	
	;MsgBox, %stackefect%, %mano%, %flop%, %situacionglobal% ,%situacionfinal%
	;MsgBox, %posx% %posy% %var1% %var2% %tamanox% %tamanoy% %var3% %mano%
	
	;Run, pythonw popupflop.pyw %posx% %posy% %mesa% %stackefect% %tamanox% %tamanoy% %situacionfinal% %mano%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 

	; Definir la posición de la ventana
	posX := 1350
	posY := 700

	; Crear la ventana
	Gui, Add, Text,, % "stackefect: " stackefect
	Gui, Add, Text,, % "mano: " mano
	Gui, Add, Text,, % "situacionfinal: " situacionfinal
	Gui, Add, Text,, % "flop: " flop
	Gui, Add, Button, gOK, OK

	; Mostrar la ventana en la posición especificada
	Gui, Show, x%posX% y%posY%, Ventana de Variables

	; Configurar un temporizador para cerrar la ventana después de 10 segundos (10000 milisegundos)
	SetTimer, AutoClose, 10000
	Return

	; Manejar el clic en el botón OK
	OK:
	GuiClose:
	    Gui, Destroy
	    

	; Cerrar la ventana automáticamente
	AutoClose:
	    Gui, Destroy
	    
	Return



}

orp3value(x1, y1, x2, y2)
{

	
	
	;p3()
	;Msgbox, %x1%, %y1%, %x2%, %y2%
	;MsgBox, %x1p%
	;ImageSearch,x,y,%x1p%,%y1p%,%x2p%,%y2p%,*125 %rutaimg%img\dealer3.png
	;Run, pythonw CaptureScreenshot.pyw %x1p% %y1p% %x2p% %y2p%, , Hide ;toma foto de la mesa
	;MsgBox, %ErrorLevel%
	
	
	x1stack := x1+565
	y1stack := y1+221
	x2stack := 54
	y2stack := 24
	x2stackfoto :=x1stack+x2stack
	y2stackfoto :=y1stack+y2stack
	coords := [x1stack, y1stack, x2stack, y2stack]
	orp3 := OCR(coords)
	orp3 := StrReplace(orp3, ",", ".")
	orp3 := StrReplace(orp3, ",", ".")
	orp3 := StrReplace(orp3, """", "")
	orp3 := StrReplace(orp3, "[^0-9.]", "")
	orp3 := RegExReplace(orp3, "[^0-9.]")
	
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, %orp3%
	
	
	if(orp3 = "")
	{
					;stackvalue := 0 ; Inicializar stackvalue
		
		Loop, 23
		{
			
					;MsgBox, %x1%, %y1%, %x2%, %y2%
			ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *175 %rutaimg%img\numerosor\%A_Index%.png
			
			if (ErrorLevel = 0)
			{
				orp3 := A_Index
				break  ; Salir del bucle si se encuentra el archivo
			}
		}
	}
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, %orp3%
	
	
	if(orp3 = "")
	{
		restop3value(x1, y1, x2, y2)
	}

	return orp3
}


restop3value(x1, y1, x2, y2)
{
	
	
		;MsgBox, adsad
	x1stack := x1+659
	y1stack := y1+195
	x2stack := 45
	y2stack := 24
	x2stackfoto :=x1stack+x2stack
	y2stackfoto :=y1stack+y2stack
	ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *175 %rutaimg%img\numerosstack\0.png
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, encontrams 0 grey %ErrorLevel%
	verrorlevel := ErrorLevel
	
	if (verrorlevel = 0)
	{
		restop3 := 0
		;MsgBox, %restop3%
		
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *150 %rutaimg%img\numerosstack\0g.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 green %verrorLevel%
		if (verrorlevel = 0)
		{
			restop3 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *150 %rutaimg%img\numerosstack\0r.png
		verrorlevel := ErrorLevel
		;MsgBox, encontramos 0 red %verrorLevel%
		if (verrorlevel = 0)
		{
			restop3 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *150 %rutaimg%img\numerosstack\0y.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 yelow %verrorLevel%
		if (verrorlevel = 0)
		{
			restop3 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *150 %rutaimg%img\numerosstack\0p.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 pink %verrorLevel%
		if (verrorlevel = 0)
		{
			restop3 := 0
			verrorlevel := 0
			
		}
		
	}
	/*
	if (verrorlevel = 1)
	{
		
		Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
		
		x1stack := x1+168
		y1stack := y1+220
		x2stack := 55
		y2stack := 30
		x2stackfoto :=x1stack+x2stack
		y2stackfoto :=y1stack+y2stack
		Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
		Run, pythonw CaptureScreenshot.pyw %x1% %y1% %x2% %y2%, , Hide ;toma foto del stackefectivo

			;MsgBox, el resto es %restop3% 
			;MsgBox, %orp3%
	}
	*/
		;MsgBox, el resto es %restop3% 

		return restop3
}

orp2value(x1, y1, x2, y2)
{
	
	
	;MsgBox, ENTRAMOS
	
	x1stack := x1+152
	y1stack := y1+220
	x2stack := 55
	y2stack := 30
	x2stackfoto :=x1stack+x2stack
	y2stackfoto :=y1stack+y2stack
	coords := [x1stack, y1stack, x2stack, y2stack]
	orp2 := OCR(coords)
	orp2 := StrReplace(orp2, ",", ".")
	orp2 := StrReplace(orp2, ",", ".")
	orp2 := StrReplace(orp2, ",", ".")
	orp2 := StrReplace(orp2, """", "")
	orp2 := StrReplace(orp2, "[^0-9.]", "")
	orp2 := RegExReplace(orp2, "[^0-9.]")
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, orp2 dentro funciones, %orp2%
	/*
		x1stack := x-60
		y1stack := y-25
		x2stack := 55
		y2stack := 18
		x2stackfoto :=x1stack+x2stack
		y2stackfoto :=y1stack+y2stack
		coords := [x1stack, y1stack, x2stack, y2stack]
		restop2 := OCR(coords)
		restop2 := StrReplace(restop2, ",", ".")
	;Run, pythonw CaptureScreenshotgrey.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
		
		
		
		
		if(restop2<0.0001)
		{
			ImageSearch,x,y,%x1stack%,%y1stack%,%x2stackfoto%,%y2stackfoto%,*50 %rutaimg%img\numerosstack\0.png
			if(ErrorLevel = 0)
			{
				restop2 = 0
			}
			ImageSearch,x,y,%x1stack%,%y1stack%,%x2stackfoto%,%y2stackfoto%,*50 %rutaimg%img\numerosstack\00.png
			if(ErrorLevel = 0)
			{
				restop2 = 00
			}
			
			
		}
		
	*/
	if(orp2 = "")
	{
					;stackvalue := 0 ; Inicializar stackvalue
		
		Loop, 23
		{
			
					;MsgBox, %x1%, %y1%, %x2%, %y2%
			ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *150 %rutaimg%img\numerosor\%A_Index%.png
			
			if (ErrorLevel = 0)
			{
				orp2 := A_Index
				break  ; Salir del bucle si se encuentra el archivo
			}
		}
	}
	
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, %orp2%
	

	return orp2
	
}

restop2value(x1, y1, x2, y2)
{
	

		;MsgBox, entramos
	x1stack := x1+85
	y1stack := y1+196
	x2stack := 40
	y2stack := 21
	x2stackfoto :=x1stack+x2stack
	y2stackfoto :=y1stack+y2stack
	ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0.png
	;Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
	;MsgBox, encontrams 0 grey %ErrorLevel%
	verrorlevel := ErrorLevel
	
	if (verrorlevel = 0)
	{
		restop2 := 0
		
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0g.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 green %verrorLevel%
		if (verrorlevel = 0)
		{
			restop2 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0r.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 red %verrorLevel%
		if (verrorlevel = 0)
		{
			restop2 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0y.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 yellow %verrorLevel%
		if (verrorlevel = 0)
		{
			restop2 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0o.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 pink %verrorLevel%
		if (verrorlevel = 0)
		{
			restop2 := 0
			verrorlevel := 0
			
		}
		
	}
	if (verrorlevel = 1)
	{
		ImageSearch, x, y, %x1stack%, %y1stack%, %x2stackfoto%, %y2stackfoto%, *140 %rutaimg%img\numerosstack\0p.png
		verrorlevel := ErrorLevel
			;MsgBox, encontramos 0 pink %verrorLevel%
		if (verrorlevel = 0)
		{
			restop2 := 0
			verrorlevel := 0
			
		}
		
	}

	if (verrorlevel = **)
	{
		
		
		Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
		x1stack := x1+168
		y1stack := y1+220
		x2stack := 55
		y2stack := 30
		x2stackfoto :=x1stack+x2stack
		y2stackfoto :=y1stack+y2stack
		
		Run, pythonw CaptureScreenshot.pyw %x1stack% %y1stack% %x2stackfoto% %y2stackfoto%, , Hide ;toma foto del stackefectivo
			;MsgBox, el resto es %restop3% 
			;MsgBox, %orp3%
	}

		;MsgBox, el resto es %restop2% 
		return restop2
}







popupmesa(mesa)
{
	
	
	xmesa := 922
	ymesa := 180
	
	;MsgBox, %mesa%
	
	tamanox := 40
	tamanoy := 30
	
	Run, pythonw popupsimplemesa.pyw %xmesa% %ymesa% %mesa% %tamanox% %tamanoy%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
	
	return
}


p3(x1, y1, x2, y2, alto, ancho)
{
	global x1p, y1p, x2p, y2p
	CoordMode,Pixel,Screen

	x1p := Round(x1 + (ancho*0.7087))  
	y1p := Round(y1 + (alto*0.2847))  
	x2p := Round(x1 + (ancho*0.93556))
	y2p := Round(y1 + (alto*0.4271))
	
	/*
	x1p := x1 + 550
	y1p := y1 + 170
	x2p := x2 - 50
	y2p := y1 + 250
	*/
	resultado := {}
	resultado.x1p := x1p
	resultado.y1p := y1p
	resultado.x2p := x2p
	resultado.y2p := y2p
	
	return resultado
}

p3color(x1, y1, x2, y2, alto, ancho)
{
	global x1p, y1p, x2p, y2p
	
	p3(x1, y1, x2, y2, alto, ancho)

	p3 := "fish"
	
	;MsgBox, %x1p%, %y1p%, %x2p%, %y2p%
	;Run, pythonw CaptureScreenshot.pyw %x1p% %y1p% %x2p% %y2p%, , Hide ;toma foto de la mesa
	ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2regred.png
	
	if (ErrorLevel = 0)
	{
		;Msgbox, p2 es rojo %ErrorLevel%
		p3 := "reg"
	}
	else if (ErrorLevel != 0)
	{
		ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishgreen.png

		
		if (ErrorLevel = 0)
		{
			p3 := "fish"
		}
		else if (ErrorLevel != 0)
		{
			ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishpink.png
			
			if (ErrorLevel = 0)
			{
				p3 := "reg"
			}
			else if (ErrorLevel != 0)
			{
				ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishpinkdark.png
				
				if (ErrorLevel = 0)
				{
					p3 := "reg"
				}
				else if (ErrorLevel != 0)
				{
					ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2regorange.png
					
					if (ErrorLevel = 0)
					{
						p3 := "reg"
					}
					else if (ErrorLevel != 0)
					{
						ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2regyellow.png
						
						if (ErrorLevel = 0)
						{
							p3 := "reg"
						}
						else if (ErrorLevel != 0)
						{
							ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2fishblue.png.
							
							if (ErrorLevel = 0)
							{
								p3 := "fish"
							}
							else if (ErrorLevel != 0)
							{
								ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2fishbluedark.png
								
								if (ErrorLevel = 0)
								{
									p3 := "fish"
								}
							}
						}
					}
				}
			}
		}
	}
	
	return p3
}

p3colorpixel(x1, y1, x2, y2)
{
	global x1pc, y1pc, x2pc, y2pc
	CoordMode,Pixel,Screen
	
	p3(x1, y1, x2, y2, alto, ancho)

	p3 := "fish"
	
	regrojo := "0xBB0405" 
	PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regrojo%, 3, Fast RGB
	
	if (ErrorLevel = 0)
	{
		;Msgbox, p2 es rojo %ErrorLevel%
		p3 := "reg"
	}
	else if (ErrorLevel != 0)
	{
		fishgreen := "0x3DA429" 
		PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishgreen%, 3, Fast RGB
		
		if (ErrorLevel = 0)
		{
			p3 := "fish"
		}
		else if (ErrorLevel != 0)
		{
			regpink := "0xAE3DF1" 
			PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regpink%, 3, Fast RGB
			
			if (ErrorLevel = 0)
			{
				p3 := "reg"
			}
			else if (ErrorLevel != 0)
			{
				pinkdark := "0x441261" 
				PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %pinkdark%, 3, Fast RGB
				
				if (ErrorLevel = 0)
				{
					p3 := "reg"
				}
				else if (ErrorLevel != 0)
				{
					regorange := "0xC9690A" 
					PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regorange%, 3, Fast RGB
					
					if (ErrorLevel = 0)
					{
						p3 := "reg"
					}
					else if (ErrorLevel != 0)
					{
						regyelow := "0xB8A113" 
						PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regyelow%, 3, Fast RGB
						
						if (ErrorLevel = 0)
						{
							p3 := "reg"
						}
						else if (ErrorLevel != 0)
						{
							fishblue := "0x0F4E66" 
							PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishblue%, 3, Fast RGB
							
							if (ErrorLevel = 0)
							{
								p3 := "fish"
							}
							else if (ErrorLevel != 0)
							{
								fishbluedark := "0x13204C" 
								PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishbluedark%, 3, Fast RGB
								
								if (ErrorLevel = 0)
								{
									p3 := "fish"
								}
							}
						}
					}
				}
			}
		}
	}
	
	return p3
}




p3c(x1, y1, x2, y2)
{
	global x1pc, y1pc, x2pc, y2pc
	CoordMode,Pixel,Screen
	

	x1pc := x1 + 665
	y1pc := y1 + 190
	x2pc := x1 + 685
	y2pc := y1 + 200
	
	
	
	resultado := {}
	resultado.x1p := x1pc
	resultado.y1p := y1pc
	resultado.x2p := x2pc
	resultado.y2p := y2pc
	
	return resultado
	
	;ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *125 %rutaimg%img\dealer2.png
	;MsgBox, dealer en p2 %x% %y%
	;MsgBox  x1=%x1%, y1=%y1%, x2=%x2%, y2=%y2%
	;MsgBox  x1=%x1p%, y1=%y1p%, x2=%x2p%, y2=%y2p%
	;MsgBox, x1 %x1c% y1 %y1c% x2 %x2c% y2 %y2c%
}


p2(x1, y1, x2, y2, alto, ancho)
{
	global x1p, y1p, x2p, y2p
	CoordMode,Pixel,Screen

	x1p := Round(x1 + (ancho*0.0644))  
	y1p := Round(y1 + (alto*0.2847))  
	x2p := Round(x1 + (ancho*0.3028))
	y2p := Round(y1 + (alto*0.4271))
	
	/*
	x1p := x1+50
	y1p := y1+170
	x2p := x1 +235
	y2p := y1 +255

	*/
	
	resultado := {}
	resultado.x1p := x1p
	resultado.y1p := y1p
	resultado.x2p := x2p
	resultado.y2p := y2p

	return resultado
	
	;ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *125 %rutaimg%img\dealer2.png
	;MsgBox, dealer en p2 %x% %y%
	;MsgBox  x1=%x1%, y1=%y1%, x2=%x2%, y2=%y2%
	;MsgBox  x1=%x1p%, y1=%y1p%, x2=%x2p%, y2=%y2p%
	;MsgBox, x1 %x1c% y1 %y1c% x2 %x2c% y2 %y2c%
}

orp(x1, y1, x2, y2, alto, ancho)
{

	CoordMode,Pixel,Screen

	x1p2or := Round(x1 + (ancho*0.215)+6)  
	y1p2or := Round(y1 + (alto*0.3666)+12)  
	x2p2or := Round(x1 + (ancho*0.25555))
	y2p2or := Round(y1 + (alto*0.40128)+8)


	x1p1or := Round(x1 + (ancho*0.49876))  
	y1p1or := Round(y1 + (alto*0.629713))  
	x2p1or := Round(x1 + (ancho*0.5666))
	y2p1or := Round(y1 + (alto*0.663))

	x1p3or := Round(x1 + (ancho*0.74074))  
	y1p3or := Round(y1 + (alto*0.36597))  
	x2p3or := Round(x1 + (ancho*0.79382))
	y2p3or := Round(y1 + (alto*0.40128))


	x1cartas := Round(x1 + (ancho*0.436))  
	y1cartas := Round(y1 + (alto*0.68))  
	x2cartas := Round(x1 + (ancho*0.56701))
	y2cartas := Round(y1 + (alto*0.74))

	;MsgBox % "x1cartas: " . x1cartas . "`ny1cartas: " . y1cartas . "`nx2cartas: " . x2cartas . "`ny2cartas: " . y2cartas

	
	;Run, pythonw CaptureScreenshot.pyw %x1p1or% %y1p1or% %x2p1or% %y2p1or%, , Hide ;toma foto de la mesa
	
	/*
	x1p := x1+50
	y1p := y1+170
	x2p := x1 +235
	y2p := y1 +255

	*/
	
	resultado := {}
	resultado.x1p2or := x1p2or
	resultado.y1p2or := y1p2or
	resultado.x2p2or := x2p2or
	resultado.y2p2or := y2p2or

	resultado.x1p1or := x1p1or
	resultado.y1p1or := y1p1or
	resultado.x2p1or := x2p1or
	resultado.y2p1or := y2p1or

	resultado.x1p3or := x1p3or
	resultado.y1p3or := y1p3or
	resultado.x2p3or := x2p3or
	resultado.y2p3or := y2p3or


	resultado.x1cartas := x1cartas
	resultado.y1cartas := y1cartas
	resultado.x2cartas := x2cartas
	resultado.y2cartas := y2cartas

	return resultado
}

p2c(x1, y1, x2, y2)
{
	global x1pc, y1pc, x2pc, y2pc
	CoordMode,Pixel,Screen
	

	x1pc := x1+80
	y1pc := y1+190
	x2pc := x1 +100
	y2pc := y1 +200
	
	
	
	resultado := {}
	resultado.x1p := x1pc
	resultado.y1p := y1pc
	resultado.x2p := x2pc
	resultado.y2p := y2pc
	
	return resultado
	
	;ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *125 %rutaimg%img\dealer2.png
	;MsgBox, dealer en p2 %x% %y%
	;MsgBox  x1=%x1%, y1=%y1%, x2=%x2%, y2=%y2%
	;MsgBox  x1=%x1p%, y1=%y1p%, x2=%x2p%, y2=%y2p%
	;MsgBox, x1 %x1c% y1 %y1c% x2 %x2c% y2 %y2c%
}
p2move()
{ 
	
	
	p2(x1, y1, x2, y2, alto, ancho)
	;MsgBox, %x1p%
	ImageSearch,x,y,%x1p%,%y1p%,%x2p%,%y2p%,*125 %rutaimg%img\dealer2.png
	;Run, pythonw CaptureScreenshot.pyw %x1p% %y1p% %x2p% %y2p%, , Hide ;toma foto de la mesa
	;MsgBox, %ErrorLevel%
	x1p := x+28
	y1p := y
	x2stack := 55
	y2stack := 30
	x2p :=x1p+x2stack
	y2p :=y1p+y2stack
}

p2color(x1, y1, x2, y2, alto, ancho)
{
	
	global x1p, y1p, x2p, y2p
	
	p2(x1, y1, x2, y2, alto, ancho)

	p2 := "fish"
	
	;MsgBox, %x1p%, %y1p%, %x2p%, %y2p%
	;Run, pythonw CaptureScreenshot.pyw %x1p% %y1p% %x2p% %y2p%, , Hide ;toma foto de la mesa
	ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2regred.png
	
	if (ErrorLevel = 0)
	{
		;Msgbox, p2 es rojo %ErrorLevel%
		p2 := "reg"
	}
	else if (ErrorLevel != 0)
	{
		ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishgreen.png
		
		if (ErrorLevel = 0)
		{
			p2 := "fish"
		}
		else if (ErrorLevel != 0)
		{
			ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishpink.png
			
			if (ErrorLevel = 0)
			{
				p2 := "reg"
			}
			else if (ErrorLevel != 0)
			{
				ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2fishpinkdark.png
				
				if (ErrorLevel = 0)
				{
					p2 := "reg"
				}
				else if (ErrorLevel != 0)
				{
					ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2regorange.png
					
					if (ErrorLevel = 0)
					{
						p2 := "reg"
					}
					else if (ErrorLevel != 0)
					{
						ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *50 %rutaimg%img\p2\p2regyellow.png
						
						if (ErrorLevel = 0)
						{
							p2 := "reg"
						}
						else if (ErrorLevel != 0)
						{
							ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2fishblue.png.
							
							if (ErrorLevel = 0)
							{
								p2 := "fish"
							}
							else if (ErrorLevel != 0)
							{
								ImageSearch, x, y, %x1p%, %y1p%, %x2p%, %y2p%, *25 %rutaimg%img\p2\p2fishbluedark.png
								
								if (ErrorLevel = 0)
								{
									p2 := "fish"
								}
							}
						}
					}
				}
			}
		}
	}
	
	return p2
}

p2colorpixel(x1, y1, x2, y2)
{
	
	global x1pc, y1pc, x2pc, y2pc
	CoordMode,Pixel,Screen

	p2c(x1, y1, x2, y2)
	;Run, pythonw CaptureScreenshot.pyw %x1pc% %y1pc% %x2pc% %y2pc%, , Hide ;toma foto de la mesa
	/*
	fishdesconocido := "0x0B2D3B " 
	PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishdesconocido%, 3, Fast RGB
	MsgBox, p2 es fishdesconocido %ErrorLevel%
	*/
	p2 := "fish"

	regrojo := "0xBB0405" 
	PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regrojo%, 3, Fast RGB
	;MsgBox, p2 es red %ErrorLevel%
	p2 := "reg"
	if(ErrorLevel =1)
		{
			fishgreen := "0x3DA429" 
			PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishgreen%, 3, Fast RGB
			;MsgBox, p2 es green %ErrorLevel%
			p2 := "fish"
			if(ErrorLevel =1)
			{
				regpink := "0xAE3DF1" 
				PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regpink%, 3, Fast RGB
				;MsgBox, p2 es pink %ErrorLevel%
				p2 := "reg"

				if(ErrorLevel =1)
				{
					regyelow := "0xB8A113" 
					PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regyelow%, 3, Fast RGB
					;MsgBox, p2 es yelow %ErrorLevel%
					p2 := "reg"
					if(ErrorLevel =1)
					{
						regorange := "0xC9690A" 
						PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %regorange%, 3, Fast RGB
						;MsgBox, p2 es orange %ErrorLevel%
						p2 := "reg"
						if(ErrorLevel =1)
						{
							pinkdark := "0x441261" 
							PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %pinkdark%, 3, Fast RGB
							;MsgBox, p2 es pinkdark %ErrorLevel%
							p2 := "reg"
							if(ErrorLevel =1)
							{
								fishblue := "0x0F4E66" 
								PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishblue%, 3, Fast RGB
								;MsgBox, p2 es fish blue %ErrorLevel%
								p2 := "fish"
								if(ErrorLevel =1)
								{

									fishbluedark := "0x13204C" 
									PixelSearch, Px, Py, x1pc, y1pc, x2pc, y2pc, %fishbluedark%, 3, Fast RGB
									;MsgBox, p2 es fish bluedark %ErrorLevel%
									p2 := "fish"
								}
							
								
							}
							
						}
						
					}
					
				}
			}
		}

		
	return p2
}

p1(x1, y1, x2, y2, alto, ancho)
{
	;MsgBox, %x1% %y1% %x2% %y2%
	CoordMode,Pixel,Screen


	x1p := Round(x1 + (ancho*0.3737))  
	y1p := Round(y1 + (alto*0.5))  
	x2p := Round(x1 + (ancho*0.5876))
	y2p := Round(y1 + (alto*0.7420))  


	/*
	x1p := x1+290
	y1p := y1+350
	x2p := x2-320
	y2p := y2-165
	*/
	
	resultado := {}
	resultado.x1p := x1p
	resultado.y1p := y1p
	resultado.x2p := x2p
	resultado.y2p := y2p
	
	return resultado
	
}

pbote(x1, y1, x2, y2, alto, ancho)
{
	;MsgBox, %x1% %y1% %x2% %y2%
	CoordMode,Pixel,Screen


	x1p := Round(x1 + (ancho*0.3737))  
	y1p := Round(y1 + (alto*0.5))  
	x2p := Round(x1 + (ancho*0.5876))
	y2p := Round(y1 + (alto*0.7420)-100)


	/*
	x1p := x1+290
	y1p := y1+350
	x2p := x2-320
	y2p := y2-165
	*/
	
	resultado := {}
	resultado.x1p := x1p
	resultado.y1p := y1p
	resultado.x2p := x2p
	resultado.y2p := y2p
	
	return resultado
	
}

pbotegrande(x1, y1, x2, y2, alto, ancho)
{
	;MsgBox, %x1% %y1% %x2% %y2%
	CoordMode,Pixel,Screen


	x1p := Round(x1 + (ancho*0.3737))  
	y1p := Round(y1 + (alto*0.5)-100)  
	x2p := Round(x1 + (ancho*0.5876))
	y2p := Round(y1 + (alto*0.7420)-200)


	/*
	x1p := x1+290
	y1p := y1+350
	x2p := x2-320
	y2p := y2-165
	*/
	
	resultado := {}
	resultado.x1p := x1p
	resultado.y1p := y1p
	resultado.x2p := x2p
	resultado.y2p := y2p
	
	return resultado
	
}

rango_OR(rango_or) ;Convertimos un rango suited y offsuited en todas las combinaciones posibles
{

	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	

	
	;rangos limp sbvsbb_3h_Reg
   	manosPoker["BBvsSB_LIMP_3H_reg+25_LIMP"] := "55-33,AJo-ATo,A4o-A3o,K5o-K2o,Q9o,Q7o-Q5o,JTo-J7o,T9o,T7o,96o,86o,A4s,K7s-K3s,QJs-Q8s,Q6s-Q4s,J9s-J8s,J6s,T8s-T7s,T3s-T2s,98s-97s,94s-92s,87s-86s,84s,76s-75s,73s,54s,42s"
   	manosPoker["BBvsSB_LIMP_3H_reg_19-23_LIMP"] := "77,55-44,AQo-ATo,KJo,K6o-K2o,QTo,Q8o-Q5o,JTo-J9o,J7o,T9o,98o-97o,87o-86o,76o,65o,A6s-A2s,K9s-K3s,QJs-Q5s,J9s-J6s,T8s-T6s,T2s,98s-97s,94s-92s,86s-85s,83s,75s,65s,53s,43s-42s"
	manosPoker["BBvsSB_LIMP_3H_reg_16-19_LIMP"] := "AKo,K4o-K2o,Q6o-Q5o,JTo-J9o,J7o,T9o,T7o,98o,86o,76o,AJs,A4s,K9s-K8s,K6s-K5s,K3s-K2s,QTs-Q7s,Q5s-Q3s,J9s-J7s,J2s,T6s,T3s-T2s,98s,94s-93s,84s,75s,54s,43s"
	manosPoker["BBvsSB_LIMP_3H_reg_14-16_LIMP"] := "77-55,K3o-K2o,Q8o,Q6o-Q5o,JTo-J9o,J7o,T9o,T7o,98o-97o,86o,76o,AJs,A4s-A3s,K9s-K8s,K5s,K3s-K2s,QJs-Q9s,Q7s,Q3s-Q2s,J9s-J6s,J2s,T6s,T2s,95s-93s,85s-84s,74s,64s-63s,53s-52s,42s"
	manosPoker["BBvsSB_LIMP_3H_reg_12-14_LIMP"] := "77-66,K2o,Q6o-Q5o,J9o,J7o,T9o,T7o,98o-97o,AKs,ATs,A4s,KTs,K2s,QTs-Q9s,Q4s-Q2s,J9s,J6s,J2s,T6s,T2s,94s,84s,74s,64s-63s,53s-52s"
	

	;rangos sbvsbb_hu_limp
	manosPoker["SBvsBB_HU_LIMP_reg+25_LIMP"] := "66-22,ATo-A7o,A5o-A4o,A2o,KJo-KTo,K7o-K6o,K3o-K2o,QTo,Q8o-Q7o,Q4o-Q2o,J9o,J5o-J2o,T9o-T8o,T5o-T2o,98o,95o-92o,87o,85o-83o,75o-73o,63o,53o-52o,43o,A8s,A6s-A5s,KTs,K4s-K2s,QJs-QTs,Q7s-Q2s,JTs-J9s,J7s-J2s,T8s-T5s,T3s,97s-96s,87s-85s,76s-74s,72s,65s-64s,54s,52s,42s"







; Consultar el valor de una clave
	clave := rango_or
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

rango_DEFEND(rango_defend) ;Convertimos un rango suited y offsuited en todas las combinaciones posibles
{

	;MsgBox, aqui33333 %rango_defend%
	; Crear el diccionario
		manosPoker := {}
		


   ;BBvsSB_LIMP_3H_reg
   	manosPoker["BBvsSB_LIMP_3H_reg+23_X"] := "A7o-A2o,KTo,K7o-K4o,QJo,Q9o-Q6o,Q3o-Q2o,JTo-J8o,J6o,J4o-J2o,T9o-T8o,T6o,T4o-T2o,98o,96o,94o-93o,87o-85o,83o,76o-74o,72o,65o-62o,54o-52o,43o-42o,A7s-A2s,K9s-K2s,QTs-Q2s,J9s-J2s,T9s-T2s,98s-92s,87s-84s,75s,54s-53s,43s,32s"
   	manosPoker["BBvsSB_LIMP_3H_reg19-23_X"] := "A3o,KJo-KTo,K8o-K7o,K5o-K3o,QTo-Q5o,Q2o,JTo-J8o,J4o-J2o,T9o-T8o,T6o,T4o-T3o,98o-96o,94o-92o,87o-85o,83o-82o,76o-74o,72o,65o-62o,54o-52o,43o-42o,A7s-A2s,K9s-K2s,QTs-Q2s,J9s-J2s,T9s-T2s,98s-92s,87s-82s,75s,65s,54s-52s,43s-42s,32s"
   	manosPoker["BBvsSB_LIMP_3H_reg16-19_X"] := "KJo-K9o,K7o-K4o,QJo-Q6o,JTo-J7o,T9o-T8o,T4o-T2o,98o-96o,94o-93o,87o-85o,83o,75o-72o,65o,63o-62o,54o-53o,43o-42o,A6s-A2s,K8s-K2s,QTs-Q2s,J9s-J2s,T9s-T2s,98s-92s,87s-82s,76s-74s,65s-63s,54s-53s,43s-42s,32s"
   	manosPoker["BBvsSB_LIMP_3H_reg14-16_X"] := "KTo-K9o,K7o-K5o,K3o,QJo-Q6o,Q3o,JTo-J7o,J4o-J2o,T9o-T8o,T5o-T2o,98o-96o,94o-93o,86o-85o,83o,75o-72o,65o-62o,54o-52o,42o,32o,A6s-A2s,K8s-K2s,Q9s-Q2s,J9s-J2s,T9s-T2s,98s-92s,87s-82s,76s-74s,65s-63s,54s-52s,43s-42s,32s"
   	manosPoker["BBvsSB_LIMP_3H_reg12-14_X"] := "KTo-K9o,K7o-K5o,QJo-Q6o,Q3o,JTo-J7o,J4o-J2o,T9o-T7o,T4o,98o-95o,93o,87o-85o,83o-82o,75o-74o,72o,64o-62o,54o-52o,43o-42o,32o,A6s-A2s,K8s-K2s,Q9s-Q2s,J9s-J2s,T8s-T2s,98s-92s,87s-82s,76s-72s,65s-63s,54s-52s,43s-42s,32s"
   

	;rangos bbvssb_hu_limp
	manosPoker["SBvsBB_HU_LIMPreg+23_X"] := "A8o-A7o,A5o-A3o,K7o-K6o,K4o-K2o,Q9o-Q6o,Q4o-Q3o,JTo-J7o,J5o-J3o,T9o-T7o,T5o-T2o,98o-92o,87o-84o,75o,73o,65o-62o,54o-52o,42o,32o,A6s-A2s,K8s-K2s,QTs-Q2s,J9s-J3s,T9s-T4s,98s-97s,95s,93s,87s-86s,84s-82s,75s,73s-72s,65s,54s,42s,32s"




	clave := rango_defend
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}


equity_rango_vs_rango(rango_or, rango_defend, flop)
{


	;convertir el rango inicial en rango con todos los combos flitrados por el flop
	;Convertimos el rando iniciol, manos suited y off, en todas las convinaciones
	rangoini := rango_or
	rangofinal := []
	; Dividir el rango en una matriz de manos individuales
	manos := StrSplit(rangoini, ",")

	; Iterar sobre cada mano y realizar la lógica deseada
	for _, mano in manos {
	    valormanos := rangomanos(mano)
	    ;MsgBox, valor manos %valormanos%
	    ; Dividir la cadena valormanos en un array de manos individuales
	    manosIndividuales := StrSplit(valormanos, ",")
	    ; Iterar sobre cada mano individual y añadirla a rangofinal
	    for index, manoIndividual in manosIndividuales {
	        rangofinal.Push(manoIndividual)
	    }
	}

	;MsgBox, % "Número de elementos rango or: " . rangofinal.MaxIndex()

	

	nuevaFlop := ""
    Loop, Parse, flop
    {
        carta := SubStr(A_LoopField, 1, 1)
        palo := SubStr(A_LoopField, 2)
        nuevaCarta := carta . palo
        nuevaFlop .= nuevaCarta
        if (A_Index = 2 || A_Index = 4)
            nuevaFlop .= " "
    }

    
   	flop := nuevaFlop

   	;MsgBox, % flop

	cartasFlop := StrSplit(flop, " ")

	; Filtrar rangofinal para eliminar manos que contienen cartas del flop, si en el flop esta el Ah, no podemos tener Ah7d
	rangofinalFiltrado := []
	for index, mano in rangofinal {
	    contieneCartaFlop := false
	    for _, carta in cartasFlop {
	        if (InStr(mano, carta)) {
	            contieneCartaFlop := true
	            break
	        }
	    }
	    if (!contieneCartaFlop) {
	        rangofinalFiltrado.Push(mano)
	    }
	}

	;MsgBox, % "Número de elementos rango or filtrado: " . rangofinalFiltrado.MaxIndex()

	rango_or := rangofinalFiltrado

	rango_or_filtrado := ""

	; Recorre el array y concatena cada elemento a la cadena
	Loop, % rangofinalFiltrado.MaxIndex()
	{
	    ; Añade el elemento actual al final de la cadena
	    rango_or_filtrado .= rangofinalFiltrado[A_Index] . ","
	}

	rango_or_filtrado := RTrim(rango_or_filtrado, ", ")


	rango_or_list := rango_or_filtrado
	;MsgBox, %rango_or_list%


	rangoini := rango_defend
	rangofinal := []
	; Dividir el rango en una matriz de manos individuales
	manos := StrSplit(rangoini, ",")

	; Iterar sobre cada mano y realizar la lógica deseada
	for _, mano in manos {
	    valormanos := rangomanos(mano)
	    ;MsgBox, valor manos %valormanos%
	    ; Dividir la cadena valormanos en un array de manos individuales
	    manosIndividuales := StrSplit(valormanos, ",")
	    ; Iterar sobre cada mano individual y añadirla a rangofinal
	    for index, manoIndividual in manosIndividuales {
	        rangofinal.Push(manoIndividual)
	    }
	}

	;MsgBox, % "Número de elementos rango defend: " . rangofinal.MaxIndex()

	

	; Filtrar rangofinal para eliminar manos que contienen cartas del flop, si en el flop esta el Ah, no podemos tener Ah7d
	rangofinalFiltrado := []
	for index, mano in rangofinal {
	    contieneCartaFlop := false
	    for _, carta in cartasFlop {
	        if (InStr(mano, carta)) {
	            contieneCartaFlop := true
	            break
	        }
	    }
	    if (!contieneCartaFlop) {
	        rangofinalFiltrado.Push(mano)
	    }
	}

	;MsgBox, % "Número de elementos rango defend filtrado: " . rangofinalFiltrado.MaxIndex()

	rango_defend := rangofinalFiltrado

	rango_defend_filtrado := ""

	; Recorre el array y concatena cada elemento a la cadena
	Loop, % rangofinalFiltrado.MaxIndex()
	{
	    ; Añade el elemento actual al final de la cadena
	    rango_defend_filtrado .= rangofinalFiltrado[A_Index] . ","
	}

	rango_defend_filtrado := RTrim(rango_defend_filtrado, ", ")

	rango_defend_list := rango_defend_filtrado
	;MsgBox, rango_defend_filtrado %rango_defend_filtrado%

	flop := StrReplace(flop, " ", ",")
	;MsgBox, flop %flop%
	;Runwait, cmd /k python rango_vs_rango_paralelizacion.py %rango_or_filtrado% %rango_defend_filtrado% %flop%, , UseErrorLevel y que el script de python reciba las variables

	resultado := {}
	resultado.rango_or := rango_or
	resultado.rango_or_list := rango_or_list
	resultado.rango_defend := rango_defend
	resultado.rango_defend_list := rango_defend_list
	return resultado

}



tipos_de_manos(rango_or_list, flop, mesa, situ)
{

	;MsgBox, situ, %situ%
	quads := []
	fullhouse := []
	flush := []
	straight := []
	set := []
	dobles := []
	overpair := []
	toppair := []
	middlepair := []
	weakpair := []
	oesd := []
	doblegutshot := []
	gutshot := []
	ahigh := []
	khigh := []
	nomadehand := []

	nuevaFlop := ""
    Loop, Parse, flop
    {
        carta := SubStr(A_LoopField, 1, 1)
        palo := SubStr(A_LoopField, 2)
        nuevaCarta := carta . palo
        nuevaFlop .= nuevaCarta
        if (A_Index = 2 || A_Index = 4)
            nuevaFlop .= " "
    }

   	;MsgBox, %rango_or_list%

   	flop := nuevaFlop

   	;rango_or_list := "QsJs,QsTs,Qs7s,Qs6s,Qs5s,Qs4s,Qs3s"
   	;MsgBox, flop %flop%
  
	Runwait, cmd /k python tipos_de_manos.py "%rango_or_list%" "%flop%" "%mesa%" "%situ%", , UseErrorLevel y que el script de python reciba las variables

	; Iterar sobre cada mano en el rango
	Loop, % rango_or.MaxIndex()
	{
	    ;MsgBox, entramos
	    ; Obtener la mano actual
	    
	    current_hand := rango_or[A_Index]
	    ;MsgBox, %current_hand%
	    
	    ; Ejecutar el script de Python desde la línea de comandos con la mano actual y el flop
	    Runwait, cmd /k python tipos_de_manos.py "%current_hand%" "%flop%", , UseErrorLevel y que el script de python reciba las variables
	    ;RunWait, cmd /c python parejas.py "%current_hand%" "%flop%", , Hide, UseErrorLevel

	    ; Leer el resultado desde el archivo OutputVar.txt
	    FileRead, OutputVar, OutputVar.txt

	    ;MsgBox, %OutputVar%

	    if (OutputVar = "Quads")
	    {
	        quads.Push(current_hand)
	    }
	    if (OutputVar = "Full house")
	    {
	        fullhouse.Push(current_hand)
	    }
	    if (InStr(OutputVar, "Flush")) 
	    {
	        flush.Push(current_hand)
	    }
	    if (OutputVar = "Set")
	    {
	        set.Push(current_hand)
	    }
	    if (OutputVar = "Dobles Parejas")
	    {
	        dobles.Push(current_hand)
	    }

	    if (InStr(OutputVar, "Overpair")) 
	    {
	        overpair.Push(current_hand)
	    }
	    if (InStr(OutputVar, "Top Pair")) 
	    {
	        toppair.Push(current_hand)
	    }
	    if (InStr(OutputVar, "Middle Pair"))  
	    {
	        middlepair.Push(current_hand)
	    }
	    if (InStr(OutputVar, "Weak Pair"))
	    {
	        weakpair.Push(current_hand)
	    }
	    if (InStr(OutputVar, "Straight")) 
	    {
	        straight.Push(current_hand)
	    }

	    if (InStr(OutputVar, "escalera abierta") && !InStr(OutputVar, "Flush"))
	    {
	        oesd.Push(current_hand)
	    }
	    if (InStr(OutputVar, "gutshot") && !InStr(OutputVar, "Flush"))
	    {
	        gutshot.Push(current_hand)
	    }
	    if (InStr(OutputVar, "doble goodshot")  && !InStr(OutputVar, "Flush"))
	    {
	        doblegutshot.Push(current_hand)
	    }
	    if (InStr(OutputVar, "A High"))
	    {
	        ahigh.Push(current_hand)
	    }
	    if (InStr(OutputVar, "K High"))
	    {
	        khigh.Push(current_hand)
	    }
	    if (OutputVar = "")
	    {
	        nomadehand.Push(current_hand)
	    }
	    

	    
	}


	; Imprimir el contenido de rangofinalFiltrado
	;MsgBox, % "Contenido de rangofinalFiltrado: " . contenidoRangofinal

	output := ""

	if (quads.MaxIndex() > 0)
	{
	    output .= "quads: " . quads.MaxIndex() . "`n"
	}

	if (fullhouse.MaxIndex() > 0)
	{
	    output .= "Full house: " . fullhouse.MaxIndex() . "`n"
	}
	if (flush.MaxIndex() > 0)
	{
	    output .= "Flush: " . flush.MaxIndex() . "`n"
	}

	if (straight.MaxIndex() > 0)
	{
	    output .= "Straight: " . straight.MaxIndex() . "`n"
	}

	if (set.MaxIndex() > 0)
	{
	    output .= "Set: " . set.MaxIndex() . "`n"
	}

	if (dobles.MaxIndex() > 0)
	{
	    output .= "Dobles: " . dobles.MaxIndex() . "`n"
	}

	if (overpair.MaxIndex() > 0)
	{
	    output .= "Overpair: " . overpair.MaxIndex() . "`n"
	}

	if (toppair.MaxIndex() > 0)
	{
	    output .= "Top Pair: " . toppair.MaxIndex() . "`n"
	}

	if (middlepair.MaxIndex() > 0)
	{
	    output .= "Middle pair: " . middlepair.MaxIndex() . "`n"
	}

	if (weakpair.MaxIndex() > 0)
	{
	    output .= "Weak pair: " . weakpair.MaxIndex() . "`n"
	}

	if (oesd.MaxIndex() > 0)
	{
	    output .= "OESD: " . oesd.MaxIndex() . "`n"
	}

	if (doblegutshot.MaxIndex() > 0)
	{
	    output .= "Doble Gutshot: " . doblegutshot.MaxIndex() . "`n"
	}

	if (gutshot.MaxIndex() > 0)
	{
	    output .= "Gutshot: " . gutshot.MaxIndex() . "`n"
	}

	if (ahigh.MaxIndex() > 0)
	{
	    output .= "A high: " . ahigh.MaxIndex() . "`n"
	}
	if (khigh.MaxIndex() > 0)
	{
	    output .= "K high: " . khigh.MaxIndex() . "`n"
	}

	; Check if output is not empty before showing the MsgBox
	if (output != "")
	{
	    MsgBox, % output
	}


	if (gutshot.MaxIndex() > 0)
	{
	    output .= "Gutshot: " . gutshot.MaxIndex() . "`n"
	    for index, value in gutshot
	    {
	        output .= "    " . value . "`n"
	    }
	}

	; Al final, mostrar el MsgBox si output no está vacío
	if (output != "")
	{
	    MsgBox, % output
	}

}




;convertir rango flopzilla a rango completo
rango_flopzilla(rango_or)
{
	; Convertir las manos y mostrar resultados
	finalResult := ""
	ranges := StrSplit(rango_or, ",")


	; Punto de control para verificar que las partes de la cadena se han dividido correctamente
	for index, range in ranges {
	    ;MsgBox, Parte %index%: %range%
	}

	for _, range in ranges {
	    result := ConvertHandRange(range)
	    ;MsgBox, Resultado parcial: %result%
	    finalResult .= result . ","
	}

	; Elimina la última coma
	finalResult := Trim(finalResult, ",")

	;MsgBox, 0, Resultados, % "Resultado final: " finalResult

	return finalResult
}

; Define la función para convertir pares de manos
ConvertPairs(manos) {
    ;MsgBox, Procesando pares de manos: %manos%
    rangeParts := StrSplit(manos, "-")
    high := rangeParts[1]
    low := rangeParts[2]

    ; Depuración: Mostrar valores iniciales
    ;MsgBox, Valor alto: %high%`nValor bajo: %low%

    values := ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
    newString := ""

    highPos := 0
    lowPos := 0

    ; Encontrar las posiciones de los valores high y low en el array
    Loop, % values.MaxIndex() {
        if (values[A_Index] = SubStr(high, 1, 1))
            highPos := A_Index
        if (values[A_Index] = SubStr(low, 1, 1))
            lowPos := A_Index
    }

    ; Depuración: Mostrar las posiciones encontradas
    ;MsgBox, Posición de High: %highPos%`nPosición de Low: %lowPos%

    ; Verificar que highPos y lowPos sean válidos
    if (highPos = 0 or lowPos = 0) {
        ;MsgBox, Error: Posiciones no válidas para high o low
        return ""
    }

    ; Recorrer los valores desde high hasta low, incluyendo ambos
    if (highPos > lowPos) {
        Loop, % highPos - lowPos + 1 {
            currentIndex := highPos - A_Index + 1
            newValue := values[currentIndex] . values[currentIndex]
            ; Depuración: Mostrar el índice actual del bucle y el valor calculado
            ;MsgBox, Iteración del bucle: %A_Index%`nValor actual: %values[currentIndex]%
            newString .= newValue
            ; Depuración: Mostrar cada nuevo valor añadido a la cadena
            ;MsgBox, Añadiendo: %newValue%`nCadena Actual: %newString%
            if (A_Index < highPos - lowPos + 1)
                newString .= ","
        }
    } else {
        Loop, % lowPos - highPos + 1 {
            currentIndex := highPos + A_Index - 1
            newValue := values[currentIndex] . values[currentIndex]
            ; Depuración: Mostrar el índice actual del bucle y el valor calculado
            ;MsgBox, Iteración del bucle: %A_Index%`nValor actual: %values[currentIndex]%
            newString .= newValue
            ; Depuración: Mostrar cada nuevo valor añadido a la cadena
            ;MsgBox, Añadiendo: %newValue%`nCadena Actual: %newString%
            if (A_Index < lowPos - highPos + 1)
                newString .= ","
        }
    }

    ;MsgBox, Resultado de pares: %newString%
    return newString
}

; Define la función para convertir rango de manos
ConvertRange(rango) {
    ; MsgBox, Procesando rango de manos: %rango%
    rangeParts := StrSplit(rango, "-")
    high := rangeParts[1]
    low := rangeParts[2]
    highValue := SubStr(high, 2, 1)
    lowValue := SubStr(low, 2, 1)
    prefix := SubStr(high, 1, 1) ; La letra (A, K, Q, J, T, etc.)
    suffix := SubStr(high, 3) ; Puede ser "o", "s" o vacío
    
    values := ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

    highPos := 0
    lowPos := 0

    ; Encontrar las posiciones de los valores en el array
    Loop, % values.MaxIndex() {
        if (values[A_Index] = highValue)
            highPos := A_Index
        if (values[A_Index] = lowValue)
            lowPos := A_Index
    }

    newString := ""
    ; Recorrer los valores desde high hasta low, incluyendo ambos
    if (highPos >= lowPos) {
        Loop, % highPos - lowPos + 1 {
            newValue := prefix values[highPos - A_Index + 1] suffix
            newString .= newValue
            if (A_Index < highPos - lowPos + 1)
                newString .= ","
        }
    } else {
        Loop, % lowPos - highPos + 1 {
            newValue := prefix values[highPos + A_Index - 1] suffix
            newString .= newValue
            if (A_Index < lowPos - highPos + 1)
                newString .= ","
        }
    }

    ; MsgBox, Resultado de rango: %newString%
    return newString
}

; Función para determinar y convertir el rango apropiadamente
ConvertHandRange(range) {
    ;MsgBox, Determinando tipo de rango: %range%
    if (InStr(range, "-")) {
        firstChar := SubStr(range, 1, 1)
        secondChar := SubStr(range, 2, 1)
        if (firstChar = secondChar) {
            ;MsgBox, Se detectó un par de manos: %range%
            return ConvertPairs(range)
        } else {
            ;MsgBox, Se detectó un rango de manos: %range%
            return ConvertRange(range)
        }
    }
    return range
}