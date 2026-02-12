; Al inicio del script, comprueba si el archivo "lockfile" existe
/*
Loop
{
   IfNotExist, lockfile
      Break  ; Si no existe, sal del bucle
   Sleep, 100 ; Si existe, duerme un segundo y luego vuelve a comprobar
}

; Crea el archivo "lockfile"
FileAppend,, lockfile




FileReadLine, posx, temp.txt, 3  ; Lee el primer valor del archivo
FileReadLine, posy, temp.txt, 4  ; Lee el segundo valor del archivo
*/

posx := A_Args[1]
posy := A_Args[2]
ancho := A_Args[3]
alto := A_Args[4]
mesa := A_Args[5]
ruta_capture_screenshot := A_Args[6]


;MsgBox, por fuera, %posx% %posy% %ancho% %alto% %mesa% %ruta_capture_screenshot%

cartas(posx, posy, ancho, alto, mesa)


;MsgBox, %stackvalue%


; Al final del script, elimina el archivo "lockfile"
;FileDelete, lockfile



cartas(posx, posy, ancho, alto, mesa)
{
	
	tiempoinicio := A_TickCount
	CoordMode,Pixel,Screen
	;MsgBox, por fuera, %posx% %posy% %ancho% %alto% %mesa% %ruta_capture_screenshot%
	
	;carta 1

	xc1 := Round(posx - (ancho*0.03608))  
	yc1 := Round(posy - (alto*0.1038))  
	xc2 := posx
	yc2 := Round(posy - (alto*0.0536))  

	;MsgBox, %xc1%, %yc1%, %xc2%, %yc2%

	/*
	
	xc1 := posx-28
	yc1 := posy-62
	xc2 := posx
	yc2 := posy-32
	*/

carta1 := "A"


ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\2.png


if (ErrorLevel = 0)
{
    carta1 := "2"

}
else
{
    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *140 %rutaimg%img\baraja\cartas\3.png
    if (ErrorLevel = 0)
    {
        carta1 := "3"
    }
    else
    {
        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\4.png
        if (ErrorLevel = 0)
        {
            carta1 := "4"
        }
        else
        {
            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\5.png
            if (ErrorLevel = 0)
            {
                carta1 := "5"
            }
            else
            {
                ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\6.png
                if (ErrorLevel = 0)
                {
                    carta1 := "6"
                }
                else
                {
                    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\7.png
                    if (ErrorLevel = 0)
                    {
                        carta1 := "7"
                    }
                    else
                    {
                        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\8.png
                        if (ErrorLevel = 0)
                        {
                            carta1 := "8"
                        }
                        else
                        {
                            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *148 %rutaimg%img\baraja\cartas\9.png
                          
                            if (ErrorLevel = 0)
                            {
                            
                                carta1 := "9"
                            }
                            else
                            {
                                ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *140 %rutaimg%img\baraja\cartas\T.png
                                if (ErrorLevel = 0)
                                {
                                    carta1 := "T"
                                }
                                else
                                {
                                    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *130 %rutaimg%img\baraja\cartas\J.png
                                    if (ErrorLevel = 0)
                                    {
                                        carta1 := "J"
                                    }
                                    else
                                    {
                                        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\Q.png
                                        if (ErrorLevel = 0)
                                        {
                                            carta1 := "Q"
                                        }
                                        else
                                        {
                                            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\K.png
                                            if (ErrorLevel = 0)
                                            {
                                                carta1 := "K"
                                            }
                                         
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

	;carta1 := StrReplace(carta1, ".png", "")
	;Runwait, cmd /k save_img.py "%xc1%" "%yc1%" "%xc2%" "%yc2%", , UseErrorLevel
	;Run, pythonw save_img.pyw %xc1% %yc1% %xc2% %yc2%, , Hide ;toma foto de la mesa
	;MsgBox, %carta1%
	

	
	;palo1
	
	xc1 := Round(posx - (ancho*0.00257))  
	yc1 := Round(posy - (alto*0.10385))  
	xc2 := Round(posx + (ancho*0.03221))
	yc2 := Round(posy - (alto*0.05025))  

	/*
	xc1 := posx-2
	yc1 := posy-62
	xc2 := posx+25
	yc2 := posy-30
	*/
	
	;Run, pythonw CaptureScreenshot.pyw %xc1% %yc1% %xc2% %yc2%, , Hide ;toma foto de la mesa
	;MsgBox, stop
	
	palo1 := "C"
	ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *50 %rutaimg%img\baraja\palos1\S.png
	if (ErrorLevel = 0)
	{
	    palo1 := "S"
	}
	else
	{
		ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *50 %rutaimg%img\baraja\palos1\H.png
		if (ErrorLevel = 0)
		{
		    palo1 := "H"
		}
		else
		{
			ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *110 %rutaimg%img\baraja\palos1\D.png
			if (ErrorLevel = 0)
			{

			    palo1 := "D"
			}
		}
	}
	;Run, pythonw CaptureScreenshot.pyw %xc1% %yc1% %xc2% %yc2%, , Hide ;toma foto de la mesa
	;MsgBox, %palo1%
	

	
	;carta 2

	xc1 := Round(posx + (ancho*0.03221))  
	yc1 := Round(posy - (alto*0.10385))  
	xc2 := Round(posx + (ancho*0.06443))
	yc2 := Round(posy - (alto*0.05025))  
	
	/*
	xc1 := posx+25
	yc1 := posy-62
	xc2 := posx+50
	yc2 := posy-32
	*/


;MsgBox, stop

	carta2 := "A"
ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\2.png
if (ErrorLevel = 0)
{
    carta2 := "2"
}
else
{
    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *130 %rutaimg%img\baraja\cartas\3.png
    if (ErrorLevel = 0)
    {
        carta2 := "3"
    }
    else
    {
        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *140 %rutaimg%img\baraja\cartas\4.png
        if (ErrorLevel = 0)
        {
            carta2 := "4"
        }
        else
        {
            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\5.png
            if (ErrorLevel = 0)
            {
                carta2 := "5"
            }
            else
            {
                ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\6.png
                if (ErrorLevel = 0)
                {
                    carta2 := "6"
                }
                else
                {
                    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\7.png
                    if (ErrorLevel = 0)
                    {
                        carta2 := "7"
                    }
                    else
                    {
                        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\8.png
                        if (ErrorLevel = 0)
                        {
                            carta2 := "8"
                        }
                        else
                        {
                            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\9.png
                            if (ErrorLevel = 0)
                            {
                                carta2 := "9"
                            }
                            else
                            {
                                ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *140 %rutaimg%img\baraja\cartas\T.png
                                if (ErrorLevel = 0)
                                {
                                    carta2 := "T"
                                }
                                else
                                {
                                    ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *138 %rutaimg%img\baraja\cartas\J.png
                                    if (ErrorLevel = 0)
                                    {
                                        carta2 := "J"
                                    }
                                    else
                                    {
                                        ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\Q.png
                                        if (ErrorLevel = 0)
                                        {
                                            carta2 := "Q"
                                        }
                                        else
                                        {
                                            ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *145 %rutaimg%img\baraja\cartas\K.png
                                            if (ErrorLevel = 0)
                                            {
                                                carta2 := "K"
                                            }
                                           
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

	;Run, pythonw CaptureScreenshot.pyw %xc1% %yc1% %xc2% %yc2%, , Hide ;toma foto de la mesa
	;MsgBox, %carta2%
	
	
     ;palo2

    xc1 := Round(posx + (ancho*0.05798))  
	yc1 := Round(posy - (alto*0.10385))  
	xc2 := Round(posx + (ancho*0.09664))
	yc2 := Round(posy - (alto*0.08710))  

	/*
	xc1 := posx+45
	yc1 := posy-62
	xc2 := posx+75
	yc2 := posy-52
	*/


	palo2 := "C"
	ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *50 %rutaimg%img\baraja\palos\S.png
	if (ErrorLevel = 0)
	{
	    palo2 := "S"
	}
	else
	{
		ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *50 %rutaimg%img\baraja\palos\H.png
		if (ErrorLevel = 0)
		{
		    palo2 := "H"
		}
		else
		{
			ImageSearch, x, y, %xc1%, %yc1%, %xc2%, %yc2%, *75 %rutaimg%img\baraja\palos\D.png
			if (ErrorLevel = 0)
			{
			    palo2 := "D"
			}
		}
	}
	
	;MsgBox, %palo2%
	
	mano:= carta1 palo1 carta2 palo2
	;MsgBox, % mano
	if(palo1 == palo2)
	{
		manos := carta1 carta2 "s"
	}
	else
	{
		manos := carta1 carta2 "o"
	}
	
	manos := TransformarCarta(manos)


	tiempoFin_archivo := A_TickCount
	duracion_archivo := (tiempoFin_archivo - tiempoinicio) / 1000
	;MsgBox, tiempo retraso archivo %duracion_archivo%
	
	
	resultado := {}
	resultado.mano := mano
	resultado.manos := manos
	
	FileDelete, cartas%mesa%.txt ; Elimina el archivo si ya existe
	File := "cartas" . mesa . ".txt"
	FileAppend, % mano . "`n" . manos . "`n", %File%
	;MsgBox, comprobar cartas.txt
	
	return resultado
	
}

transformarcarta(carta)
{
    ; Obtener el valor y el palo de la carta original
	c1 := SubStr(carta, 1, 1)
	c2 := SubStr(carta, 2, 1)
	c3 := SubStr(carta, 3, 1)
	
    ; Convertir el valor de c1 si corresponde
	if (c1 = "T")
		c11 := 10
	else if (c1 = "J")
		c11 := 11
	else if (c1 = "Q")
		c11 := 12
	else if (c1 = "K")
		c11 := 13
	else if (c1 = "A")
		c11 := 14
	else
		c11 := c1
	
    ; Convertir el valor de c2 si corresponde
	if (c2 = "T")
		c22 := 10
	else if (c2 = "J")
		c22 := 11
	else if (c2 = "Q")
		c22 := 12
	else if (c2 = "K")
		c22 := 13
	else if (c2 = "A")
		c22 := 14
	else
		c22 := c2
	
    ; Verificar y realizar las transformaciones seg�n el valor y el palo
	if (c11 > c22)
		carta := c1 c2 c3
	else
		carta := c2 c1 c3
	
	return carta
}