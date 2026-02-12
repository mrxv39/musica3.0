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
resultado := SBvsBTN_LIMP(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

SBvsBTN_LIMP(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{

	
    
	;MsgBox, %p3btn% %p3bet%
	if(p3btn = 0 && p3bet = 1)
	{
		
        
		if(p2bet <= 1 )
		{
		
            
			if(p1bet = 0.5)
			{
			     
				stackvalue := stackefect
    
			


                resultado := getcartas2(mesa,mano)

                mano := resultado.mano
                manos := resultado.manos
				situacionglobal := "SB_3Hvs_BTN_LIMP"

				if(p3 = "fish" && p2 = "fish")
				{
                  
					SBvsBTN_LIMP_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					
				}
				if(p3 = "fish" && p2 = "fish")
				{
					SBvsBTN_LIMP_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				if(p3 = "reg" && p2 = "reg")
				{
					SBvsBTN_LIMP_FISH_BB_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				if(p3 = "reg" && p2 = "fish")
				{
					SBvsBTN_LIMP_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				if(p3 = "fish" && p2 = "reg")
				{
					SBvsBTN_LIMP_FISH_BB_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
                
                
                ExitApp



			}
		}
			
		
	}

    ExitApp  	


}	



SBvsBTN_LIMP_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	if (stackvalue < 6)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH -6")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH -6"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P5", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 6 && stackvalue < 8)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH 6-8 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH 6-8 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P5", x1t, y1t, anchot, altot)

        imagen := 22
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish68(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
	else if (stackvalue >= 8 && stackvalue < 11)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH 8-11 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH 8-11 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P4", x1t, y1t, anchot, altot)

        imagen := 21
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish811_2(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
	else if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH 11-14 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH 11-14 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P3", x1t, y1t, anchot, altot)

        imagen := 20
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish1114_2(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
	else if (stackvalue >= 14 && stackvalue < 18)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH 14-18 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH 14-18 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P2", x1t, y1t, anchot, altot)

        imagen := 19
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish1418_2(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }


	}
	else if (stackvalue >= 18 && stackvalue < 1000)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH 18+ BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH 18+ BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F2P1", x1t, y1t, anchot, altot)

        imagen := 18
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_limp_fish18(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
}





SBvsBTN_LIMP_FISH_BB_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	if (stackvalue >= 0 && stackvalue < 12.5)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH REGBB 8-11 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH REGBB 8-11 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F3P4", x1t, y1t, anchot, altot)

        imagen := 52
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fishREG10(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
	else if (stackvalue >= 12.5 && stackvalue < 17.5)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH REGBB 11-14 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH REGBB 11-14 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F3P3", x1t, y1t, anchot, altot)

        imagen := 51
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fishREG15(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
	else if (stackvalue >= 17.5 && stackvalue < 180)
	{
		if (situacionfinal = "SB 3h vs BTN-LIMP_FISH REGBB 14-18 BB")
		{
			return
		}
		situacionfinal := "SB 3h vs BTN-LIMP_FISH REGBB 14-18 BB"
		poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F3P2", x1t, y1t, anchot, altot)

        imagen := 12
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fishREG18(manos)

        if (valormanos = "3BAI")
        {
            
            color := "green"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("ALLIN", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSC")
        {
            color := "blue"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("RAISETO", x1, y1, ancho, alto)
        }
        else if (valormanos = "3BSF")
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
        else if (valormanos = "CC")
        {
            color := "yellow"
            popupnashpush(valormanos, color, posx, posy, mesa)
            movimientos("FOLD", x1, y1, ancho, alto)
        }
	}
}


nashpushSB_BTN_limp_fish18(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BSC"
    manosPoker["88o"] :=  "3BSC"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BSC"
    manosPoker["AQs"] :=  "3BSC"
    manosPoker["AJs"] :=  "3BSC"
    manosPoker["ATs"] :=  "3BSC"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BSF"
    manosPoker["A4s"] :=  "3BSF"
    manosPoker["A3s"] :=  "3BSF"
    manosPoker["A2s"] :=  "3BSF"
    manosPoker["AKo"] :=  "3BSC"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "CC"
    manosPoker["A6o"] :=  "CC"
    manosPoker["A5o"] :=  "CC"
    manosPoker["A4o"] :=  "CC"
    manosPoker["A3o"] :=  "CC"
    manosPoker["A2o"] :=  "CC"
    manosPoker["KQs"] :=  "3BSC"
    manosPoker["KJs"] :=  "3BSF"
    manosPoker["KTs"] :=  "3BSF"
    manosPoker["K9s"] :=  "3BSF"
    manosPoker["K8s"] :=  "3BSF"
    manosPoker["K7s"] :=  "CC"
    manosPoker["K6s"] :=  "CC"
    manosPoker["K5s"] :=  "CC"
    manosPoker["K4s"] :=  "CC"
    manosPoker["K3s"] :=  "CC"
    manosPoker["K2s"] :=  "CC"
    manosPoker["KQo"] :=  "3BSF"
    manosPoker["KJo"] :=  "3BSF"
    manosPoker["KTo"] :=  "3BSF"
    manosPoker["K9o"] :=  "3BSF"
    manosPoker["K8o"] :=  "CC"
    manosPoker["K7o"] :=  "CC"
    manosPoker["K6o"] :=  "CC"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "CC"
    manosPoker["K3o"] :=  "CC"
    manosPoker["K2o"] :=  "CC"
    manosPoker["QJs"] :=  "3BSF"
    manosPoker["QTs"] :=  "3BSF"
    manosPoker["Q9s"] :=  "3BSF"
    manosPoker["Q8s"] :=  "CC"
    manosPoker["Q7s"] :=  "CC"
    manosPoker["Q6s"] :=  "CC"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BSF"
    manosPoker["QTo"] :=  "3BSF"
    manosPoker["Q9o"] :=  "CC"
    manosPoker["Q8o"] :=  "CC"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "CC"
    manosPoker["Q5o"] :=  "CC"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BSF"
    manosPoker["J9s"] :=  "3BSF"
    manosPoker["J8s"] :=  "CC"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BSF"
    manosPoker["J9o"] :=  "CC"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "CC"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BSF"
    manosPoker["T8s"] :=  "CC"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "CC"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "CC"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "CC"
    manosPoker["92s"] :=  "CC"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "CC"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "CC"
    manosPoker["82s"] :=  "CC"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "CC"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "CC"
    manosPoker["72s"] :=  "CC"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "CC"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "CC"
    manosPoker["62s"] :=  "CC"
    manosPoker["65o"] :=  "CC"
    manosPoker["64o"] :=  "CC"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "CC"
    manosPoker["54o"] :=  "CC"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "CC"
    manosPoker["43o"] :=  "CC"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "CC"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish1418_2(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BSC"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BSC"
    manosPoker["AQs"] :=  "3BSC"
    manosPoker["AJs"] :=  "3BSC"
    manosPoker["ATs"] :=  "3BSC"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BSC"
    manosPoker["KJs"] :=  "3BSC"
    manosPoker["KTs"] :=  "3BSF"
    manosPoker["K9s"] :=  "3BSF"
    manosPoker["K8s"] :=  "CC"
    manosPoker["K7s"] :=  "CC"
    manosPoker["K6s"] :=  "CC"
    manosPoker["K5s"] :=  "CC"
    manosPoker["K4s"] :=  "CC"
    manosPoker["K3s"] :=  "CC"
    manosPoker["K2s"] :=  "CC"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BSF"
    manosPoker["KTo"] :=  "3BSF"
    manosPoker["K9o"] :=  "CC"
    manosPoker["K8o"] :=  "CC"
    manosPoker["K7o"] :=  "CC"
    manosPoker["K6o"] :=  "CC"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "CC"
    manosPoker["K3o"] :=  "CC"
    manosPoker["K2o"] :=  "CC"
    manosPoker["QJs"] :=  "3BSC"
    manosPoker["QTs"] :=  "3BSF"
    manosPoker["Q9s"] :=  "3BSF"
    manosPoker["Q8s"] :=  "CC"
    manosPoker["Q7s"] :=  "CC"
    manosPoker["Q6s"] :=  "CC"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BSF"
    manosPoker["QTo"] :=  "3BSF"
    manosPoker["Q9o"] :=  "CC"
    manosPoker["Q8o"] :=  "CC"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "CC"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BSF"
    manosPoker["J9s"] :=  "3BSF"
    manosPoker["J8s"] :=  "CC"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BSF"
    manosPoker["J9o"] :=  "CC"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "CC"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BSF"
    manosPoker["T8s"] :=  "CC"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "CC"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "CC"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "CC"
    manosPoker["92s"] :=  "CC"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "CC"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "CC"
    manosPoker["82s"] :=  "CC"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "CC"
    manosPoker["72s"] :=  "CC"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "CC"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "CC"
    manosPoker["62s"] :=  "CC"
    manosPoker["65o"] :=  "CC"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "CC"
    manosPoker["54o"] :=  "CC"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "CC"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "CC"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish1114_2(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BSC"
    manosPoker["AQs"] :=  "3BSC"
    manosPoker["AJs"] :=  "3BSC"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BSC"
    manosPoker["KJs"] :=  "3BSC"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "3BAI"
    manosPoker["K7s"] :=  "CC"
    manosPoker["K6s"] :=  "CC"
    manosPoker["K5s"] :=  "CC"
    manosPoker["K4s"] :=  "CC"
    manosPoker["K3s"] :=  "CC"
    manosPoker["K2s"] :=  "CC"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "3BAI"
    manosPoker["K9o"] :=  "CC"
    manosPoker["K8o"] :=  "CC"
    manosPoker["K7o"] :=  "CC"
    manosPoker["K6o"] :=  "CC"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "CC"
    manosPoker["K3o"] :=  "CC"
    manosPoker["K2o"] :=  "CC"
    manosPoker["QJs"] :=  "3BSC"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "CC"
    manosPoker["Q8s"] :=  "CC"
    manosPoker["Q7s"] :=  "CC"
    manosPoker["Q6s"] :=  "CC"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BAI"
    manosPoker["QTo"] :=  "CC"
    manosPoker["Q9o"] :=  "CC"
    manosPoker["Q8o"] :=  "CC"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "CC"
    manosPoker["J8s"] :=  "CC"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "CC"
    manosPoker["J9o"] :=  "CC"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "CC"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "CC"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "CC"
    manosPoker["92s"] :=  "CC"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "CC"
    manosPoker["82s"] :=  "CC"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "CC"
    manosPoker["72s"] :=  "CC"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "CC"
    manosPoker["62s"] :=  "CC"
    manosPoker["65o"] :=  "CC"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "CC"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "CC"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "CC"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish811_2(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "3BAI"
    manosPoker["K7s"] :=  "3BAI"
    manosPoker["K6s"] :=  "3BAI"
    manosPoker["K5s"] :=  "CC"
    manosPoker["K4s"] :=  "CC"
    manosPoker["K3s"] :=  "CC"
    manosPoker["K2s"] :=  "CC"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "3BAI"
    manosPoker["K9o"] :=  "3BAI"
    manosPoker["K8o"] :=  "3BAI"
    manosPoker["K7o"] :=  "CC"
    manosPoker["K6o"] :=  "CC"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "3BAI"
    manosPoker["Q8s"] :=  "3BAI"
    manosPoker["Q7s"] :=  "CC"
    manosPoker["Q6s"] :=  "CC"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BAI"
    manosPoker["QTo"] :=  "3BAI"
    manosPoker["Q9o"] :=  "CC"
    manosPoker["Q8o"] :=  "CC"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "3BAI"
    manosPoker["J8s"] :=  "CC"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BAI"
    manosPoker["J9o"] :=  "CC"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "CC"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "CC"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "CC"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "CC"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "CC"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "CC"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "CC"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish68(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BAI"
    manosPoker["KKo"] :=  "3BAI"
    manosPoker["QQo"] :=  "3BAI"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "3BAI"
    manosPoker["K7s"] :=  "3BAI"
    manosPoker["K6s"] :=  "3BAI"
    manosPoker["K5s"] :=  "3BAI"
    manosPoker["K4s"] :=  "3BAI"
    manosPoker["K3s"] :=  "3BAI"
    manosPoker["K2s"] :=  "3BAI"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "3BAI"
    manosPoker["K9o"] :=  "3BAI"
    manosPoker["K8o"] :=  "3BAI"
    manosPoker["K7o"] :=  "3BAI"
    manosPoker["K6o"] :=  "3BAI"
    manosPoker["K5o"] :=  "3BAI"
    manosPoker["K4o"] :=  "3BAI"
    manosPoker["K3o"] :=  "3BAI"
    manosPoker["K2o"] :=  "3BAI"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "3BAI"
    manosPoker["Q8s"] :=  "3BAI"
    manosPoker["Q7s"] :=  "3BAI"
    manosPoker["Q6s"] :=  "3BAI"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BAI"
    manosPoker["QTo"] :=  "3BAI"
    manosPoker["Q9o"] :=  "3BAI"
    manosPoker["Q8o"] :=  "CC"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "3BAI"
    manosPoker["J8s"] :=  "3BAI"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BAI"
    manosPoker["J9o"] :=  "3BAI"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "3BAI"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "3BAI"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BAI"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "FOLD"
    manosPoker["52s"] :=  "FOLD"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "FOLD"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "FOLD"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fishREG18(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BSC"
    manosPoker["88o"] :=  "3BSC"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BSF"
    manosPoker["A7s"] :=  "3BSF"
    manosPoker["A6s"] :=  "3BSF"
    manosPoker["A5s"] :=  "3BSF"
    manosPoker["A4s"] :=  "3BSF"
    manosPoker["A3s"] :=  "3BSF"
    manosPoker["A2s"] :=  "3BSF"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BSF"
    manosPoker["A7o"] :=  "3BSF"
    manosPoker["A6o"] :=  "3BSF"
    manosPoker["A5o"] :=  "3BSF"
    manosPoker["A4o"] :=  "3BSF"
    manosPoker["A3o"] :=  "3BSF"
    manosPoker["A2o"] :=  "3BSF"
    manosPoker["KQs"] :=  "3BSF"
    manosPoker["KJs"] :=  "3BSF"
    manosPoker["KTs"] :=  "3BSF"
    manosPoker["K9s"] :=  "3BSF"
    manosPoker["K8s"] :=  "3BSF"
    manosPoker["K7s"] :=  "3BSF"
    manosPoker["K6s"] :=  "3BSF"
    manosPoker["K5s"] :=  "3BSF"
    manosPoker["K4s"] :=  "3BSF"
    manosPoker["K3s"] :=  "3BSF"
    manosPoker["K2s"] :=  "3BSF"
    manosPoker["KQo"] :=  "3BSF"
    manosPoker["KJo"] :=  "3BSF"
    manosPoker["KTo"] :=  "3BSF"
    manosPoker["K9o"] :=  "3BSF"
    manosPoker["K8o"] :=  "3BSF"
    manosPoker["K7o"] :=  "3BSF"
    manosPoker["K6o"] :=  "CC"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "CC"
    manosPoker["K3o"] :=  "CC"
    manosPoker["K2o"] :=  "CC"
    manosPoker["QJs"] :=  "3BSF"
    manosPoker["QTs"] :=  "3BSF"
    manosPoker["Q9s"] :=  "3BSF"
    manosPoker["Q8s"] :=  "3BSF"
    manosPoker["Q7s"] :=  "3BSF"
    manosPoker["Q6s"] :=  "3BSF"
    manosPoker["Q5s"] :=  "CC"
    manosPoker["Q4s"] :=  "CC"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BSF"
    manosPoker["QTo"] :=  "3BSF"
    manosPoker["Q9o"] :=  "3BSF"
    manosPoker["Q8o"] :=  "3BSF"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "CC"
    manosPoker["Q5o"] :=  "CC"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BSF"
    manosPoker["J9s"] :=  "3BSF"
    manosPoker["J8s"] :=  "3BSF"
    manosPoker["J7s"] :=  "CC"
    manosPoker["J6s"] :=  "CC"
    manosPoker["J5s"] :=  "CC"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BSF"
    manosPoker["J9o"] :=  "3BSF"
    manosPoker["J8o"] :=  "CC"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "CC"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BSF"
    manosPoker["T8s"] :=  "3BSF"
    manosPoker["T7s"] :=  "CC"
    manosPoker["T6s"] :=  "CC"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "3BSF"
    manosPoker["T8o"] :=  "CC"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "CC"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BSF"
    manosPoker["97s"] :=  "CC"
    manosPoker["96s"] :=  "CC"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "CC"
    manosPoker["92s"] :=  "CC"
    manosPoker["98o"] :=  "CC"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "CC"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "CC"
    manosPoker["86s"] :=  "CC"
    manosPoker["85s"] :=  "CC"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "CC"
    manosPoker["82s"] :=  "CC"
    manosPoker["87o"] :=  "CC"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "CC"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "CC"
    manosPoker["75s"] :=  "CC"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "CC"
    manosPoker["72s"] :=  "CC"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "CC"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "CC"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "CC"
    manosPoker["62s"] :=  "CC"
    manosPoker["65o"] :=  "CC"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "CC"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "CC"
    manosPoker["54o"] :=  "CC"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "CC"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "CC"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fishREG15(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BSC"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BSC"
    manosPoker["KJs"] :=  "3BSC"
    manosPoker["KTs"] :=  "3BSC"
    manosPoker["K9s"] :=  "3BSC"
    manosPoker["K8s"] :=  "3BSF"
    manosPoker["K7s"] :=  "3BSF"
    manosPoker["K6s"] :=  "3BSF"
    manosPoker["K5s"] :=  "3BSF"
    manosPoker["K4s"] :=  "3BSF"
    manosPoker["K3s"] :=  "3BSF"
    manosPoker["K2s"] :=  "3BSF"
    manosPoker["KQo"] :=  "3BSF"
    manosPoker["KJo"] :=  "3BSF"
    manosPoker["KTo"] :=  "3BSF"
    manosPoker["K9o"] :=  "3BSF"
    manosPoker["K8o"] :=  "3BSF"
    manosPoker["K7o"] :=  "3BSF"
    manosPoker["K6o"] :=  "3BSF"
    manosPoker["K5o"] :=  "CC"
    manosPoker["K4o"] :=  "CC"
    manosPoker["K3o"] :=  "CC"
    manosPoker["K2o"] :=  "CC"
    manosPoker["QJs"] :=  "3BSC"
    manosPoker["QTs"] :=  "3BSC"
    manosPoker["Q9s"] :=  "3BSC"
    manosPoker["Q8s"] :=  "3BSF"
    manosPoker["Q7s"] :=  "3BSF"
    manosPoker["Q6s"] :=  "3BSF"
    manosPoker["Q5s"] :=  "3BAI"
    manosPoker["Q4s"] :=  "3BAI"
    manosPoker["Q3s"] :=  "CC"
    manosPoker["Q2s"] :=  "CC"
    manosPoker["QJo"] :=  "3BSF"
    manosPoker["QTo"] :=  "3BSF"
    manosPoker["Q9o"] :=  "3BSF"
    manosPoker["Q8o"] :=  "3BSF"
    manosPoker["Q7o"] :=  "CC"
    manosPoker["Q6o"] :=  "CC"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BSC"
    manosPoker["J9s"] :=  "3BSC"
    manosPoker["J8s"] :=  "3BSF"
    manosPoker["J7s"] :=  "3BAI"
    manosPoker["J6s"] :=  "3BAI"
    manosPoker["J5s"] :=  "3BAI"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BSF"
    manosPoker["J9o"] :=  "3BSF"
    manosPoker["J8o"] :=  "3BAI"
    manosPoker["J7o"] :=  "CC"
    manosPoker["J6o"] :=  "CC"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BSC"
    manosPoker["T8s"] :=  "3BAI"
    manosPoker["T7s"] :=  "3BAI"
    manosPoker["T6s"] :=  "3BAI"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "3BSF"
    manosPoker["T8o"] :=  "3BAI"
    manosPoker["T7o"] :=  "CC"
    manosPoker["T6o"] :=  "CC"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BAI"
    manosPoker["97s"] :=  "3BAI"
    manosPoker["96s"] :=  "3BAI"
    manosPoker["95s"] :=  "CC"
    manosPoker["94s"] :=  "CC"
    manosPoker["93s"] :=  "CC"
    manosPoker["92s"] :=  "CC"
    manosPoker["98o"] :=  "3BAI"
    manosPoker["97o"] :=  "CC"
    manosPoker["96o"] :=  "CC"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "3BAI"
    manosPoker["86s"] :=  "3BAI"
    manosPoker["85s"] :=  "3BAI"
    manosPoker["84s"] :=  "CC"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "3BAI"
    manosPoker["86o"] :=  "CC"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "3BAI"
    manosPoker["75s"] :=  "3BAI"
    manosPoker["74s"] :=  "CC"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "CC"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "3BAI"
    manosPoker["64s"] :=  "CC"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "3BAI"
    manosPoker["53s"] :=  "CC"
    manosPoker["52s"] :=  "FOLD"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "CC"
    manosPoker["42s"] :=  "FOLD"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "FOLD"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fishREG10(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BSC"
    manosPoker["TTo"] :=  "3BSC"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "3BAI"
    manosPoker["22o"] :=  "3BAI"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BAI"
    manosPoker["A2s"] :=  "3BAI"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "3BAI"
    manosPoker["A7o"] :=  "3BAI"
    manosPoker["A6o"] :=  "3BAI"
    manosPoker["A5o"] :=  "3BAI"
    manosPoker["A4o"] :=  "3BAI"
    manosPoker["A3o"] :=  "3BAI"
    manosPoker["A2o"] :=  "3BAI"
    manosPoker["KQs"] :=  "3BSC"
    manosPoker["KJs"] :=  "3BSC"
    manosPoker["KTs"] :=  "3BSC"
    manosPoker["K9s"] :=  "3BSC"
    manosPoker["K8s"] :=  "3BAI"
    manosPoker["K7s"] :=  "3BAI"
    manosPoker["K6s"] :=  "3BAI"
    manosPoker["K5s"] :=  "3BAI"
    manosPoker["K4s"] :=  "3BAI"
    manosPoker["K3s"] :=  "3BAI"
    manosPoker["K2s"] :=  "3BAI"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "3BAI"
    manosPoker["K9o"] :=  "3BAI"
    manosPoker["K8o"] :=  "3BAI"
    manosPoker["K7o"] :=  "3BAI"
    manosPoker["K6o"] :=  "3BAI"
    manosPoker["K5o"] :=  "3BAI"
    manosPoker["K4o"] :=  "3BAI"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BSC"
    manosPoker["QTs"] :=  "3BSC"
    manosPoker["Q9s"] :=  "3BSC"
    manosPoker["Q8s"] :=  "3BAI"
    manosPoker["Q7s"] :=  "3BAI"
    manosPoker["Q6s"] :=  "3BAI"
    manosPoker["Q5s"] :=  "3BAI"
    manosPoker["Q4s"] :=  "3BAI"
    manosPoker["Q3s"] :=  "3BAI"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "3BAI"
    manosPoker["QTo"] :=  "3BAI"
    manosPoker["Q9o"] :=  "3BAI"
    manosPoker["Q8o"] :=  "3BAI"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "3BAI"
    manosPoker["J8s"] :=  "3BAI"
    manosPoker["J7s"] :=  "3BAI"
    manosPoker["J6s"] :=  "3BAI"
    manosPoker["J5s"] :=  "3BAI"
    manosPoker["J4s"] :=  "CC"
    manosPoker["J3s"] :=  "CC"
    manosPoker["J2s"] :=  "CC"
    manosPoker["JTo"] :=  "3BAI"
    manosPoker["J9o"] :=  "3BAI"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "3BAI"
    manosPoker["T7s"] :=  "3BAI"
    manosPoker["T6s"] :=  "3BAI"
    manosPoker["T5s"] :=  "CC"
    manosPoker["T4s"] :=  "CC"
    manosPoker["T3s"] :=  "CC"
    manosPoker["T2s"] :=  "CC"
    manosPoker["T9o"] :=  "3BAI"
    manosPoker["T8o"] :=  "3BAI"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BAI"
    manosPoker["97s"] :=  "3BAI"
    manosPoker["96s"] :=  "3BAI"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "3BAI"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "3BAI"
    manosPoker["86s"] :=  "3BAI"
    manosPoker["85s"] :=  "3BAI"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "3BAI"
    manosPoker["75s"] :=  "3BAI"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "3BAI"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "3BAI"
    manosPoker["53s"] :=  "FOLD"
    manosPoker["52s"] :=  "FOLD"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "FOLD"
    manosPoker["42s"] :=  "FOLD"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "FOLD"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}