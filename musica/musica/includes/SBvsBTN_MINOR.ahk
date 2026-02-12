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
resultado := SBvsBTN_MINOR(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

SBvsBTN_MINOR(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{

	
	
	;MsgBox, %p3btn% %p3bet%
	if(p3btn = 0 && p3bet = 2)
	{
		
		
		
		if(p1bet = 0.5 && p2bet <= 1)
		{
			
			
			situacionglobal := "SBvsBTN_OR"

			stackvalue := stackefect
    
			   

            resultado := getcartas2(mesa,mano)

            mano := resultado.mano
            manos := resultado.manos


			
			;MsgBox, %p3%
			if(p3 = "reg")
			{
				sbvsminorreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
			}
			if(p3 = "fish")
			{
				sbvsminorfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
			}
			
			result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
                
                
            ExitApp
    
		
        }
		
		
		
	}
    ExitApp  
   
}



sbvsminorreg(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
    situacion := "sb vs minor reg"
    
    if (stackvalue >= 0 && stackvalue < 12)
    {
        if (situacionfinal = "SB vs BTN_MINOR REG 11 BB")
        {
            return
        }
        situacionfinal := "SB vs BTN_MINOR REG 11 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P5", x1t, y1t, anchot, altot)

        imagen := 99

        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_reg_11(manos)

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
    else if (stackvalue >= 12 && stackvalue < 14)
    {
        if (situacionfinal = "SB vs BTN_MINOR REG 13 BB")
        {
            return
        }
        situacionfinal := "SB vs BTN_MINOR REG 13 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P4", x1t, y1t, anchot, altot)

        imagen := 98

        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_reg_13(manos)

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
    else if (stackvalue >= 14 && stackvalue < 19)
    {
        if (situacionfinal = "SB vs BTN_MINOR REG 15-17 BB")
        {
            return
        }
        situacionfinal := "SB vs BTN_MINOR REG 15-17 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P3", x1t, y1t, anchot, altot)

        imagen := 97

        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_reg_1517(manos)

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
    else if (stackvalue >= 19 && stackvalue < 23)
    {
        if (situacionfinal = "SB vs BTN_MINOR REG 21 BB")
        {
            return
        }
        situacionfinal := "SB vs BTN_MINOR REG 21 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P2", x1t, y1t, anchot, altot)

        imagen := 96

        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_reg_2125(manos)

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
    else if (stackvalue >= 23 && stackvalue < 1000)
    {
        if (situacionfinal = "SB vs BTN_MINOR REG 25+ BB")
        {
            return
        }
        situacionfinal := "SB vs BTN_MINOR REG 25+ BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P1", x1t, y1t, anchot, altot)

        imagen := 95
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_reg_25(manos)

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


sbvsminorfish(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
    situacion := "sb vs minor fish"
    
    if (stackvalue >= 0 && stackvalue < 8)
    {
        if (situacionfinal = "SB 3H vs BTN FISHminor 6-8 BB")
        {
            return
        }
        situacionfinal := "SB 3H vs BTN FISHminor 6-8 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P5", x1t, y1t, anchot, altot)

        imagen := 16
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish08(manos)

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
        if (situacionfinal = "SB 3H vs BTN FISHminor 8-11 BB")
        {
            return
        }
        situacionfinal := "SB 3H vs BTN FISHminor 8-11 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P4", x1t, y1t, anchot, altot)

        imagen := 15
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish811(manos)

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
        if (situacionfinal = "SB 3H vs BTN FISHminor 11-14 BB")
        {
            return
        }
        situacionfinal := "SB 3H vs BTN FISHminor 11-14 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P3", x1t, y1t, anchot, altot)

        imagen := 14
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish1114(manos)

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
        if (situacionfinal = "SB 3H vs BTN FISHminor 14-18 BB")
        {
            return
        }
        situacionfinal := "SB 3H vs BTN FISH 14-18 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P2", x1t, y1t, anchot, altot)

        imagen := 13
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish1418(manos)

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
        if (situacionfinal = "SB 3H vs BTN FISHminor +18 BB")
        {
            return
        }
        situacionfinal := "SB 3H vs BTN FISHminor +18 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O62", x1t, y1t, anchot, altot)
        poscionclick("F1P1", x1t, y1t, anchot, altot)

        imagen := 23
        popuptabla(posx, posy, mesa, imagen)

        valormanos := nashpushSB_BTN_MIN_fish18(manos)

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


nashpushSB_BTN_MIN_reg_25(manos)
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
    manosPoker["AKs"] :=  "3BSC"
    manosPoker["AQs"] :=  "3BSC"
    manosPoker["AJs"] :=  "3BSC"
    manosPoker["ATs"] :=  "3BSC"
    manosPoker["A9s"] :=  "3BSC"
    manosPoker["A8s"] :=  "3BSC"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "3BAI"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "3BSF"
    manosPoker["A2s"] :=  "3BSF"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BSF"
    manosPoker["A9o"] :=  "3BSF"
    manosPoker["A8o"] :=  "3BSF"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "CC"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "FOLD"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "CC"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "3BSF"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "CC"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_reg_2125(manos)
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
    manosPoker["A9o"] :=  "3BSF"
    manosPoker["A8o"] :=  "3BSF"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "FOLD"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "3BAI"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "3BAI"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BAI"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


nashpushSB_BTN_MIN_reg_1517(manos)
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
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "3BAI"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "3BAI"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "3BAI"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "3BAI"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


nashpushSB_BTN_MIN_reg_13(manos)
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
    manosPoker["44o"] :=  "FOLD"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
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
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "3BAI"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "3BAI"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "3BAI"
    manosPoker["QTs"] :=  "3BAI"
    manosPoker["Q9s"] :=  "FOLD"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "3BAI"
    manosPoker["J9s"] :=  "FOLD"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "FOLD"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


nashpushSB_BTN_MIN_reg_11(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BAI"
    manosPoker["KKo"] :=  "3BAI"
    manosPoker["QQo"] :=  "3BAI"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "FOLD"
    manosPoker["88o"] :=  "FOLD"
    manosPoker["77o"] :=  "FOLD"
    manosPoker["66o"] :=  "FOLD"
    manosPoker["55o"] :=  "FOLD"
    manosPoker["44o"] :=  "FOLD"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
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
    manosPoker["ATo"] :=  "FOLD"
    manosPoker["A9o"] :=  "FOLD"
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "FOLD"
    manosPoker["K9s"] :=  "FOLD"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "3BAI"
    manosPoker["KJo"] :=  "FOLD"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "FOLD"
    manosPoker["QTs"] :=  "FOLD"
    manosPoker["Q9s"] :=  "FOLD"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "FOLD"
    manosPoker["J9s"] :=  "FOLD"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "FOLD"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


nashpushSB_BTN_MIN_fish18(manos)
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
    manosPoker["33o"] :=  "CC"
    manosPoker["22o"] :=  "CC"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "CC"
    manosPoker["A7s"] :=  "CC"
    manosPoker["A6s"] :=  "CC"
    manosPoker["A5s"] :=  "CC"
    manosPoker["A4s"] :=  "CC"
    manosPoker["A3s"] :=  "CC"
    manosPoker["A2s"] :=  "CC"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "CC"
    manosPoker["A8o"] :=  "CC"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "CC"
    manosPoker["KJs"] :=  "CC"
    manosPoker["KTs"] :=  "CC"
    manosPoker["K9s"] :=  "CC"
    manosPoker["K8s"] :=  "CC"
    manosPoker["K7s"] :=  "CC"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "CC"
    manosPoker["KJo"] :=  "CC"
    manosPoker["KTo"] :=  "CC"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "CC"
    manosPoker["QTs"] :=  "CC"
    manosPoker["Q9s"] :=  "CC"
    manosPoker["Q8s"] :=  "CC"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "CC"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "CC"
    manosPoker["J9s"] :=  "CC"
    manosPoker["J8s"] :=  "CC"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "CC"
    manosPoker["T8s"] :=  "CC"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


nashpushSB_BTN_MIN_fish1418(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "CC"
    manosPoker["A6s"] :=  "CC"
    manosPoker["A5s"] :=  "CC"
    manosPoker["A4s"] :=  "CC"
    manosPoker["A3s"] :=  "CC"
    manosPoker["A2s"] :=  "CC"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "CC"
    manosPoker["KTs"] :=  "CC"
    manosPoker["K9s"] :=  "CC"
    manosPoker["K8s"] :=  "CC"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "CC"
    manosPoker["KJo"] :=  "CC"
    manosPoker["KTo"] :=  "CC"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "CC"
    manosPoker["QTs"] :=  "CC"
    manosPoker["Q9s"] :=  "CC"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "CC"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "CC"
    manosPoker["J9s"] :=  "CC"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "CC"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "CC"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish1114(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BSC"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "CC"
    manosPoker["A6s"] :=  "CC"
    manosPoker["A5s"] :=  "CC"
    manosPoker["A4s"] :=  "CC"
    manosPoker["A3s"] :=  "CC"
    manosPoker["A2s"] :=  "CC"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "CC"
    manosPoker["KTs"] :=  "CC"
    manosPoker["K9s"] :=  "CC"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "CC"
    manosPoker["KJo"] :=  "CC"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "CC"
    manosPoker["QTs"] :=  "CC"
    manosPoker["Q9s"] :=  "CC"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "CC"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "CC"
    manosPoker["J9s"] :=  "CC"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "CC"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish811(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BAI"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "FOLD"
    manosPoker["A5s"] :=  "FOLD"
    manosPoker["A4s"] :=  "FOLD"
    manosPoker["A3s"] :=  "FOLD"
    manosPoker["A2s"] :=  "FOLD"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "CC"
    manosPoker["KTs"] :=  "CC"
    manosPoker["K9s"] :=  "FOLD"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "CC"
    manosPoker["KJo"] :=  "CC"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "CC"
    manosPoker["QTs"] :=  "CC"
    manosPoker["Q9s"] :=  "FOLD"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "CC"
    manosPoker["J9s"] :=  "FOLD"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "FOLD"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

nashpushSB_BTN_MIN_fish08(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "3BSC"
    manosPoker["KKo"] :=  "3BSC"
    manosPoker["QQo"] :=  "3BAI"
    manosPoker["JJo"] :=  "3BAI"
    manosPoker["TTo"] :=  "3BAI"
    manosPoker["99o"] :=  "3BAI"
    manosPoker["88o"] :=  "3BAI"
    manosPoker["77o"] :=  "3BAI"
    manosPoker["66o"] :=  "3BAI"
    manosPoker["55o"] :=  "3BAI"
    manosPoker["44o"] :=  "3BAI"
    manosPoker["33o"] :=  "FOLD"
    manosPoker["22o"] :=  "FOLD"
    manosPoker["AKs"] :=  "3BAI"
    manosPoker["AQs"] :=  "3BAI"
    manosPoker["AJs"] :=  "3BAI"
    manosPoker["ATs"] :=  "3BAI"
    manosPoker["A9s"] :=  "3BAI"
    manosPoker["A8s"] :=  "3BAI"
    manosPoker["A7s"] :=  "3BAI"
    manosPoker["A6s"] :=  "FOLD"
    manosPoker["A5s"] :=  "3BAI"
    manosPoker["A4s"] :=  "3BAI"
    manosPoker["A3s"] :=  "FOLD"
    manosPoker["A2s"] :=  "FOLD"
    manosPoker["AKo"] :=  "3BAI"
    manosPoker["AQo"] :=  "3BAI"
    manosPoker["AJo"] :=  "3BAI"
    manosPoker["ATo"] :=  "3BAI"
    manosPoker["A9o"] :=  "3BAI"
    manosPoker["A8o"] :=  "FOLD"
    manosPoker["A7o"] :=  "FOLD"
    manosPoker["A6o"] :=  "FOLD"
    manosPoker["A5o"] :=  "FOLD"
    manosPoker["A4o"] :=  "FOLD"
    manosPoker["A3o"] :=  "FOLD"
    manosPoker["A2o"] :=  "FOLD"
    manosPoker["KQs"] :=  "3BAI"
    manosPoker["KJs"] :=  "3BAI"
    manosPoker["KTs"] :=  "3BAI"
    manosPoker["K9s"] :=  "FOLD"
    manosPoker["K8s"] :=  "FOLD"
    manosPoker["K7s"] :=  "FOLD"
    manosPoker["K6s"] :=  "FOLD"
    manosPoker["K5s"] :=  "FOLD"
    manosPoker["K4s"] :=  "FOLD"
    manosPoker["K3s"] :=  "FOLD"
    manosPoker["K2s"] :=  "FOLD"
    manosPoker["KQo"] :=  "CC"
    manosPoker["KJo"] :=  "FOLD"
    manosPoker["KTo"] :=  "FOLD"
    manosPoker["K9o"] :=  "FOLD"
    manosPoker["K8o"] :=  "FOLD"
    manosPoker["K7o"] :=  "FOLD"
    manosPoker["K6o"] :=  "FOLD"
    manosPoker["K5o"] :=  "FOLD"
    manosPoker["K4o"] :=  "FOLD"
    manosPoker["K3o"] :=  "FOLD"
    manosPoker["K2o"] :=  "FOLD"
    manosPoker["QJs"] :=  "FOLD"
    manosPoker["QTs"] :=  "FOLD"
    manosPoker["Q9s"] :=  "FOLD"
    manosPoker["Q8s"] :=  "FOLD"
    manosPoker["Q7s"] :=  "FOLD"
    manosPoker["Q6s"] :=  "FOLD"
    manosPoker["Q5s"] :=  "FOLD"
    manosPoker["Q4s"] :=  "FOLD"
    manosPoker["Q3s"] :=  "FOLD"
    manosPoker["Q2s"] :=  "FOLD"
    manosPoker["QJo"] :=  "FOLD"
    manosPoker["QTo"] :=  "FOLD"
    manosPoker["Q9o"] :=  "FOLD"
    manosPoker["Q8o"] :=  "FOLD"
    manosPoker["Q7o"] :=  "FOLD"
    manosPoker["Q6o"] :=  "FOLD"
    manosPoker["Q5o"] :=  "FOLD"
    manosPoker["Q4o"] :=  "FOLD"
    manosPoker["Q3o"] :=  "FOLD"
    manosPoker["Q2o"] :=  "FOLD"
    manosPoker["JTs"] :=  "FOLD"
    manosPoker["J9s"] :=  "FOLD"
    manosPoker["J8s"] :=  "FOLD"
    manosPoker["J7s"] :=  "FOLD"
    manosPoker["J6s"] :=  "FOLD"
    manosPoker["J5s"] :=  "FOLD"
    manosPoker["J4s"] :=  "FOLD"
    manosPoker["J3s"] :=  "FOLD"
    manosPoker["J2s"] :=  "FOLD"
    manosPoker["JTo"] :=  "FOLD"
    manosPoker["J9o"] :=  "FOLD"
    manosPoker["J8o"] :=  "FOLD"
    manosPoker["J7o"] :=  "FOLD"
    manosPoker["J6o"] :=  "FOLD"
    manosPoker["J5o"] :=  "FOLD"
    manosPoker["J4o"] :=  "FOLD"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "FOLD"
    manosPoker["T8s"] :=  "FOLD"
    manosPoker["T7s"] :=  "FOLD"
    manosPoker["T6s"] :=  "FOLD"
    manosPoker["T5s"] :=  "FOLD"
    manosPoker["T4s"] :=  "FOLD"
    manosPoker["T3s"] :=  "FOLD"
    manosPoker["T2s"] :=  "FOLD"
    manosPoker["T9o"] :=  "FOLD"
    manosPoker["T8o"] :=  "FOLD"
    manosPoker["T7o"] :=  "FOLD"
    manosPoker["T6o"] :=  "FOLD"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "FOLD"
    manosPoker["97s"] :=  "FOLD"
    manosPoker["96s"] :=  "FOLD"
    manosPoker["95s"] :=  "FOLD"
    manosPoker["94s"] :=  "FOLD"
    manosPoker["93s"] :=  "FOLD"
    manosPoker["92s"] :=  "FOLD"
    manosPoker["98o"] :=  "FOLD"
    manosPoker["97o"] :=  "FOLD"
    manosPoker["96o"] :=  "FOLD"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "FOLD"
    manosPoker["86s"] :=  "FOLD"
    manosPoker["85s"] :=  "FOLD"
    manosPoker["84s"] :=  "FOLD"
    manosPoker["83s"] :=  "FOLD"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "FOLD"
    manosPoker["86o"] :=  "FOLD"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "FOLD"
    manosPoker["75s"] :=  "FOLD"
    manosPoker["74s"] :=  "FOLD"
    manosPoker["73s"] :=  "FOLD"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "FOLD"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "FOLD"
    manosPoker["64s"] :=  "FOLD"
    manosPoker["63s"] :=  "FOLD"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "FOLD"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "FOLD"
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
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}