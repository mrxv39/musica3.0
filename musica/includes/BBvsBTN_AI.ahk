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




resultado := BBvsBTN_AI(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

BBvsBTN_AI(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{

	
	if(p2btn = 0)
	{


		stackvalue := stackefect
    
	  
	
		if(p2stack = 0 || p2bet > (stackvalue*0.4))
		{
		
			
			if(p1bet = 1)
			{
				
				if(p3bet = 0.5)
				{
					stackvalue := stackefect
    
				  


		            resultado := getcartas2(mesa,mano)

		            mano := resultado.mano
		            manos := resultado.manos
			
			
					situacionglobal := "BBvsBTN_OS"
					
					if(p2 == "fish")
					{

						BBvsBTN_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					else if(p2 == "reg")
					{
						BBvsBTN_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					
					
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
		    		
					
				}
				if(p3bet >=  (0.5*stackefect))
				{
					stackvalue := stackefect
    
				  


		            resultado := getcartas2(mesa,mano)

		            mano := resultado.mano
		            manos := resultado.manos
			
			
					situacionglobal := "BBvsBTN_OS_CALL_SB"
					
					if(p2 == "fish")
					{

						BBvsBTN_AI_FISH_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					else if(p2 == "reg")
					{
						BBvsBTN_AI_REG_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					
					
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
				}
			}
		}

	}
	if(p2btn = 0 && ((p2bet > (0.4*stackefect) || p2stack =0 ) && (p3stack = 0 || p3bet> (0.4*stackefect))))
	{
		;MsgBox, estamos vrs ai btn + call sb

		stackvalue := stackefect
    
				  


        resultado := getcartas2(mesa,mano)

        mano := resultado.mano
        manos := resultado.manos


		situacionglobal := "BBvsBTN_OS_CALL_SB"
		
		if(p2 == "fish")
		{

			BBvsBTN_AI_FISH_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
		}
		else if(p2 == "reg")
		{
			BBvsBTN_AI_REG_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
		}
		
		
		result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
		ExitApp  
	}
	ExitApp
	
}

BBvsBTN_AI_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	
	
	;MsgBox, estamos en la funcion BB_3H_vsSB_AI_FISH
	;Run, pythonw CaptureScreenshotvsai.pyw %x1% %y1% %x2% %y2%, , Hide ;toma foto de la mesa
	valormanos := vsosbtnfish(manos)
	;MsgBox, %valormanos% , %stackvalue%
	if(valormanos > stackvalue)
	{
		color := "green"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
			  
	}
	else
	{
		color := "red"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
			  
		
	}
	
	if(situacionfinal = "bb vs fish ai")
	{
		return
	}
	
	situacionfinal := "bb vs fish ai"
	poscionclick("IIIPLA", x1t, y1t, anchot, altot)
    poscionclick("O66", x1t, y1t, anchot, altot)
    poscionclick("F1P1", x1t, y1t, anchot, altot)

	
	
	
	
}

BBvsBTN_AI_FISH_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	
	
	;MsgBox, estamos en la funcion BB_3H_vsSB_AI_FISH
	;Run, pythonw CaptureScreenshotvsai.pyw %x1% %y1% %x2% %y2%, , Hide ;toma foto de la mesa
	valormanos := vsosbtnfish_CALL_SB(manos)
	;MsgBox, %valormanos% , %stackvalue%
	if(valormanos > stackvalue)
	{
		color := "green"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
			  
	}
	else
	{
		color := "red"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
			   
		
	}
	
	if(situacionfinal = "bb vs fish ai")
	{
		return
	}
	
	situacionfinal := "bb vs fish ai"
	poscionclick("IIIPLA", x1t, y1t, anchot, altot)
    poscionclick("O66", x1t, y1t, anchot, altot)
    poscionclick("F1P2", x1t, y1t, anchot, altot)

	
	
	
	
}

BBvsBTN_AI_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{

	;MsgBox, estamos en la funcion BB_3H_vsSB_AI_FISH
	;Run, pythonw CaptureScreenshotvsai.pyw %x1% %y1% %x2% %y2%, , Hide ;toma foto de la mesa

	valormanos := vsosbtnreg(manos)
	;MsgBox, %valormanos% , %stackvalue%, %manos%
	if(valormanos > stackvalue)
	{
		color := "green"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
		
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
	if(situacionfinal = "bb vs reg ai")
	{
		return
	}
	situacionfinal := "bb vs reg ai"

	
	situacion:= "BBvsBTN_OS REG"
	poscionclick("IIIMU", x1t, y1t, anchot, altot)
    poscionclick("O63", x1t, y1t, anchot, altot)
    poscionclick("F2P2", x1t, y1t, anchot, altot)

	
}

BBvsBTN_AI_REG_CALL_SB(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{

	;MsgBox, estamos en la funcion BB_3H_vsSB_AI_FISH
	;Run, pythonw CaptureScreenshotvsai.pyw %x1% %y1% %x2% %y2%, , Hide ;toma foto de la mesa

	valormanos := vsosbtnreg_CALL_SB(manos)
	;MsgBox, %valormanos% , %stackvalue%, %manos%
	if(valormanos > stackvalue)
	{
		color := "green"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
			  
	}
	else
	{
		color := "red"
		popupnashpush(valormanos, color, posx, posy, mesa)
    
		
		
	}
	if(situacionfinal = "bb vs reg ai")
	{
		return
	}
	situacionfinal := "bb vs reg ai"

	
	situacion:= "BBvsBTN_OS REG"
	poscionclick("IIIMU", x1t, y1t, anchot, altot)
    poscionclick("O63", x1t, y1t, anchot, altot)
    poscionclick("F2P3", x1t, y1t, anchot, altot)

	
}


vsosbtnfish_CALL_SB(manos)
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
	manosPoker["88o"] :=  20
	manosPoker["77o"] :=  16
	manosPoker["66o"] :=  16
	manosPoker["55o"] :=  12
	manosPoker["44o"] :=  10
	manosPoker["33o"] :=  7
	manosPoker["22o"] :=  5
	manosPoker["AKs"] :=  25
	manosPoker["AQs"] :=  25
	manosPoker["AJs"] :=  20
	manosPoker["ATs"] :=  15
	manosPoker["A9s"] :=  10
	manosPoker["A8s"] :=  8
	manosPoker["A7s"] :=  8
	manosPoker["A6s"] :=  7
	manosPoker["A5s"] :=  7
	manosPoker["A4s"] :=  6
	manosPoker["A3s"] :=  5
	manosPoker["A2s"] :=  5
	manosPoker["AKo"] :=  25
	manosPoker["AQo"] :=  20
	manosPoker["AJo"] :=  15
	manosPoker["ATo"] :=  11
	manosPoker["A9o"] :=  7
	manosPoker["A8o"] :=  6
	manosPoker["A7o"] :=  5
	manosPoker["A6o"] :=  5
	manosPoker["A5o"] :=  5
	manosPoker["A4o"] :=  4
	manosPoker["A3o"] :=  4
	manosPoker["A2o"] :=  4
	manosPoker["KQs"] :=  16
	manosPoker["KJs"] :=  13
	manosPoker["KTs"] :=  10
	manosPoker["K9s"] :=  7
	manosPoker["K8s"] :=  6
	manosPoker["K7s"] :=  5
	manosPoker["K6s"] :=  5
	manosPoker["K5s"] :=  5
	manosPoker["K4s"] :=  5
	manosPoker["K3s"] :=  4
	manosPoker["K2s"] :=  4
	manosPoker["KQo"] :=  10
	manosPoker["KJo"] :=  8
	manosPoker["KTo"] :=  6
	manosPoker["K9o"] :=  5
	manosPoker["K8o"] :=  4
	manosPoker["K7o"] :=  4
	manosPoker["K6o"] :=  4
	manosPoker["K5o"] :=  3
	manosPoker["K4o"] :=  3
	manosPoker["K3o"] :=  3
	manosPoker["K2o"] :=  3
	manosPoker["QJs"] :=  12
	manosPoker["QTs"] :=  10
	manosPoker["Q9s"] :=  7
	manosPoker["Q8s"] :=  6
	manosPoker["Q7s"] :=  5
	manosPoker["Q6s"] :=  5
	manosPoker["Q5s"] :=  5
	manosPoker["Q4s"] :=  4
	manosPoker["Q3s"] :=  4
	manosPoker["Q2s"] :=  4
	manosPoker["QJo"] :=  7
	manosPoker["QTo"] :=  5
	manosPoker["Q9o"] :=  4
	manosPoker["Q8o"] :=  4
	manosPoker["Q7o"] :=  3
	manosPoker["Q6o"] :=  3
	manosPoker["Q5o"] :=  3
	manosPoker["Q4o"] :=  3
	manosPoker["Q3o"] :=  3
	manosPoker["Q2o"] :=  3
	manosPoker["JTs"] :=  10
	manosPoker["J9s"] :=  8
	manosPoker["J8s"] :=  6
	manosPoker["J7s"] :=  5
	manosPoker["J6s"] :=  4
	manosPoker["J5s"] :=  4
	manosPoker["J4s"] :=  4
	manosPoker["J3s"] :=  4
	manosPoker["J2s"] :=  3
	manosPoker["JTo"] :=  6
	manosPoker["J9o"] :=  4
	manosPoker["J8o"] :=  4
	manosPoker["J7o"] :=  3
	manosPoker["J6o"] :=  3
	manosPoker["J5o"] :=  3
	manosPoker["J4o"] :=  3
	manosPoker["J3o"] :=  3
	manosPoker["J2o"] :=  3
	manosPoker["T9s"] :=  8
	manosPoker["T8s"] :=  7
	manosPoker["T7s"] :=  5
	manosPoker["T6s"] :=  4
	manosPoker["T5s"] :=  4
	manosPoker["T4s"] :=  4
	manosPoker["T3s"] :=  3
	manosPoker["T2s"] :=  3
	manosPoker["T9o"] :=  5
	manosPoker["T8o"] :=  4
	manosPoker["T7o"] :=  3
	manosPoker["T6o"] :=  3
	manosPoker["T5o"] :=  3
	manosPoker["T4o"] :=  3
	manosPoker["T3o"] :=  3
	manosPoker["T2o"] :=  3
	manosPoker["98s"] :=  8
	manosPoker["97s"] :=  5
	manosPoker["96s"] :=  5
	manosPoker["95s"] :=  4
	manosPoker["94s"] :=  3
	manosPoker["93s"] :=  3
	manosPoker["92s"] :=  3
	manosPoker["98o"] :=  4
	manosPoker["97o"] :=  3
	manosPoker["96o"] :=  3
	manosPoker["95o"] :=  3
	manosPoker["94o"] :=  3
	manosPoker["93o"] :=  3
	manosPoker["92o"] :=  3
	manosPoker["87s"] :=  7
	manosPoker["86s"] :=  5
	manosPoker["85s"] :=  5
	manosPoker["84s"] :=  4
	manosPoker["83s"] :=  3
	manosPoker["82s"] :=  3
	manosPoker["87o"] :=  4
	manosPoker["86o"] :=  3
	manosPoker["85o"] :=  3
	manosPoker["84o"] :=  3
	manosPoker["83o"] :=  3
	manosPoker["82o"] :=  3
	manosPoker["76s"] :=  6
	manosPoker["75s"] :=  5
	manosPoker["74s"] :=  4
	manosPoker["73s"] :=  3
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  4
	manosPoker["75o"] :=  3
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  3
	manosPoker["72o"] :=  3
	manosPoker["65s"] :=  5
	manosPoker["64s"] :=  5
	manosPoker["63s"] :=  4
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  3
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  3
	manosPoker["62o"] :=  3
	manosPoker["54s"] :=  5
	manosPoker["53s"] :=  4
	manosPoker["52s"] :=  3
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  3
	manosPoker["43s"] :=  4
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  3
	manosPoker["32s"] :=  3
	manosPoker["32o"] :=  3

; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos
	return valormanos
}

vsosbtnfish(manos)
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
	manosPoker["44o"] :=  16
	manosPoker["33o"] :=  14
	manosPoker["22o"] :=  11
	manosPoker["AKs"] :=  25
	manosPoker["AQs"] :=  25
	manosPoker["AJs"] :=  25
	manosPoker["ATs"] :=  25
	manosPoker["A9s"] :=  25
	manosPoker["A8s"] :=  16
	manosPoker["A7s"] :=  14
	manosPoker["A6s"] :=  11
	manosPoker["A5s"] :=  11
	manosPoker["A4s"] :=  10
	manosPoker["A3s"] :=  10
	manosPoker["A2s"] :=  10
	manosPoker["AKo"] :=  25
	manosPoker["AQo"] :=  25
	manosPoker["AJo"] :=  25
	manosPoker["ATo"] :=  25
	manosPoker["A9o"] :=  16
	manosPoker["A8o"] :=  13
	manosPoker["A7o"] :=  11
	manosPoker["A6o"] :=  10
	manosPoker["A5o"] :=  9
	manosPoker["A4o"] :=  8
	manosPoker["A3o"] :=  7
	manosPoker["A2o"] :=  7
	manosPoker["KQs"] :=  17
	manosPoker["KJs"] :=  11
	manosPoker["KTs"] :=  11
	manosPoker["K9s"] :=  8
	manosPoker["K8s"] :=  7
	manosPoker["K7s"] :=  6
	manosPoker["K6s"] :=  6
	manosPoker["K5s"] :=  6
	manosPoker["K4s"] :=  6
	manosPoker["K3s"] :=  5
	manosPoker["K2s"] :=  5
	manosPoker["KQo"] :=  11
	manosPoker["KJo"] :=  10
	manosPoker["KTo"] :=  8
	manosPoker["K9o"] :=  6
	manosPoker["K8o"] :=  6
	manosPoker["K7o"] :=  5
	manosPoker["K6o"] :=  5
	manosPoker["K5o"] :=  5
	manosPoker["K4o"] :=  5
	manosPoker["K3o"] :=  5
	manosPoker["K2o"] :=  4
	manosPoker["QJs"] :=  10
	manosPoker["QTs"] :=  8
	manosPoker["Q9s"] :=  7
	manosPoker["Q8s"] :=  6
	manosPoker["Q7s"] :=  5
	manosPoker["Q6s"] :=  5
	manosPoker["Q5s"] :=  5
	manosPoker["Q4s"] :=  5
	manosPoker["Q3s"] :=  5
	manosPoker["Q2s"] :=  4
	manosPoker["QJo"] :=  7
	manosPoker["QTo"] :=  6
	manosPoker["Q9o"] :=  5
	manosPoker["Q8o"] :=  5
	manosPoker["Q7o"] :=  4
	manosPoker["Q6o"] :=  4
	manosPoker["Q5o"] :=  4
	manosPoker["Q4o"] :=  3
	manosPoker["Q3o"] :=  3
	manosPoker["Q2o"] :=  3
	manosPoker["JTs"] :=  8
	manosPoker["J9s"] :=  7
	manosPoker["J8s"] :=  6
	manosPoker["J7s"] :=  5
	manosPoker["J6s"] :=  4
	manosPoker["J5s"] :=  4
	manosPoker["J4s"] :=  4
	manosPoker["J3s"] :=  4
	manosPoker["J2s"] :=  4
	manosPoker["JTo"] :=  6
	manosPoker["J9o"] :=  5
	manosPoker["J8o"] :=  4
	manosPoker["J7o"] :=  4
	manosPoker["J6o"] :=  3
	manosPoker["J5o"] :=  3
	manosPoker["J4o"] :=  3
	manosPoker["J3o"] :=  3
	manosPoker["J2o"] :=  3
	manosPoker["T9s"] :=  7
	manosPoker["T8s"] :=  6
	manosPoker["T7s"] :=  5
	manosPoker["T6s"] :=  4
	manosPoker["T5s"] :=  4
	manosPoker["T4s"] :=  4
	manosPoker["T3s"] :=  3
	manosPoker["T2s"] :=  3
	manosPoker["T9o"] :=  5
	manosPoker["T8o"] :=  4
	manosPoker["T7o"] :=  4
	manosPoker["T6o"] :=  3
	manosPoker["T5o"] :=  3
	manosPoker["T4o"] :=  3
	manosPoker["T3o"] :=  3
	manosPoker["T2o"] :=  3
	manosPoker["98s"] :=  6
	manosPoker["97s"] :=  5
	manosPoker["96s"] :=  4
	manosPoker["95s"] :=  4
	manosPoker["94s"] :=  3
	manosPoker["93s"] :=  3
	manosPoker["92s"] :=  3
	manosPoker["98o"] :=  4
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
	manosPoker["83o"] :=  3
	manosPoker["82o"] :=  2.5
	manosPoker["76s"] :=  5
	manosPoker["75s"] :=  4
	manosPoker["74s"] :=  4
	manosPoker["73s"] :=  3
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  3
	manosPoker["75o"] :=  3
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  3
	manosPoker["72o"] :=  2.5
	manosPoker["65s"] :=  4
	manosPoker["64s"] :=  4
	manosPoker["63s"] :=  3
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  3
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  3
	manosPoker["62o"] :=  3
	manosPoker["54s"] :=  4
	manosPoker["53s"] :=  4
	manosPoker["52s"] :=  3
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  3
	manosPoker["43s"] :=  4
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  3
	manosPoker["32s"] :=  3
	manosPoker["32o"] :=  2.5
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos
	return valormanos
}

vsosbtnreg_CALL_SB(manos)
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
	manosPoker["77o"] :=  16
	manosPoker["66o"] :=  16
	manosPoker["55o"] :=  16
	manosPoker["44o"] :=  10
	manosPoker["33o"] :=  7
	manosPoker["22o"] :=  5
	manosPoker["AKs"] :=  20	
	manosPoker["AQs"] :=  20	
	manosPoker["AJs"] :=  19
	manosPoker["ATs"] :=  15
	manosPoker["A9s"] :=  10
	manosPoker["A8s"] :=  8
	manosPoker["A7s"] :=  8
	manosPoker["A6s"] :=  7
	manosPoker["A5s"] :=  7
	manosPoker["A4s"] :=  6
	manosPoker["A3s"] :=  5
	manosPoker["A2s"] :=  5
	manosPoker["AKo"] :=  20	
	manosPoker["AQo"] :=  20	
	manosPoker["AJo"] :=  15
	manosPoker["ATo"] :=  11
	manosPoker["A9o"] :=  7
	manosPoker["A8o"] :=  6
	manosPoker["A7o"] :=  5
	manosPoker["A6o"] :=  5
	manosPoker["A5o"] :=  5
	manosPoker["A4o"] :=  4
	manosPoker["A3o"] :=  4
	manosPoker["A2o"] :=  4
	manosPoker["KQs"] :=  16
	manosPoker["KJs"] :=  15
	manosPoker["KTs"] :=  10
	manosPoker["K9s"] :=  7
	manosPoker["K8s"] :=  6
	manosPoker["K7s"] :=  5
	manosPoker["K6s"] :=  5
	manosPoker["K5s"] :=  5
	manosPoker["K4s"] :=  5
	manosPoker["K3s"] :=  4
	manosPoker["K2s"] :=  4
	manosPoker["KQo"] :=  10
	manosPoker["KJo"] :=  8
	manosPoker["KTo"] :=  6
	manosPoker["K9o"] :=  5
	manosPoker["K8o"] :=  4
	manosPoker["K7o"] :=  4
	manosPoker["K6o"] :=  4
	manosPoker["K5o"] :=  3
	manosPoker["K4o"] :=  3
	manosPoker["K3o"] :=  3
	manosPoker["K2o"] :=  3
	manosPoker["QJs"] :=  15
	manosPoker["QTs"] :=  10
	manosPoker["Q9s"] :=  7
	manosPoker["Q8s"] :=  6
	manosPoker["Q7s"] :=  5
	manosPoker["Q6s"] :=  5
	manosPoker["Q5s"] :=  5
	manosPoker["Q4s"] :=  4
	manosPoker["Q3s"] :=  4
	manosPoker["Q2s"] :=  4
	manosPoker["QJo"] :=  7
	manosPoker["QTo"] :=  5
	manosPoker["Q9o"] :=  4
	manosPoker["Q8o"] :=  4
	manosPoker["Q7o"] :=  3
	manosPoker["Q6o"] :=  3
	manosPoker["Q5o"] :=  3
	manosPoker["Q4o"] :=  3
	manosPoker["Q3o"] :=  3
	manosPoker["Q2o"] :=  3
	manosPoker["JTs"] :=  10
	manosPoker["J9s"] :=  8
	manosPoker["J8s"] :=  6
	manosPoker["J7s"] :=  5
	manosPoker["J6s"] :=  4
	manosPoker["J5s"] :=  4
	manosPoker["J4s"] :=  4
	manosPoker["J3s"] :=  4
	manosPoker["J2s"] :=  3
	manosPoker["JTo"] :=  6
	manosPoker["J9o"] :=  4
	manosPoker["J8o"] :=  4
	manosPoker["J7o"] :=  3
	manosPoker["J6o"] :=  3
	manosPoker["J5o"] :=  3
	manosPoker["J4o"] :=  3
	manosPoker["J3o"] :=  2
	manosPoker["J2o"] :=  2
	manosPoker["T9s"] :=  8
	manosPoker["T8s"] :=  7
	manosPoker["T7s"] :=  5
	manosPoker["T6s"] :=  4
	manosPoker["T5s"] :=  4
	manosPoker["T4s"] :=  4
	manosPoker["T3s"] :=  3
	manosPoker["T2s"] :=  3
	manosPoker["T9o"] :=  5
	manosPoker["T8o"] :=  4
	manosPoker["T7o"] :=  3
	manosPoker["T6o"] :=  3
	manosPoker["T5o"] :=  3
	manosPoker["T4o"] :=  2
	manosPoker["T3o"] :=  2
	manosPoker["T2o"] :=  2
	manosPoker["98s"] :=  8
	manosPoker["97s"] :=  5
	manosPoker["96s"] :=  5
	manosPoker["95s"] :=  4
	manosPoker["94s"] :=  3
	manosPoker["93s"] :=  3
	manosPoker["92s"] :=  3
	manosPoker["98o"] :=  4
	manosPoker["97o"] :=  3
	manosPoker["96o"] :=  3
	manosPoker["95o"] :=  3
	manosPoker["94o"] :=  2
	manosPoker["93o"] :=  2
	manosPoker["92o"] :=  2
	manosPoker["87s"] :=  7
	manosPoker["86s"] :=  5
	manosPoker["85s"] :=  5
	manosPoker["84s"] :=  4
	manosPoker["83s"] :=  3
	manosPoker["82s"] :=  3
	manosPoker["87o"] :=  4
	manosPoker["86o"] :=  4
	manosPoker["85o"] :=  3
	manosPoker["84o"] :=  2
	manosPoker["83o"] :=  2
	manosPoker["82o"] :=  2
	manosPoker["76s"] :=  6
	manosPoker["75s"] :=  5
	manosPoker["74s"] :=  4
	manosPoker["73s"] :=  3
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  4
	manosPoker["75o"] :=  3
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  2
	manosPoker["72o"] :=  2
	manosPoker["65s"] :=  5
	manosPoker["64s"] :=  5
	manosPoker["63s"] :=  4
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  4
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  3
	manosPoker["62o"] :=  2
	manosPoker["54s"] :=  5
	manosPoker["53s"] :=  4
	manosPoker["52s"] :=  3
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  2
	manosPoker["43s"] :=  4
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  2
	manosPoker["32s"] :=  3
	manosPoker["32o"] :=  2
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos	
	return valormanos
}

vsosbtnreg(manos)
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
	manosPoker["33o"] :=  19
	manosPoker["22o"] :=  13
	manosPoker["AKs"] :=  19	
	manosPoker["AQs"] :=  19	
	manosPoker["AJs"] :=  19
	manosPoker["ATs"] :=  19
	manosPoker["A9s"] :=  19
	manosPoker["A8s"] :=  19
	manosPoker["A7s"] :=  19
	manosPoker["A6s"] :=  19
	manosPoker["A5s"] :=  19
	manosPoker["A4s"] :=  15
	manosPoker["A3s"] :=  13
	manosPoker["A2s"] :=  11
	manosPoker["AKo"] :=  19	
	manosPoker["AQo"] :=  19	
	manosPoker["AJo"] :=  19
	manosPoker["ATo"] :=  19
	manosPoker["A9o"] :=  19
	manosPoker["A8o"] :=  17
	manosPoker["A7o"] :=  15
	manosPoker["A6o"] :=  13
	manosPoker["A5o"] :=  11
	manosPoker["A4o"] :=  11
	manosPoker["A3o"] :=  10
	manosPoker["A2o"] :=  10
	manosPoker["KQs"] :=  19
	manosPoker["KJs"] :=  19
	manosPoker["KTs"] :=  19
	manosPoker["K9s"] :=  11
	manosPoker["K8s"] :=  10
	manosPoker["K7s"] :=  9
	manosPoker["K6s"] :=  8
	manosPoker["K5s"] :=  7
	manosPoker["K4s"] :=  7
	manosPoker["K3s"] :=  7
	manosPoker["K2s"] :=  6
	manosPoker["KQo"] :=  19
	manosPoker["KJo"] :=  13
	manosPoker["KTo"] :=  11
	manosPoker["K9o"] :=  8
	manosPoker["K8o"] :=  7
	manosPoker["K7o"] :=  6
	manosPoker["K6o"] :=  6
	manosPoker["K5o"] :=  5
	manosPoker["K4o"] :=  5
	manosPoker["K3o"] :=  5
	manosPoker["K2o"] :=  5
	manosPoker["QJs"] :=  19
	manosPoker["QTs"] :=  19
	manosPoker["Q9s"] :=  9
	manosPoker["Q8s"] :=  7
	manosPoker["Q7s"] :=  6
	manosPoker["Q6s"] :=  6
	manosPoker["Q5s"] :=  6
	manosPoker["Q4s"] :=  5
	manosPoker["Q3s"] :=  5
	manosPoker["Q2s"] :=  5
	manosPoker["QJo"] :=  10
	manosPoker["QTo"] :=  8
	manosPoker["Q9o"] :=  6
	manosPoker["Q8o"] :=  5
	manosPoker["Q7o"] :=  4
	manosPoker["Q6o"] :=  4
	manosPoker["Q5o"] :=  4
	manosPoker["Q4o"] :=  3
	manosPoker["Q3o"] :=  3
	manosPoker["Q2o"] :=  3
	manosPoker["JTs"] :=  19
	manosPoker["J9s"] :=  7
	manosPoker["J8s"] :=  6
	manosPoker["J7s"] :=  5
	manosPoker["J6s"] :=  5
	manosPoker["J5s"] :=  4
	manosPoker["J4s"] :=  4
	manosPoker["J3s"] :=  4
	manosPoker["J2s"] :=  4
	manosPoker["JTo"] :=  7
	manosPoker["J9o"] :=  5
	manosPoker["J8o"] :=  4
	manosPoker["J7o"] :=  4
	manosPoker["J6o"] :=  3
	manosPoker["J5o"] :=  3
	manosPoker["J4o"] :=  3
	manosPoker["J3o"] :=  3
	manosPoker["J2o"] :=  3
	manosPoker["T9s"] :=  7
	manosPoker["T8s"] :=  6
	manosPoker["T7s"] :=  5
	manosPoker["T6s"] :=  4
	manosPoker["T5s"] :=  4
	manosPoker["T4s"] :=  4
	manosPoker["T3s"] :=  3
	manosPoker["T2s"] :=  3
	manosPoker["T9o"] :=  5
	manosPoker["T8o"] :=  4
	manosPoker["T7o"] :=  3
	manosPoker["T6o"] :=  3
	manosPoker["T5o"] :=  3
	manosPoker["T4o"] :=  3
	manosPoker["T3o"] :=  3
	manosPoker["T2o"] :=  3
	manosPoker["98s"] :=  6
	manosPoker["97s"] :=  5
	manosPoker["96s"] :=  4
	manosPoker["95s"] :=  4
	manosPoker["94s"] :=  3
	manosPoker["93s"] :=  3
	manosPoker["92s"] :=  3
	manosPoker["98o"] :=  4
	manosPoker["97o"] :=  3
	manosPoker["96o"] :=  3
	manosPoker["95o"] :=  3
	manosPoker["94o"] :=  3
	manosPoker["93o"] :=  3
	manosPoker["92o"] :=  3
	manosPoker["87s"] :=  5
	manosPoker["86s"] :=  5
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
	manosPoker["74s"] :=  4
	manosPoker["73s"] :=  3
	manosPoker["72s"] :=  3
	manosPoker["76o"] :=  3
	manosPoker["75o"] :=  3
	manosPoker["74o"] :=  3
	manosPoker["73o"] :=  3
	manosPoker["72o"] :=  2.5
	manosPoker["65s"] :=  5
	manosPoker["64s"] :=  4
	manosPoker["63s"] :=  3
	manosPoker["62s"] :=  3
	manosPoker["65o"] :=  3
	manosPoker["64o"] :=  3
	manosPoker["63o"] :=  3
	manosPoker["62o"] :=  3
	manosPoker["54s"] :=  4
	manosPoker["53s"] :=  4
	manosPoker["52s"] :=  3
	manosPoker["54o"] :=  3
	manosPoker["53o"] :=  3
	manosPoker["52o"] :=  3
	manosPoker["43s"] :=  4
	manosPoker["42s"] :=  3
	manosPoker["43o"] :=  3
	manosPoker["42o"] :=  3
	manosPoker["32s"] :=  3
	manosPoker["32o"] :=  2.5
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
; Mostrar el valor obtenido
	;MsgBox % "El valor de " clave " es: " valormanos	
	return valormanos
}