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

if (p2 = "rojo" || p2 = "morado"|| p2 = "amarillo")
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





resultado := BBvsSB_AI_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)


BBvsSB_AI_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{ 

	

	if(p2btn = 0 && p3stack = "" && p3bet = "")
	{

		if(p2btn = 0 && p3stack = "")
		{	
			
			if(p1bet <= 1)
			{
			
				situacionglobal := "BBvsSB_OS_HU"

				
				stackvalue := stackefect
    


				resultado := getcartas2(mesa, mano)

				mano := resultado.mano
				manos := resultado.manos
			
				
				
				if(p2bet >= (stackvalue *.5)) 
				{
			
					if(p2 == "fish")
					{
						BBvsSB_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					else if(p2 == "reg")
					{
						BBvsSB_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
					}
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    				ExitApp  
			  
			    

				
				}
				else
				{
					
					
					if(p2stack = 0)
					{
						
			
						if(p2 == "fish")
						{
							BBvsSB_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
						}
						else if(p2 == "reg")
						{
							BBvsSB_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
						}
						result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    					ExitApp  
			    
				
						

						
					}
										
				}
			}
		}


	}else
	{

		
		if(p3btn = 0 && p2stack = "" || p3bet > (0.4*stackefect))
		{
			

			if(p3btn = 0 && p2stack = "")
			{

				
				
				if(p1bet <= 1)
				{

					;MsgBox, 1111111111
					situacionglobal := "BBvsSB_OS_HU"
					stackvalue := stackefect
    
			   


					resultado := getcartas2(mesa, mano)

					mano := resultado.mano
					manos := resultado.manos
					stackvalue := stackefect

					
					;MsgBox, p3bet %p3bet% stackvalue %stackvalue%
					if(p3bet >= (stackvalue *.4)) 
					{
						
					
	
						if(p3 == "fish")
						{
							BBvsSB_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
						}
						else if(p3 == "reg")
						{
							BBvsSB_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
						}
						result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    					ExitApp  

						
					}
					else
					{
						
						
						;MsgBox, aui %restop3%
						if(p3stack = 0)
						{
						
	
							if(p3 == "fish")
							{
								BBvsSB_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
							}
							else if(p3 == "reg")
							{
								BBvsSB_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
							}
							result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    						ExitApp  
			   
				

							
						}		
						
					}
				}
			}
		}
	}
	
	
	ExitApp
	

}



BBvsSB_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{

	
	valormanos :=vsossbreg(manos)
	;MsgBox, % stackvalue
	

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
		movimientos("RAISETO", x1, y1, ancho, alto)
		movimientos("CALL", x1, y1, ancho, alto)


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
	
	if (situacionfinal = "bb vs sh hu AI reg")
	{
		return
	}
	
	situacionfinal := "bb vs sh hu AI reg"

	poscionclick("IMU", x1t, y1t, anchot, altot)
	poscionclick("O32", x1t, y1t, anchot, altot)
	poscionclick("F1P6", x1t, y1t, anchot, altot)
}

BBvsSB_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1)
{
	
	valormanos :=vsossbfish(manos)
	
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
	
	if (situacionfinal = "bb vs sh hu AI fish")
	{
		return
	}
	
	situacionfinal := "bb vs sh hu AI fish"

	poscionclick("IPLA", x1t, y1t, anchot, altot)
	poscionclick("O32", x1t, y1t, anchot, altot)
	poscionclick("F1P6", x1t, y1t, anchot, altot)
}



vsossbreg(manos)
{

	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  21
	manosPoker["KKo"] :=  21
	manosPoker["QQo"] :=  21
	manosPoker["JJo"] :=  21
	manosPoker["TTo"] :=  21
	manosPoker["99o"] :=  21
	manosPoker["88o"] :=  21
	manosPoker["77o"] :=  21
	manosPoker["66o"] :=  21
	manosPoker["55o"] :=  21
	manosPoker["44o"] :=  21
	manosPoker["33o"] :=  21
	manosPoker["22o"] :=  21
	manosPoker["AKs"] :=  21	
	manosPoker["AQs"] :=  21	
	manosPoker["AJs"] :=  21
	manosPoker["ATs"] :=  21
	manosPoker["A9s"] :=  21
	manosPoker["A8s"] :=  21
	manosPoker["A7s"] :=  21
	manosPoker["A6s"] :=  21
	manosPoker["A5s"] :=  21
	manosPoker["A4s"] :=  21
	manosPoker["A3s"] :=  21
	manosPoker["A2s"] :=  11
	manosPoker["AKo"] :=  21	
	manosPoker["AQo"] :=  21	
	manosPoker["AJo"] :=  21
	manosPoker["ATo"] :=  21
	manosPoker["A9o"] :=  15
	manosPoker["A8o"] :=  15
	manosPoker["A7o"] :=  15
	manosPoker["A6o"] :=  15
	manosPoker["A5o"] :=  15
	manosPoker["A4o"] :=  15
	manosPoker["A3o"] :=  11
	manosPoker["A2o"] :=  11
	manosPoker["KQs"] :=  21
	manosPoker["KJs"] :=  21
	manosPoker["KTs"] :=  21
	manosPoker["K9s"] :=  13
	manosPoker["K8s"] :=  11
	manosPoker["K7s"] :=  11
	manosPoker["K6s"] :=  11
	manosPoker["K5s"] :=  10
	manosPoker["K4s"] :=  9
	manosPoker["K3s"] :=  9
	manosPoker["K2s"] :=  9
	manosPoker["KQo"] :=  11
	manosPoker["KJo"] :=  11
	manosPoker["KTo"] :=  11
	manosPoker["K9o"] :=  11
	manosPoker["K8o"] :=  9
	manosPoker["K7o"] :=  9
	manosPoker["K6o"] :=  9
	manosPoker["K5o"] :=  9
	manosPoker["K4o"] :=  8
	manosPoker["K3o"] :=  8
	manosPoker["K2o"] :=  7
	manosPoker["QJs"] :=  21
	manosPoker["QTs"] :=  21
	manosPoker["Q9s"] :=  15
	manosPoker["Q8s"] :=  9
	manosPoker["Q7s"] :=  9
	manosPoker["Q6s"] :=  8
	manosPoker["Q5s"] :=  8
	manosPoker["Q4s"] :=  7
	manosPoker["Q3s"] :=  7
	manosPoker["Q2s"] :=  7
	manosPoker["QJo"] :=  12
	manosPoker["QTo"] :=  11
	manosPoker["Q9o"] :=  9
	manosPoker["Q8o"] :=  8
	manosPoker["Q7o"] :=  7
	manosPoker["Q6o"] :=  7
	manosPoker["Q5o"] :=  6
	manosPoker["Q4o"] :=  6
	manosPoker["Q3o"] :=  5.5
	manosPoker["Q2o"] :=  5.5
	manosPoker["JTs"] :=  21
	manosPoker["J9s"] :=  15
	manosPoker["J8s"] :=  9
	manosPoker["J7s"] :=  8
	manosPoker["J6s"] :=  6
	manosPoker["J5s"] :=  6
	manosPoker["J4s"] :=  6
	manosPoker["J3s"] :=  5.5
	manosPoker["J2s"] :=  5.5
	manosPoker["JTo"] :=  10
	manosPoker["J9o"] :=  8
	manosPoker["J8o"] :=  7
	manosPoker["J7o"] :=  6
	manosPoker["J6o"] :=  5
	manosPoker["J5o"] :=  5
	manosPoker["J4o"] :=  4.5
	manosPoker["J3o"] :=  4.5
	manosPoker["J2o"] :=  4
	manosPoker["T9s"] :=  21
	manosPoker["T8s"] :=  21
	manosPoker["T7s"] :=  7
	manosPoker["T6s"] :=  6
	manosPoker["T5s"] :=  5
	manosPoker["T4s"] :=  5
	manosPoker["T3s"] :=  4.5
	manosPoker["T2s"] :=  4.5
	manosPoker["T9o"] :=  7
	manosPoker["T8o"] :=  6
	manosPoker["T7o"] :=  5.5
	manosPoker["T6o"] :=  4.5
	manosPoker["T5o"] :=  4
	manosPoker["T4o"] :=  3.5
	manosPoker["T3o"] :=  3.5
	manosPoker["T2o"] :=  3.5
	manosPoker["98s"] :=  21
	manosPoker["97s"] :=  7
	manosPoker["96s"] :=  5.5
	manosPoker["95s"] :=  5
	manosPoker["94s"] :=  4
	manosPoker["93s"] :=  4
	manosPoker["92s"] :=  3.5
	manosPoker["98o"] :=  6
	manosPoker["97o"] :=  5
	manosPoker["96o"] :=  4
	manosPoker["95o"] :=  3.5
	manosPoker["94o"] :=  3
	manosPoker["93o"] :=  3
	manosPoker["92o"] :=  3
	manosPoker["87s"] :=  7
	manosPoker["86s"] :=  5.5
	manosPoker["85s"] :=  4.5
	manosPoker["84s"] :=  4
	manosPoker["83s"] :=  3.5
	manosPoker["82s"] :=  3.5
	manosPoker["87o"] :=  4.5
	manosPoker["86o"] :=  4
	manosPoker["85o"] :=  3.5
	manosPoker["84o"] :=  3
	manosPoker["83o"] :=  2.5
	manosPoker["82o"] :=  2.5
	manosPoker["76s"] :=  5
	manosPoker["75s"] :=  4.5
	manosPoker["74s"] :=  4
	manosPoker["73s"] :=  3.5
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  4
	manosPoker["75o"] :=  3.5
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  2.5
	manosPoker["72o"] :=  2.5
	manosPoker["65s"] :=  4.5
	manosPoker["64s"] :=  4
	manosPoker["63s"] :=  3.5
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  3.5
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  2.5
	manosPoker["62o"] :=  2.5
	manosPoker["54s"] :=  4.5
	manosPoker["53s"] :=  4
	manosPoker["52s"] :=  3.5
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  2.5
	manosPoker["43s"] :=  3.5
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  2.5
	manosPoker["32s"] :=  3
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos

	return valormanos
} 


vsossbfish(manos)
{

	
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  25
	manosPoker["KKo"] :=  25
	manosPoker["QQo"] :=  25
	manosPoker["JJo"] :=  25
	manosPoker["TTo"] :=  25
	manosPoker["99o"] :=  25
	manosPoker["88o"] :=  25
	manosPoker["77o"] :=  25
	manosPoker["66o"] :=  25
	manosPoker["55o"] :=  25
	manosPoker["44o"] :=  18
	manosPoker["33o"] :=  14
	manosPoker["22o"] :=  8
	manosPoker["AKs"] :=  25
	manosPoker["AQs"] :=  25
	manosPoker["AJs"] :=  25
	manosPoker["ATs"] :=  25
	manosPoker["A9s"] :=  18
	manosPoker["A8s"] :=  18
	manosPoker["A7s"] :=  18
	manosPoker["A6s"] :=  14
	manosPoker["A5s"] :=  11
	manosPoker["A4s"] :=  11
	manosPoker["A3s"] :=  11
	manosPoker["A2s"] :=  11
	manosPoker["AKo"] :=  25
	manosPoker["AQo"] :=  25
	manosPoker["AJo"] :=  25
	manosPoker["ATo"] :=  25
	manosPoker["A9o"] :=  18
	manosPoker["A8o"] :=  14
	manosPoker["A7o"] :=  15
	manosPoker["A6o"] :=  11
	manosPoker["A5o"] :=  11
	manosPoker["A4o"] :=  8
	manosPoker["A3o"] :=  8
	manosPoker["A2o"] :=  8
	manosPoker["KQs"] :=  18
	manosPoker["KJs"] :=  14
	manosPoker["KTs"] :=  13
	manosPoker["K9s"] :=  11
	manosPoker["K8s"] :=  10
	manosPoker["K7s"] :=  9
	manosPoker["K6s"] :=  8
	manosPoker["K5s"] :=  7
	manosPoker["K4s"] :=  7
	manosPoker["K3s"] :=  7
	manosPoker["K2s"] :=  7
	manosPoker["KQo"] :=  14
	manosPoker["KJo"] :=  11
	manosPoker["KTo"] :=  11
	manosPoker["K9o"] :=  8
	manosPoker["K8o"] :=  7
	manosPoker["K7o"] :=  7
	manosPoker["K6o"] :=  7
	manosPoker["K5o"] :=  6
	manosPoker["K4o"] :=  6
	manosPoker["K3o"] :=  6
	manosPoker["K2o"] :=  6
	manosPoker["QJs"] :=  14
	manosPoker["QTs"] :=  11
	manosPoker["Q9s"] :=  9
	manosPoker["Q8s"] :=  8
	manosPoker["Q7s"] :=  7
	manosPoker["Q6s"] :=  7
	manosPoker["Q5s"] :=  7
	manosPoker["Q4s"] :=  6
	manosPoker["Q3s"] :=  6
	manosPoker["Q2s"] :=  5
	manosPoker["QJo"] :=  10
	manosPoker["QTo"] :=  9
	manosPoker["Q9o"] :=  8
	manosPoker["Q8o"] :=  6
	manosPoker["Q7o"] :=  6
	manosPoker["Q6o"] :=  5
	manosPoker["Q5o"] :=  5
	manosPoker["Q4o"] :=  5
	manosPoker["Q3o"] :=  4
	manosPoker["Q2o"] :=  4
	manosPoker["JTs"] :=  11
	manosPoker["J9s"] :=  9
	manosPoker["J8s"] :=  8
	manosPoker["J7s"] :=  6
	manosPoker["J6s"] :=  5
	manosPoker["J5s"] :=  5
	manosPoker["J4s"] :=  5
	manosPoker["J3s"] :=  4
	manosPoker["J2s"] :=  4
	manosPoker["JTo"] :=  9
	manosPoker["J9o"] :=  6
	manosPoker["J8o"] :=  6
	manosPoker["J7o"] :=  5
	manosPoker["J6o"] :=  4
	manosPoker["J5o"] :=  4
	manosPoker["J4o"] :=  3
	manosPoker["J3o"] :=  3
	manosPoker["J2o"] :=  3
	manosPoker["T9s"] :=  9
	manosPoker["T8s"] :=  7
	manosPoker["T7s"] :=  6
	manosPoker["T6s"] :=  5
	manosPoker["T5s"] :=  4
	manosPoker["T4s"] :=  4
	manosPoker["T3s"] :=  4
	manosPoker["T2s"] :=  3
	manosPoker["T9o"] :=  6
	manosPoker["T8o"] :=  5
	manosPoker["T7o"] :=  4
	manosPoker["T6o"] :=  3
	manosPoker["T5o"] :=  3
	manosPoker["T4o"] :=  3
	manosPoker["T3o"] :=  3
	manosPoker["T2o"] :=  3
	manosPoker["98s"] :=  7
	manosPoker["97s"] :=  6
	manosPoker["96s"] :=  5
	manosPoker["95s"] :=  4
	manosPoker["94s"] :=  3
	manosPoker["93s"] :=  3
	manosPoker["92s"] :=  3
	manosPoker["98o"] :=  5
	manosPoker["97o"] :=  4
	manosPoker["96o"] :=  3
	manosPoker["95o"] :=  3
	manosPoker["94o"] :=  3
	manosPoker["93o"] :=  3
	manosPoker["92o"] :=  3
	manosPoker["87s"] :=  5
	manosPoker["86s"] :=  4
	manosPoker["85s"] :=  4
	manosPoker["84s"] :=  3
	manosPoker["83s"] :=  3
	manosPoker["82s"] :=  3
	manosPoker["87o"] :=  4
	manosPoker["86o"] :=  3
	manosPoker["85o"] :=  3
	manosPoker["84o"] :=  3
	manosPoker["83o"] :=  2.5
	manosPoker["82o"] :=  2.5
	manosPoker["76s"] :=  5
	manosPoker["75s"] :=  4
	manosPoker["74s"] :=  3
	manosPoker["73s"] :=  3
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  3
	manosPoker["75o"] :=  3
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  2.5
	manosPoker["72o"] :=  2.5
	manosPoker["65s"] :=  4
	manosPoker["64s"] :=  3
	manosPoker["63s"] :=  3
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  3
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  3
	manosPoker["62o"] :=  2.5
	manosPoker["54s"] :=  4
	manosPoker["53s"] :=  3
	manosPoker["52s"] :=  3
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  2.5
	manosPoker["43s"] :=  3
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  2.5
	manosPoker["32s"] :=  3
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos
	return valormanos
} 