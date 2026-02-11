#include includes\funciones2.ahk
global situacionfinal


posx := A_Args[1]
posy := A_Args[2]
mesa := A_Args[3]
x1 := A_Args[4]
y1 := A_Args[5]
x2 := A_Args[6]
y2 := A_Args[7]
alto := A_Args[8]
ancho := A_Args[9]
x1t := A_Args[10]
y1t := A_Args[11]
anchot := A_Args[12]
altot := A_Args[13]
p2name := A_Args[14]
p2stack := A_Args[15]
p2bet := A_Args[16]
p2btn := A_Args[17]

p3name := A_Args[18]
p3stack := A_Args[19]
p3bet := A_Args[20]
p3btn := A_Args[21]

stackefect := A_Args[22]
p1bet := A_Args[23]
p1btn := A_Args[24]
mano := A_Args[25]
p2 := A_Args[26]
p3 := A_Args[27]
save_img_mesa := A_Args[28]
p2manos_3h := A_Args[29]

p3manos_3h := A_Args[30]
p2vip_3h := A_Args[31]
p2pfr_3h := A_Args[32]
p2_3bet_3h := A_Args[33]

p3vip_3h := A_Args[34]
p3pfr_3h := A_Args[35]
p3_3bet_3h := A_Args[36]

p2_manos_hu_db := A_Args[37]
p2_vip_hu := A_Args[38]
p2_pfr_hu := A_Args[39]
p2_bet_3_hu := A_Args[40]

p3_manos_hu_db := A_Args[41]
p3_vip_hu := A_Args[42]
p3_pfr_hu := A_Args[43]
p3_bet_3_hu := A_Args[44]

;MsgBox, 111 %p3manos_hu% %p3vip_hu% %p3pfr_hu% %p3_3bet_hu%



;MsgBox, %p2manos_3h%

if (p2 = "rojo" || p2 = "morado" || p2 = "amarillo")
{
    p2 := "reg"
}
if (p2 = "gris" || p2 = "verde" || p2 = "azul" || p2 = "negro")
{
    p2 := "fish"
}

if (p3 = "rojo" || p3 = "morado" || p3 = "amarillo")
{
    p3 := "reg"
}
if (p3 = "gris" || p3 = "verde" || p3 = "azul" || p3 = "negro")
{
    p3 := "fish"
}




resultado := SBvsBB_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

SBvsBB_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{

	
    if (p1btn = 0 && p1bet = 0.5)
    {

        if (p2bet = 1)
        {

            if (p3bet = "" && p3stack = "")
            {

                stackvalue := stackefect
              	
                resultado := getcartas2(mesa, mano)
                mano := resultado.mano
                manos := resultado.manos
                situacionglobal := "SB_HU"


                ;MsgBox, % p2
                if (p2 = "reg")
                {
                    sbhuvsreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
                }
                if (p2 = "fish")
                {
                    sbhuvsfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
                }
                result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
                ExitApp  
            }
        }
        else
        {
            if (p3bet = 1)
            {
                if (p2bet = "" && p2stack = "")
                {
                	
                    stackvalue := stackefect
                    resultado := getcartas2(mesa, mano)

		            mano := resultado.mano
		            manos := resultado.manos
				
                 
                    situacionglobal := "SB_HU"
                    
                    if (p3 = "reg")
                    {
                        sbhuvsreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
                    }
                    if (p3 = "fish")
                    {
                        sbhuvsfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
                    }
                    result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu, p2name,p3name)
                    ExitApp  
                }
            }
        }
    }
    if(p1btn = 0 && p1bet = 1 && p2bet <=100 || p1btn = 0 && p1bet = 1 && p3bet <=100 )
	{

		;MsgBox, nos enfretamos a un rol pequeño
		stackvalue := stackefect
              	
        resultado := getcartas2(mesa, mano)
        mano := resultado.mano
        manos := resultado.manos
        situacionglobal := "SB_HUvsROL"


        ;MsgBox, % p3
        if (p2 = "reg" && p2bet > 0|| p3 = "reg" && p3bet > 0)
        {
            sbhuvsreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
        }
        if (p2 = "fish" && p2bet > 0 || p3 = "fish" && p3bet > 0)
        {
        	
            sbhuvsfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
        }
        result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
        ExitApp  
	}
	if(p1btn = 0 && p1bet = 2 && p2bet <=100 && p3stack = "" && p3name = "" || p1btn = 0 && p1bet = 2 && p3bet <=100 && p2stack = "" && p2name = ""  )
	{
		;MsgBox, nos enfretamos a un 3bet
		stackvalue := stackefect
              	
        resultado := getcartas2(mesa, mano)
        mano := resultado.mano
        manos := resultado.manos
        situacionglobal := "SB_HUvs3bet"


        ;MsgBox, % p2
        if (p2 = "reg" && p2bet > 0|| p3 = "reg" && p3bet > 0)
        {
            sbhuvsreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
        }
        if (p2 = "fish" && p2bet > 0 || p3 = "fish" && p3bet > 0)
        {

            sbhuvsfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
        }
        result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
        ExitApp  
	}

    ExitApp
}

sbhuvsfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		
	comprobacion := "entramos en la funcion sbhuvsfish"

	;MsgBox, auio %stackvalue% %manos%
	
	;manos := "43s"
	;stackvalue := 5
	if (stackvalue < 6)
	{
		;MsgBox, entramos aquuiiiii
		valormanos := nashpush(manos)
		
		if (IsNumber(valormanos))
		{
			if (valormanos > stackvalue)
			{
				color := "green"
				popupnashpush(valormanos, color, posx, posy, mesa)
	    
				    ; Verificar si la variable no es un número
				    if (!IsNumber(stackvalue))
				    {
				        ; Salir de la función
				        return
				    }
				movimientos("ALLIN", x1, y1, ancho, alto)


			}
			else
			{
				color := "red"
				popupnashpush(valormanos, color, posx, posy, mesa)
	    
				    ; Verificar si la variable no es un número
				    if (!IsNumber(stackvalue))
				    {
				        ; Salir de la función
				        return
				    }
				movimientos("FOLD", x1, y1, ancho, alto)
			}
		}

		else
		{
			parts := StrSplit(valormanos, "o")  ; Divide la cadena 'var' en un array, usando 'o' como delimitador
			vlongitud := parts.MaxIndex()  ; La longitud del array

			if (vlongitud = 3)
			{
				var1 := parts[1]  ; La primera parte de la cadena, que será '10'
				var2 := parts[2]  ; La segunda parte de la cadena, que será '4'
				var3 := parts[3]  ; La segunda parte de la cadena, que será '4'

				;MsgBox, % var1 var2 var3

				if(var1 > stackvalue && stackvalue > var2)
				{
					color := "green"
					popupnashpush(valormanos, color, posx, posy, mesa)
		    
					    ; Verificar si la variable no es un número
					    if (!IsNumber(stackvalue))
					    {
					        ; Salir de la función
					        return
					    }
					movimientos("ALLIN", x1, y1, ancho, alto)
					
				}
				else
				{
					color := "red"
					popupnashpush(valormanos, color, posx, posy, mesa)
		    
					    ; Verificar si la variable no es un número
					    if (!IsNumber(stackvalue))
					    {
					        ; Salir de la función
					        return
					    }
					movimientos("FOLD", x1, y1, ancho, alto)

				}

				if(var3 > stackvalue)
				{
					color := "green"
					popupnashpush(valormanos, color, posx, posy, mesa)
		    
					    ; Verificar si la variable no es un número
					    if (!IsNumber(stackvalue))
					    {
					        ; Salir de la función
					        return
					    }
					movimientos("ALLIN", x1, y1, ancho, alto)
				}
				else
				{
					color := "red"
					popupnashpush(valormanos, color, posx, posy, mesa)
		    
					    ; Verificar si la variable no es un número
					    if (!IsNumber(stackvalue))
					    {
					        ; Salir de la función
					        return
					    }
					movimientos("FOLD", x1, y1, ancho, alto)
				}
			}
		}
		
		if (situacionfinal = "SB HU vs FISH NASH")
		{
			return
		}

		situacionfinal := "SB HU vs FISH NASH"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

		imagen := 70
		popuptabla(posx, posy, mesa, imagen)

		

   
	}

	if (stackvalue >= 6 && stackvalue < 8)
	{
		
		if (situacionfinal = "SB HU vs FISH 6-8 BB")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 6-8 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

		imagen := 69
		popuptabla(posx, posy, mesa, imagen)

		valormanos := SBfish68(manos)


		if (valormanos = "OS")
		{
			
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORC")
		{
			color := "blue"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			color := "grey"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			color := "orange"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			color := "yellow"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORCS")
		{
			color := "pink"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}

		else if (valormanos = "ORF")
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			color := "white"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("FOLD", x1, y1, ancho, alto)
		}

	}
	
	if (stackvalue >= 8 && stackvalue < 11)
	{
		if (situacionfinal = "SB HU vs FISH 8-11 BB")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 8-11 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)

		imagen := 68
		popuptabla(posx, posy, mesa, imagen)

		valormanos := SBfish811(manos)


		if (valormanos = "OS")
		{
			
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORC")
		{
			color := "blue"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			color := "grey"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			color := "orange"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			color := "yellow"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORCS")
		{
			color := "pink"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}

		else if (valormanos = "ORF")
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			color := "white"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
	
	if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "SB HU vs FISH 11-14 BB")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 11-14 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)

		imagen := 67
		popuptabla(posx, posy, mesa, imagen)

		valormanos := SBfish1114(manos)


		if (valormanos = "OS")
		{
			
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORC")
		{
			color := "blue"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			color := "grey"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			color := "orange"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			color := "yellow"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORCS")
		{
			color := "pink"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}

		else if (valormanos = "ORF")
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			color := "white"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
	
	if (stackvalue >= 14 && stackvalue < 18)
	{
		if (situacionfinal = "SB HU vs FISH 14-18 BB")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 14-18 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)


		imagen := 66
		popuptabla(posx, posy, mesa, imagen)

		valormanos := SBfish1418(manos)


		if (valormanos = "OS")
		{
			
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORC")
		{
			color := "blue"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			color := "grey"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			color := "orange"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			color := "yellow"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORCS")
		{
			color := "pink"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}

		else if (valormanos = "ORF")
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			color := "white"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
	
	if (stackvalue >= 18 && stackvalue < 1000)
	{
		;MsgBox, entramos
		if (situacionfinal = "SB HU vs FISH 18+ BB")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 18+ BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
		
		imagen := 65
		popuptabla(posx, posy, mesa, imagen)

		valormanos := SBfish18(manos)


		if (valormanos = "OS")
		{
			
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORC")
		{
			color := "blue"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			color := "grey"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			color := "orange"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			color := "yellow"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "ORCS")
		{
			color := "pink"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}

		else if (valormanos = "ORF")
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("RAISETO", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			color := "white"
			popupnashpush(valormanos, color, posx, posy, mesa)
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
}








sbhuvsreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		 

	
	


	if (stackvalue < 5.5)
	{

		
		valormanos := nashpush(manos)
		
		if(valormanos > stackvalue)
		{
			color := "green"
			popupnashpush(valormanos, color, posx, posy, mesa)
    
			    ; Verificar si la variable no es un número
			    if (!IsNumber(stackvalue))
			    {
			        ; Salir de la función
			        return
			    }
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else
		{
			color := "red"
			popupnashpush(valormanos, color, posx, posy, mesa)
    
			    ; Verificar si la variable no es un número
			    if (!IsNumber(stackvalue))
			    {
			        ; Salir de la función
			        return
			    }
			movimientos("FOLD", x1, y1, ancho, alto)
			
		}
		if(situacionfinal = "SB HU vs REG NASH")
		{
			
			return
		}

		
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P4", x1t, y1t, anchot, altot)

		situacionfinal:= "SB HU vs REG NASH"
		
		
	}
	else if (stackvalue >= 5.5 && stackvalue < 6)
	{

		if (situacionfinal = "SB HU vs REG 6 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 6 BB"

		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P6", x1t, y1t, anchot, altot)

		valormanos := sbhuvsreg7(manos)

		if (valormanos = "OS")
		{
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LR")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
	else if (stackvalue >= 6 && stackvalue < 7)
	{

		if (situacionfinal = "SB HU vs REG 7 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 7 BB"

		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P5", x1t, y1t, anchot, altot)

		valormanos := sbhuvsreg7(manos)

		if (valormanos = "OS")
		{
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LR")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			movimientos("FOLD", x1, y1, ancho, alto)
		}


	}
	
	else if (stackvalue >= 7 && stackvalue < 7.5)
	{

		if (situacionfinal = "SB HU vs REG 7 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 7 BB"

		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P3", x1t, y1t, anchot, altot)

		valormanos := sbhuvsreg7(manos)

		if (valormanos = "OS")
		{
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LR")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			movimientos("FOLD", x1, y1, ancho, alto)
		}


	}
	else if (stackvalue >= 7 && stackvalue < 8)
	{

		if (situacionfinal = "SB HU vs REG 8 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 8 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P4", x1t, y1t, anchot, altot)

		valormanos := sbhuvsreg8(manos)

		if (valormanos = "OS")
		{
			movimientos("ALLIN", x1, y1, ancho, alto)
		}
		else if (valormanos = "LC")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LR")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LCS")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "LF")
		{
			movimientos("CALL", x1, y1, ancho, alto)
		}
		else if (valormanos = "FOLD")
		{
			movimientos("FOLD", x1, y1, ancho, alto)
		}
	}
	else if (stackvalue >= 8 && stackvalue < 9)
	{

		if (situacionfinal = "SB HU vs REG 9 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 9 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)

		poscionclick("F2P3", x1t, y1t, anchot, altot)
	


	}
	else if (stackvalue >= 9 && stackvalue < 10)
	{

		if (situacionfinal = "SB HU vs REG 10 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 10 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)

		poscionclick("F2P2", x1t, y1t, anchot, altot)
	


	}

	else if (stackvalue >= 10 && stackvalue < 11)
	{
		
		if (situacionfinal = "SB HU vs REG 11 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 11 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P1", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 11 && stackvalue < 12)
	{
		
		if (situacionfinal = "SB HU vs REG 12 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 12 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 12 && stackvalue < 13)
	{
		if (situacionfinal = "SB HU vs REG 13 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 13 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 13 && stackvalue < 15)
	{
		if (situacionfinal = "SB HU vs REG 15 BB")
		{
			return
		}
		situacionfinal := "SB HU vs REG 15 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 15 && stackvalue < 17)
	{
		if(situacionfinal = "SB HU vs REG 17 BB")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 17 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 17 && stackvalue < 21)
	{
		if(situacionfinal = "SB HU vs REG 21 BB")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 21 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 21 && stackvalue < 1000)
	{
		if(situacionfinal = "SB HU vs REG 25+ BB")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 25+ BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
		
		
	}

}


