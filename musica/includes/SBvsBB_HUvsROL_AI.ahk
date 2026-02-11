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




resultado := SBvsBB_HUvsROL_AI(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

SBvsBB_HUvsROL_AI(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{

	if(p1btn = 0 && p1bet = 1)
	{
	
		
		if(p3stack = "" || StrLen(p3name) < 5)
		{
			
			
			;MsgBox, % orp2
			stackvalue := stackefect
    


			if(p2bet > 3.5)
			{
				;MsgBox, nos a hecho rol allin


				resultado := getcartas2(mesa,mano)

				mano := resultado.mano
				manos := resultado.manos
				situacionglobal := "SB_HUvsROL"
				
				
				if(p2 = "reg")
				{
				
					sbhuvsregrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
				}
				if(p2 = "fish")
				{
					
					sbhuvsfishrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
				}
				
				;MsgBox, %stackvalue%
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    
				ExitApp  
		
			}
			else
			{
				;MsgBox, nos a hecho rol pequeño


				resultado := getcartas2(mesa,mano)

				mano := resultado.mano
				manos := resultado.manos
				situacionglobal := "SB_HUvsROL"
				

				
				if(p2 = "reg")
				{
				
					sbhuvsregrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
				}
				if(p2 = "fish")
				{
					
					sbhuvsfishrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
				}
				
				;MsgBox, %stackvalue%
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    
			}
		}
		else
		{
		
			if(p2stack = "" || StrLen(p2name) < 5)
			{
				
				stackvalue := stackefect
	    
			
				;MsgBox, % orp3


				if(p3bet > 3.5)
				{
					;MsgBox, nos a hecho rol allin


					resultado := getcartas2(mesa,mano)

					mano := resultado.mano
					manos := resultado.manos
					situacionglobal := "SB_HUvsROL"
					
					
					if(p3 = "reg")
					{
					
						sbhuvsregrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					if(p3 = "fish")
					{
						
						sbhuvsfishrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					
					;MsgBox, %stackvalue%
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
	    
					ExitApp  

				
				}
				else
				{
					;MsgBox, nos a hecho rol pequeño


					resultado := getcartas2(mesa,mano)

					mano := resultado.mano
					manos := resultado.manos
					situacionglobal := "SB_HUvsROL"
					
					
					if(p3 = "reg")
					{
					
						sbhuvsregrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					if(p3 = "fish")
					{
						
						sbhuvsfishrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					
					;MsgBox, %stackvalue%
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
	    
				
	
				}
			}

		}
	}
	ExitApp
	
}	






sbhuvsfishrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		


	;MsgBox, auio %stackvalue% %manos%
	
	if (stackvalue < 6)
	{
		valormanos := nashpush(manos)
		
		
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
		
		if (situacionfinal = "SB HU vs FISH NASH ROL AI")
		{
			return
		}

		situacionfinal := "SB HU vs FISH NASH ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

   
	}

	if (stackvalue >= 6 && stackvalue < 8)
	{
		
		if (situacionfinal = "SB HU vs FISH 6-8 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 6-8 BB ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 8 && stackvalue < 11)
	{
		if (situacionfinal = "SB HU vs FISH 8-11 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 8-11 BB ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "SB HU vs FISH 11-14 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 11-14 BB ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 14 && stackvalue < 18)
	{
		if (situacionfinal = "SB HU vs FISH 14-18 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 14-18 BB ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 18 && stackvalue < 1000)
	{
		if (situacionfinal = "SB HU vs FISH 18+ BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 18+ BB ROL AI"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
	}
}








sbhuvsregrolai(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		 

	



	if (stackvalue < 7)
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
		if(situacionfinal = "SB HU vs REG NASH ROL AI")
		{
			return
		}

		
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P4", x1t, y1t, anchot, altot)

		situacionfinal:= "SB HU vs REG NASH ROL AI"
		
		
	}
	
	else if (stackvalue >= 7 && stackvalue < 7.5)
	{
		if (situacionfinal = "SB HU vs REG 7 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 7 BB ROL AI"

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
	else if (stackvalue >= 7.5 && stackvalue < 8.5)
	{
		if (situacionfinal = "SB HU vs REG 8 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 8 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P2", x1t, y1t, anchot, altot)

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
	else if (stackvalue >= 8.5 && stackvalue < 10)
	{
		if (situacionfinal = "SB HU vs REG 9 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 9 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P1", x1t, y1t, anchot, altot)


	}
	else if (stackvalue >= 10 && stackvalue < 12)
	{
		if (situacionfinal = "SB HU vs REG 11 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 11 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 12 && stackvalue < 14)
	{
		if (situacionfinal = "SB HU vs REG 13 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 13 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 14 && stackvalue < 16)
	{
		if (situacionfinal = "SB HU vs REG 15 BB ROL AI")
		{
			return
		}
		situacionfinal := "SB HU vs REG 15 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 16 && stackvalue < 19.5)
	{
		if(situacionfinal = "SB HU vs REG 17 BB ROL AI")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 17 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 19.5 && stackvalue < 22.5)
	{
		if(situacionfinal = "SB HU vs REG 21 BB ROL AI")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 21 BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 22.5 && stackvalue < 1000)
	{
		if(situacionfinal = "SB HU vs REG 25+ BB ROL AI")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 25+ BB ROL AI"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
		
		
	}

}


sbhuvsfishrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		


	;MsgBox, auio %stackvalue% %manos%
	
	if (stackvalue < 6)
	{
		valormanos := nashpush(manos)
		
		
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
		
		if (situacionfinal = "SB HU vs FISH NASH ROL SMALL")
		{
			return
		}

		situacionfinal := "SB HU vs FISH NASH ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

   
	}

	if (stackvalue >= 6 && stackvalue < 8)
	{
		
		if (situacionfinal = "SB HU vs FISH 6-8 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 6-8 BB ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 8 && stackvalue < 11)
	{
		if (situacionfinal = "SB HU vs FISH 8-11 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 8-11 BB ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "SB HU vs FISH 11-14 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 11-14 BB ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 14 && stackvalue < 18)
	{
		if (situacionfinal = "SB HU vs FISH 14-18 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 14-18 BB ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
	}
	
	if (stackvalue >= 18 && stackvalue < 1000)
	{
		if (situacionfinal = "SB HU vs FISH 18+ BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs FISH 18+ BB ROL SMALL"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
	}
}








sbhuvsregrolsmall(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{		 

	



	if (stackvalue < 7)
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
		if(situacionfinal = "SB HU vs REG NASH ROL SMALL")
		{
			return
		}

		
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P4", x1t, y1t, anchot, altot)

		situacionfinal:= "SB HU vs REG NASH ROL SMALL"
		
		
	}
	
	else if (stackvalue >= 7 && stackvalue < 7.5)
	{
		if (situacionfinal = "SB HU vs REG 7 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 7 BB ROL SMALL"

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
	else if (stackvalue >= 7.5 && stackvalue < 8.5)
	{
		if (situacionfinal = "SB HU vs REG 8 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 8 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P2", x1t, y1t, anchot, altot)

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
	else if (stackvalue >= 8.5 && stackvalue < 10)
	{
		if (situacionfinal = "SB HU vs REG 9 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 9 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F2P1", x1t, y1t, anchot, altot)


	}
	else if (stackvalue >= 10 && stackvalue < 12)
	{
		if (situacionfinal = "SB HU vs REG 11 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 11 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 12 && stackvalue < 14)
	{
		if (situacionfinal = "SB HU vs REG 13 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 13 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

	}
	else if (stackvalue >= 14 && stackvalue < 16)
	{
		if (situacionfinal = "SB HU vs REG 15 BB ROL SMALL")
		{
			return
		}
		situacionfinal := "SB HU vs REG 15 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 16 && stackvalue < 19.5)
	{
		if(situacionfinal = "SB HU vs REG 17 BB ROL SMALL")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 17 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 19.5 && stackvalue < 22.5)
	{
		if(situacionfinal = "SB HU vs REG 21 BB ROL SMALL")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 21 BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
		
	}
	else if (stackvalue >= 22.5 && stackvalue < 1000)
	{
		if(situacionfinal = "SB HU vs REG 25+ BB ROL SMALL")
		{
			return
		}
		situacionfinal:= "SB HU vs REG 25+ BB ROL SMALL"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O31", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
		
		
	}

}

