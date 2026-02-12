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

;MsgBox, % mano

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





;str(posx), str(posy), str(mesa), str(x1), str(y1), str(x2), str(y2), str(alto), str(ancho), str(x1t), str(y1t), str(anchot), str(altot), str(p2name), str(p2stack), str(p2bet), str(p2btn), str(p3name), str(p3stack), str(p3bet), str(p3btn), str(stackefect), str(p1bet), str(p1btn)
resultado := SB_3HvsBTN_OS(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

SB_3HvsBTN_OS(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{



	if(p3btn = 0)
	{
		
		;MsgBox, %p3stack% %stackefect%
		if(p3stack = 0 || p3bet > (0.5*stackefect))
		{
	
			if(p1bet = 0.5)
			{
				situacionglobal := "SBvsBTN_OS"


				stackvalue := stackefect
	    
				 


	            resultado := getcartas2(mesa,mano)

	            mano := resultado.mano
	            manos := resultado.manos
				
				;MsgBox, %p3%
				if(p3 = "reg")
				{
					SB_3HvsBTN_OS_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				if(p3 = "fish")
				{
					SB_3HvsBTN_OS_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    			
    			
			    ExitApp
			}
			
		}
		
		
		
	}

	ExitApp
}


SB_3HvsBTN_OS_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{

	imagen := 100
	popuptabla(posx, posy, mesa, imagen)
	
	valormanos := SBvsBTN_REG_OS(manos)
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
		
	}
    if (situacionfinal = "SB vs BTN_OS REG")
    {
        return
    }

    situacionfinal := "SB vs BTN_OS REG"
    poscionclick("IIIMU", x1t, y1t, anchot, altot)
    poscionclick("O62", x1t, y1t, anchot, altot)
    poscionclick("F1P6", x1t, y1t, anchot, altot)
}

SB_3HvsBTN_OS_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{

	imagen := 17
	popuptabla(posx, posy, mesa, imagen)

	valormanos := SBvsBTN_FISH_OS(manos)
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
		
	}
    if (situacionfinal = "SB vs BTN_OS REG")
    {
        return
    }
    if (situacionfinal = "SB vs BTN_OS FISH")
    {
        return
    }

    situacionfinal := "SB vs BTN_OS FISH"
    poscionclick("IIIPLA", x1t, y1t, anchot, altot)
    poscionclick("O62", x1t, y1t, anchot, altot)
    poscionclick("F1P6", x1t, y1t, anchot, altot)
}


SBvsBTN_REG_OS(manos)
{
	; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  19
	manosPoker["KKo"] :=  19
	manosPoker["QQo"] :=  19
	manosPoker["JJo"] :=  19
	manosPoker["TTo"] :=  19
	manosPoker["99o"] :=  19
	manosPoker["88o"] :=  19
	manosPoker["77o"] :=  19
	manosPoker["66o"] :=  19
	manosPoker["55o"] :=  19
	manosPoker["44o"] :=  19
	manosPoker["33o"] :=  17
	manosPoker["22o"] :=  11
	manosPoker["AKs"] :=  19
	manosPoker["AQs"] :=  19
	manosPoker["AJs"] :=  19
	manosPoker["ATs"] :=  19
	manosPoker["A9s"] :=  19
	manosPoker["A8s"] :=  19
	manosPoker["A7s"] :=  15
	manosPoker["A6s"] :=  14
	manosPoker["A5s"] :=  13
	manosPoker["A4s"] :=  11
	manosPoker["A3s"] :=  10
	manosPoker["A2s"] :=  10
	manosPoker["AKo"] :=  19
	manosPoker["AQo"] :=  19
	manosPoker["AJo"] :=  19
	manosPoker["ATo"] :=  19
	manosPoker["A9o"] :=  17
	manosPoker["A8o"] :=  14
	manosPoker["A7o"] :=  11
	manosPoker["A6o"] :=  8
	manosPoker["A5o"] :=  8
	manosPoker["A4o"] :=  7
	manosPoker["A3o"] :=  7
	manosPoker["A2o"] :=  6
	manosPoker["KQs"] :=  19
	manosPoker["KJs"] :=  19
	manosPoker["KTs"] :=  19
	manosPoker["K9s"] :=  9
	manosPoker["K8s"] :=  7
	manosPoker["K7s"] :=  7
	manosPoker["K6s"] :=  6
	manosPoker["K5s"] :=  5
	manosPoker["K4s"] :=  4
	manosPoker["K3s"] :=  4
	manosPoker["K2s"] :=  4
	manosPoker["KQo"] :=  14
	manosPoker["KJo"] :=  11
	manosPoker["KTo"] :=  8
	manosPoker["K9o"] :=  6
	manosPoker["K8o"] :=  5
	manosPoker["K7o"] :=  4
	manosPoker["K6o"] :=  3
	manosPoker["K5o"] :=  3
	manosPoker["K4o"] :=  2.5
	manosPoker["K3o"] :=  2.5
	manosPoker["K2o"] :=  2
	manosPoker["QJs"] :=  19
	manosPoker["QTs"] :=  10
	manosPoker["Q9s"] :=  6
	manosPoker["Q8s"] :=  5
	manosPoker["Q7s"] :=  4
	manosPoker["Q6s"] :=  3
	manosPoker["Q5s"] :=  3
	manosPoker["Q4s"] :=  3
	manosPoker["Q3s"] :=  3
	manosPoker["Q2s"] :=  2.5
	manosPoker["QJo"] :=  7
	manosPoker["QTo"] :=  6
	manosPoker["Q9o"] :=  4
	manosPoker["Q8o"] :=  3
	manosPoker["Q7o"] :=  2.5
	manosPoker["Q6o"] :=  2
	manosPoker["Q5o"] :=  2
	manosPoker["Q4o"] :=  2
	manosPoker["Q3o"] :=  1.5
	manosPoker["Q2o"] :=  1.5
	manosPoker["JTs"] :=  8
	manosPoker["J9s"] :=  5
	manosPoker["J8s"] :=  4
	manosPoker["J7s"] :=  3
	manosPoker["J6s"] :=  3
	manosPoker["J5s"] :=  3
	manosPoker["J4s"] :=  2.5
	manosPoker["J3s"] :=  2.5
	manosPoker["J2s"] :=  2
	manosPoker["JTo"] :=  5
	manosPoker["J9o"] :=  3
	manosPoker["J8o"] :=  3
	manosPoker["J7o"] :=  2
	manosPoker["J6o"] :=  2
	manosPoker["J5o"] :=  1.5
	manosPoker["J4o"] :=  1.5
	manosPoker["J3o"] :=  1.5
	manosPoker["J2o"] :=  1.5
	manosPoker["T9s"] :=  5
	manosPoker["T8s"] :=  4
	manosPoker["T7s"] :=  3
	manosPoker["T6s"] :=  3
	manosPoker["T5s"] :=  2.5
	manosPoker["T4s"] :=  2.5
	manosPoker["T3s"] :=  2
	manosPoker["T2s"] :=  2
	manosPoker["T9o"] :=  3
	manosPoker["T8o"] :=  3
	manosPoker["T7o"] :=  2.5
	manosPoker["T6o"] :=  2
	manosPoker["T5o"] :=  1.5
	manosPoker["T4o"] :=  1.5
	manosPoker["T3o"] :=  1.5
	manosPoker["T2o"] :=  1.5
	manosPoker["98s"] :=  4
	manosPoker["97s"] :=  3
	manosPoker["96s"] :=  3
	manosPoker["95s"] :=  2.5
	manosPoker["94s"] :=  2
	manosPoker["93s"] :=  2
	manosPoker["92s"] :=  1.5
	manosPoker["98o"] :=  3
	manosPoker["97o"] :=  2.5
	manosPoker["96o"] :=  2
	manosPoker["95o"] :=  1.5
	manosPoker["94o"] :=  1.5
	manosPoker["93o"] :=  1.5
	manosPoker["92o"] :=  1.5
	manosPoker["87s"] :=  3
	manosPoker["86s"] :=  3
	manosPoker["85s"] :=  2.5
	manosPoker["84s"] :=  2
	manosPoker["83s"] :=  1.5
	manosPoker["82s"] :=  1.5
	manosPoker["87o"] :=  2.5
	manosPoker["86o"] :=  2
	manosPoker["85o"] :=  1.5
	manosPoker["84o"] :=  1.5
	manosPoker["83o"] :=  1.5
	manosPoker["82o"] :=  1.5
	manosPoker["76s"] :=  3
	manosPoker["75s"] :=  3
	manosPoker["74s"] :=  2.5
	manosPoker["73s"] :=  2
	manosPoker["72s"] :=  1.5
	manosPoker["76o"] :=  2
	manosPoker["75o"] :=  1.5
	manosPoker["74o"] :=  1.5
	manosPoker["73o"] :=  1.5
	manosPoker["72o"] :=  1.5
	manosPoker["65s"] :=  3
	manosPoker["64s"] :=  2.5
	manosPoker["63s"] :=  2
	manosPoker["62s"] :=  1.5
	manosPoker["65o"] :=  2
	manosPoker["64o"] :=  1.5
	manosPoker["63o"] :=  1.5
	manosPoker["62o"] :=  1.5
	manosPoker["54s"] :=  3
	manosPoker["53s"] :=  2.5
	manosPoker["52s"] :=  2
	manosPoker["54o"] :=  1.5
	manosPoker["53o"] :=  1.5
	manosPoker["52o"] :=  1.5
	manosPoker["43s"] :=  2
	manosPoker["42s"] :=  1.5
	manosPoker["43o"] :=  1.5
	manosPoker["42o"] :=  1.5
	manosPoker["32s"] :=  1.5
	manosPoker["32o"] :=  1.5
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos
	return valormanos
}


SBvsBTN_FISH_OS(manos)
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
	manosPoker["44o"] :=  14
	manosPoker["33o"] :=  12
	manosPoker["22o"] :=  6
	manosPoker["AKs"] :=  25
	manosPoker["AQs"] :=  25
	manosPoker["AJs"] :=  25
	manosPoker["ATs"] :=  25
	manosPoker["A9s"] :=  16
	manosPoker["A8s"] :=  14
	manosPoker["A7s"] :=  11
	manosPoker["A6s"] :=  10
	manosPoker["A5s"] :=  9
	manosPoker["A4s"] :=  8
	manosPoker["A3s"] :=  6
	manosPoker["A2s"] :=  6
	manosPoker["AKo"] :=  25
	manosPoker["AQo"] :=  25
	manosPoker["AJo"] :=  25
	manosPoker["ATo"] :=  25
	manosPoker["A9o"] :=  14
	manosPoker["A8o"] :=  10
	manosPoker["A7o"] :=  8
	manosPoker["A6o"] :=  6
	manosPoker["A5o"] :=  6
	manosPoker["A4o"] :=  5
	manosPoker["A3o"] :=  5
	manosPoker["A2o"] :=  5
	manosPoker["KQs"] :=  13
	manosPoker["KJs"] :=  11
	manosPoker["KTs"] :=  9
	manosPoker["K9s"] :=  6
	manosPoker["K8s"] :=  5
	manosPoker["K7s"] :=  5
	manosPoker["K6s"] :=  5
	manosPoker["K5s"] :=  4
	manosPoker["K4s"] :=  3
	manosPoker["K3s"] :=  3
	manosPoker["K2s"] :=  3
	manosPoker["KQo"] :=  10
	manosPoker["KJo"] :=  8
	manosPoker["KTo"] :=  6
	manosPoker["K9o"] :=  5
	manosPoker["K8o"] :=  3
	manosPoker["K7o"] :=  3
	manosPoker["K6o"] :=  3
	manosPoker["K5o"] :=  3
	manosPoker["K4o"] :=  3
	manosPoker["K3o"] :=  2
	manosPoker["K2o"] :=  2
	manosPoker["QJs"] :=  8
	manosPoker["QTs"] :=  8
	manosPoker["Q9s"] :=  5
	manosPoker["Q8s"] :=  4
	manosPoker["Q7s"] :=  3
	manosPoker["Q6s"] :=  3
	manosPoker["Q5s"] :=  3
	manosPoker["Q4s"] :=  3
	manosPoker["Q3s"] :=  3
	manosPoker["Q2s"] :=  3
	manosPoker["QJo"] :=  6
	manosPoker["QTo"] :=  5
	manosPoker["Q9o"] :=  3
	manosPoker["Q8o"] :=  3
	manosPoker["Q7o"] :=  2
	manosPoker["Q6o"] :=  2
	manosPoker["Q5o"] :=  2
	manosPoker["Q4o"] :=  2
	manosPoker["Q3o"] :=  1.5
	manosPoker["Q2o"] :=  1.5
	manosPoker["JTs"] :=  7
	manosPoker["J9s"] :=  5
	manosPoker["J8s"] :=  3
	manosPoker["J7s"] :=  3
	manosPoker["J6s"] :=  3
	manosPoker["J5s"] :=  3
	manosPoker["J4s"] :=  2
	manosPoker["J3s"] :=  2
	manosPoker["J2s"] :=  2
	manosPoker["JTo"] :=  4
	manosPoker["J9o"] :=  3
	manosPoker["J8o"] :=  3
	manosPoker["J7o"] :=  2
	manosPoker["J6o"] :=  2
	manosPoker["J5o"] :=  1.5
	manosPoker["J4o"] :=  1.5
	manosPoker["J3o"] :=  1.5
	manosPoker["J2o"] :=  1.5
	manosPoker["T9s"] :=  5
	manosPoker["T8s"] :=  3
	manosPoker["T7s"] :=  3
	manosPoker["T6s"] :=  3
	manosPoker["T5s"] :=  2
	manosPoker["T4s"] :=  2
	manosPoker["T3s"] :=  2
	manosPoker["T2s"] :=  2
	manosPoker["T9o"] :=  3
	manosPoker["T8o"] :=  3
	manosPoker["T7o"] :=  2
	manosPoker["T6o"] :=  2
	manosPoker["T5o"] :=  1.5
	manosPoker["T4o"] :=  1.5
	manosPoker["T3o"] :=  1.5
	manosPoker["T2o"] :=  1.5
	manosPoker["98s"] :=  3
	manosPoker["97s"] :=  3
	manosPoker["96s"] :=  3
	manosPoker["95s"] :=  2
	manosPoker["94s"] :=  2
	manosPoker["93s"] :=  2
	manosPoker["92s"] :=  2
	manosPoker["98o"] :=  2
	manosPoker["97o"] :=  2
	manosPoker["96o"] :=  2
	manosPoker["95o"] :=  1.5
	manosPoker["94o"] :=  1.5
	manosPoker["93o"] :=  1.5
	manosPoker["92o"] :=  1.5
	manosPoker["87s"] :=  3
	manosPoker["86s"] :=  3
	manosPoker["85s"] :=  2
	manosPoker["84s"] :=  2
	manosPoker["83s"] :=  1.5
	manosPoker["82s"] :=  1.5
	manosPoker["87o"] :=  2
	manosPoker["86o"] :=  2
	manosPoker["85o"] :=  1.5
	manosPoker["84o"] :=  1.5
	manosPoker["83o"] :=  1.5
	manosPoker["82o"] :=  1.5
	manosPoker["76s"] :=  3
	manosPoker["75s"] :=  3
	manosPoker["74s"] :=  2
	manosPoker["73s"] :=  2
	manosPoker["72s"] :=  1.5
	manosPoker["76o"] :=  2
	manosPoker["75o"] :=  2
	manosPoker["74o"] :=  1.5
	manosPoker["73o"] :=  1.5
	manosPoker["72o"] :=  1.5
	manosPoker["65s"] :=  3
	manosPoker["64s"] :=  2
	manosPoker["63s"] :=  2
	manosPoker["62s"] :=  1.5
	manosPoker["65o"] :=  2
	manosPoker["64o"] :=  1.5
	manosPoker["63o"] :=  1.5
	manosPoker["62o"] :=  1.5
	manosPoker["54s"] :=  3
	manosPoker["53s"] :=  2
	manosPoker["52s"] :=  2
	manosPoker["54o"] :=  2
	manosPoker["53o"] :=  1.5
	manosPoker["52o"] :=  1.5
	manosPoker["43s"] :=  2
	manosPoker["42s"] :=  1.5
	manosPoker["43o"] :=  1.5
	manosPoker["42o"] :=  1.5
	manosPoker["32s"] :=  1.5
	manosPoker["32o"] :=  1.5
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos
	return valormanos
}