; NOTE: clicktablas() now uses a cross-process lock file in ..\runtime\blockclick.lock for mouse safety.
; Ensure ..\runtime\ exists and is writable. See includes\funciones2.ahk for details.
global CLICK_LOCK_DEBUG := 1

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



;MsgBox, %p2vip_3h% %p2pfr_3h% %p2_3bet_3h%
;MsgBox, %x1% %y1%
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

;MsgBox, p1btn %p1btn% p1bet %p1bet% 


; --- DEBUG: Confirm all arguments received ---
runtimeDir := A_ScriptDir . "\..\runtime"
if !FileExist(runtimeDir)
    FileCreateDir, %runtimeDir%

debugFile := runtimeDir . "\BTN_args_debug.txt"

f := FileOpen(debugFile, "a")
if (IsObject(f)) {
    f.WriteLine("----- " . A_Now . " -----")
    f.WriteLine("Total args: " . A_Args.Length())
    Loop % A_Args.Length() {
        f.WriteLine("Arg " . A_Index . ": " . A_Args[A_Index])
    }
    f.WriteLine("---------------------------")
    f.Close()
}



resultado := BTN(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3manos_3h,p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu) 

BTN(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3manos_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{


	;MsgBox, %p2manos_3h%
	tiempoinicio := A_TickCount
	

	if(p1btn = 0 && p1bet = "")
	{
		
	
		
		if(p2bet = 0.5)
		{
		
			if(p3bet = 1)
			{


				
				stackvalue := stackefect

				
	            resultado := getcartas2(mesa, mano)

	            mano := resultado.mano
	            manos := resultado.manos
				


				;MsgBox, aqui, %stackvalue% %mano% %manos%

				situacionglobal := "BTN"
				
				;MsgBox, p2 %p2% p3 %p3%
				
				if(p3 == "fish" && p2 == "fish")
				{
					;MsgBox, entramos aqui
					situacion := "vs 2 fishes"
					btnvsfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
				}
				
				if(p3 == "reg" && p2 == "reg")
				{	
					situacion := "vs 2 regs"
					
					btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
				}
				
				if(p3 == "fish" && p2 == "reg")
				{
					situacion := "vs  reg sb fish bb"
					btnvsregfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
				}
				if(p2 == "fish" && p3 == "reg")
				{
					situacion := "vs  fish sb reg bb"
					btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
				}
				
				tiempoFin_archivo := A_TickCount
			    duracion_archivo := (tiempoFin_archivo - tiempoinicio) / 1000
			    ;MsgBox, tiempo ejecucion btn %duracion_archivo%
				
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    			
    			
			    ExitApp

				

				
			}
			
		}
		
		
		
		
	
	}

	if( 1 < p2bet = p1bet <= 2 && p3bet = 1 && p1btn = 0)
		{
			;nos enfrentemos a un coldcall de sb + fold bb
		}
	if(p2bet > p1bet && p3bet = 1 && p1btn = 0)
	{
		;Msgbox, nos enfrentemos a un 3bet de sb y fold de bb
		stackvalue := stackefect

			
        resultado := getcartas2(mesa, mano)

        mano := resultado.mano
        manos := resultado.manos
		


		;MsgBox, aqui, %stackvalue% %mano% %manos%

		situacionglobal := "BTNvs3bet_SB_FOLD_BB"
		

		
		if(p2 == "fish")
		{
			;MsgBox, entramos aqui
			situacion := "vs 2 fishes"
			btnvsfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		
		if(p3 == "reg")
		{	
			situacion := "vs 2 regs"
			
			btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		
		if(p3 == "fish" && p2 == "reg")
		{
			situacion := "vs  reg sb fish bb"
			btnvsregfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		if(p2 == "fish" && p3 == "reg")
		{
			situacion := "vs  fish sb reg bb"
			btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}

		result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
			
			
		
	}
	if(p2bet = 0.5 && p1bet = 2 && p3bet > p1bet)
	{
		;Msgbox, nos enfrentemos a un 3bet de bb y sb foldeo
		stackvalue := stackefect

			
        resultado := getcartas2(mesa, mano)

        mano := resultado.mano
        manos := resultado.manos
		


		;MsgBox, aqui, %stackvalue% %mano% %manos%

		situacionglobal := "BTNvs3bet_BB_FOLD_SB"
		

		
		if(p2 == "fish")
		{
			;MsgBox, entramos aqui
			situacion := "vs 2 fishes"
			btnvsfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		
		if(p3 == "reg")
		{	
			situacion := "vs 2 regs"
			
			btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		
		if(p3 == "fish" && p2 == "reg")
		{
			situacion := "vs  reg sb fish bb"
			btnvsregfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}
		if(p2 == "fish" && p3 == "reg")
		{
			situacion := "vs  fish sb reg bb"
			btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
		}


		result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
			
			
		
	}


	
	ExitApp
}	


btnvsreg(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
{
	
	;stackvalue := 9
	 ;MsgBox, % stackvalue
	;manos := "96s"
	if (stackvalue >= 23)
	{
	    if (situacionfinal = "btn 25+")
	    {
	        return
	    }
		
	    situacionfinal := "btn 25+"
		;MsgBox, % situacionfinal
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)

		imagen := 86
		popuptabla(posx, posy, mesa, imagen)

		valormanos := nashpushbtn25reg(manos)

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
	else if (stackvalue >= 19 && stackvalue < 23)
	{
	    if (situacionfinal = "btn 21")
	    {
	        return
	    }
	    situacionfinal := "btn 21+"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)

		imagen := 87
		popuptabla(posx, posy, mesa, imagen)

		valormanos := nashpushbtn21reg(manos)

		

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
	else if (stackvalue >= 16 && stackvalue < 19)
	{

	    if (situacionfinal = "btn 17")
	    {
	        return
	    }
	    situacionfinal := "btn 17"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)

		imagen := 88
		popuptabla(posx, posy, mesa, imagen)

		valormanos := nashpushbtn17reg(manos)

		;MsgBox, % valormanos manos
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
	else if (stackvalue >= 14 && stackvalue < 16)
	{
	    if (situacionfinal = "btn 15")
	    {
	        return
	    }
	    situacionfinal := "btn 15"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)

		imagen := 89
		popuptabla(posx, posy, mesa, imagen)
		valormanos := nashpushbtn15reg(manos)

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
	else if (stackvalue >= 12 && stackvalue < 14)
	{
	    if (situacionfinal = "btn 13")
	    {
	        return
	    }
	    situacionfinal := "btn 13"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

		imagen := 90
		popuptabla(posx, posy, mesa, imagen)
		valormanos := nashpushbtn13reg(manos)
		;MsgBox, % valormanos
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
	else if (stackvalue >= 10.5 && stackvalue < 12)
	{
	    if (situacionfinal = "btn 11")
	    {
	        return
	    }
	    situacionfinal := "btn 11"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

		imagen := 91
		popuptabla(posx, posy, mesa, imagen)
		valormanos := nashpushbtn11reg(manos)

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
	else if (stackvalue >= 9.5 && stackvalue < 10.5)
	{
	    if (situacionfinal = "btn 10")
	    {
	        return
	    }
	    situacionfinal := "btn 10"
	   	poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F2P1", x1t, y1t, anchot, altot)

		imagen := 92
		popuptabla(posx, posy, mesa, imagen)
		valormanos := nashpushbtn10reg(manos)

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
	else if (stackvalue >= 9 && stackvalue < 9.5)
	{
	    if (situacionfinal = "btn 9")
	    {
	        return
	    }
	    situacionfinal := "btn 9"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F2P2", x1t, y1t, anchot, altot)

		imagen := 93
		popuptabla(posx, posy, mesa, imagen)
		valormanos := nashpushbtn9reg(manos)

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
	else if (stackvalue < 9)
	{

	    if (situacionfinal = "btn -9")
	    {
	        return
	    }
	    situacionfinal := "btn -9"
	    poscionclick("IIIMU", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F2P3", x1t, y1t, anchot, altot)

		imagen := 94
		popuptabla(posx, posy, mesa, imagen)
		;MsgBox, % manos
		valormanos := nashpushbtn9menosreg(manos)


		;MsgBox, % valormanos
		if IsNumber(valormanos)
		{
		    if (valormanos > stackvalue)
			{

				color := "green"
				popupnashpush(valormanos, color, posx, posy, mesa)
	    
				 
				movimientos("ALLIN", x1, y1, ancho, alto)
			}
			else
			{
				;MsgBox, % valormanos color posx posy mesa
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
		else if IsStr(valormanos)
		{
		   
			parts := StrSplit(valormanos, "o")  ; Divide la cadena 'var' en un array, usando 'o' como delimitador
			vlongitud := parts.MaxIndex()  ; La longitud del array

			if (vlongitud = 2)
			{
				var1 := parts[1]  ; La primera parte de la cadena, que será '10'
				var2 := parts[2]  ; La segunda parte de la cadena, que será '4'

				;MsgBox, % var1 valormanos var2
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
			}



			;vlongitud := parts.MaxIndex()  ; La longitud del array

			;MsgBox % "var1: " var1 "`nvar2: " var2 "`nvar3: " var3 "`nvlongitud: " vlongitud  ; Muestra un cuadro de mensaje con los valores
		}
		
	}
	
	
	
	
}

btnvsfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
{

    if (stackvalue >= 18)
    {
        if (situacionfinal = "btn +18 fish")
        {
            return
        }
        situacionfinal := "btn +18 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)

		imagen := 1
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn18fish(manos)

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
    else if (stackvalue >= 14 && stackvalue < 18)
    {
        if (situacionfinal = "btn 14-18 fish")
        {
            return
        }
        situacionfinal := "btn 14-18 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)

		imagen := 2
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn1418fish(manos)

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
    else if (stackvalue >= 11 && stackvalue < 14)
    {
        if (situacionfinal = "btn 11-14 fish")
        {
            return
        }

        situacionfinal := "btn 11-14 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)

		imagen := 3
		popuptabla(posx, posy, mesa, imagen)


		valormanos := btn1114fish(manos)



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
    else if (stackvalue >= 8 && stackvalue < 11)
    {
        if (situacionfinal = "btn 8-11 fish")
        {
            return
        }
        situacionfinal := "btn 8-11 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)

		imagen := 4
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn811fish(manos)

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
    else if (stackvalue >= 6 && stackvalue < 8)
    {
        if (situacionfinal = "btn 6-8 fish")
        {
            return
        }
        situacionfinal := "btn 6-8 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

		imagen := 5
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn68fish(manos)

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
    else if (stackvalue < 6)
    {
        if (situacionfinal = "btn -6 fish")
        {
            return
        }
        situacionfinal := "btn -6 fish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

		imagen := 6
		popuptabla(posx, posy, mesa, imagen)

		valormanos := nashpushbtn9menosreg(manos)

		;MsgBox, % valormanos
		if IsNumber(valormanos)
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
		else if IsStr(valormanos)
		{
		   
			parts := StrSplit(valormanos, "o")  ; Divide la cadena 'var' en un array, usando 'o' como delimitador
			vlongitud := parts.MaxIndex()  ; La longitud del array

			if (vlongitud = 2)
			{
				var1 := parts[1]  ; La primera parte de la cadena, que será '10'
				var2 := parts[2]  ; La segunda parte de la cadena, que será '4'
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
			}



			;vlongitud := parts.MaxIndex()  ; La longitud del array

			;MsgBox % "var1: " var1 "`nvar2: " var2 "`nvar3: " var3 "`nvlongitud: " vlongitud  ; Muestra un cuadro de mensaje con los valores
		}
    }
}

btnvsregfish(manos, stackvalue, mesa, x1t, y1t, anchot, altot, alto, ancho, x1, y1, posx, posy)
{

    if (stackvalue >= 18)
    {
        if (situacionfinal = "btn +18 regfish")
        {
            return
        }
        situacionfinal := "btn +18 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F2P1", x1t, y1t, anchot, altot)

		imagen := 7
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn18regfish(manos)

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
    else if (stackvalue >= 14 && stackvalue < 18)
    {
        if (situacionfinal = "btn 14-18 regfish")
        {
            return
        }
        situacionfinal := "btn 14-18 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F2P2", x1t, y1t, anchot, altot)

		imagen := 8
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn1418regfish(manos)

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
    else if (stackvalue >= 11 && stackvalue < 14)
    {
        if (situacionfinal = "btn 11-14 regfish")
        {
            return
        }
        situacionfinal := "btn 11-14 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)

		imagen := 3
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn1114fish(manos)

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
    else if (stackvalue >= 8 && stackvalue < 11)
    {
        if (situacionfinal = "btn 8-11 regfish")
        {
            return
        }
        situacionfinal := "btn 8-11 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)

		imagen := 4
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn811fish(manos)

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
    else if (stackvalue >= 6 && stackvalue < 8)
    {
        if (situacionfinal = "btn 6-8 regfish")
        {
            return
        }
        situacionfinal := "btn 6-8 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)

		imagen := 5
		popuptabla(posx, posy, mesa, imagen)

		valormanos := btn68fish(manos)

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
    else if (stackvalue < 6)
    {
        if (situacionfinal = "btn -6 regfish")
        {
            return
        }
        situacionfinal := "btn -6 regfish"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
		poscionclick("O61", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)

		imagen := 6
		popuptabla(posx, posy, mesa, imagen)

		valormanos := nashpushbtn9menosreg(manos)

		;MsgBox, % valormanos
		if IsNumber(valormanos)
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
		else if IsStr(valormanos)
		{
		   
			parts := StrSplit(valormanos, "o")  ; Divide la cadena 'var' en un array, usando 'o' como delimitador
			vlongitud := parts.MaxIndex()  ; La longitud del array

			if (vlongitud = 2)
			{
				var1 := parts[1]  ; La primera parte de la cadena, que será '10'
				var2 := parts[2]  ; La segunda parte de la cadena, que será '4'
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
			}



			;vlongitud := parts.MaxIndex()  ; La longitud del array

			;MsgBox % "var1: " var1 "`nvar2: " var2 "`nvar3: " var3 "`nvlongitud: " vlongitud  ; Muestra un cuadro de mensaje con los valores
		}
    }
}



nashpushbtn9menosreg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  15
	manosPoker["KKo"] :=  15
	manosPoker["QQo"] :=  15
	manosPoker["JJo"] :=  15
	manosPoker["TTo"] :=  15
	manosPoker["99o"] :=  15
	manosPoker["88o"] :=  15
	manosPoker["77o"] :=  15
	manosPoker["66o"] :=  15
	manosPoker["55o"] :=  15
	manosPoker["44o"] :=  15
	manosPoker["33o"] :=  15
	manosPoker["22o"] :=  15
	manosPoker["AKs"] :=  15	
	manosPoker["AQs"] :=  15	
	manosPoker["AJs"] :=  15
	manosPoker["ATs"] :=  15
	manosPoker["A9s"] :=  15
	manosPoker["A8s"] :=  15
	manosPoker["A7s"] :=  15
	manosPoker["A6s"] :=  15
	manosPoker["A5s"] :=  15
	manosPoker["A4s"] :=  15
	manosPoker["A3s"] :=  15
	manosPoker["A2s"] :=  15
	manosPoker["AKo"] :=  15	
	manosPoker["AQo"] :=  15	
	manosPoker["AJo"] :=  15
	manosPoker["ATo"] :=  15
	manosPoker["A9o"] :=  15
	manosPoker["A8o"] :=  15
	manosPoker["A7o"] :=  15
	manosPoker["A6o"] :=  15
	manosPoker["A5o"] :=  15
	manosPoker["A4o"] :=  13
	manosPoker["A3o"] :=  13
	manosPoker["A2o"] :=  12
	manosPoker["KQs"] :=  15
	manosPoker["KJs"] :=  15
	manosPoker["KTs"] :=  15
	manosPoker["K9s"] :=  15
	manosPoker["K8s"] :=  15
	manosPoker["K7s"] :=  15
	manosPoker["K6s"] :=  13
	manosPoker["K5s"] :=  10
	manosPoker["K4s"] :=  10
	manosPoker["K3s"] :=  9
	manosPoker["K2s"] :=  8
	manosPoker["KQo"] :=  15
	manosPoker["KJo"] :=  15
	manosPoker["KTo"] :=  15
	manosPoker["K9o"] :=  9
	manosPoker["K8o"] :=  7
	manosPoker["K7o"] :=  7
	manosPoker["K6o"] :=  7
	manosPoker["K5o"] :=  6
	manosPoker["K4o"] :=  6
	manosPoker["K3o"] :=  5
	manosPoker["K2o"] :=  5	
	manosPoker["QJs"] :=  15
	manosPoker["QTs"] :=  15
	manosPoker["Q9s"] :=  15
	manosPoker["Q8s"] :=  15
	manosPoker["Q7s"] :=  10
	manosPoker["Q6s"] :=  10
	manosPoker["Q5s"] :=  8
	manosPoker["Q4s"] :=  7
	manosPoker["Q3s"] :=  6
	manosPoker["Q2s"] :=  5
	manosPoker["QJo"] :=  15
	manosPoker["QTo"] :=  15
	manosPoker["Q9o"] :=  8
	manosPoker["Q8o"] :=  6
	manosPoker["Q7o"] :=  4
	manosPoker["Q6o"] :=  4
	manosPoker["Q5o"] :=  4
	manosPoker["Q4o"] :=  3
	manosPoker["Q3o"] :=  0
	manosPoker["Q2o"] :=  0
	manosPoker["JTs"] :=  15
	manosPoker["J9s"] :=  15
	manosPoker["J8s"] :=  15
	manosPoker["J7s"] :=  10
	manosPoker["J6s"] :=  6
	manosPoker["J5s"] :=  5
	manosPoker["J4s"] :=  3
	manosPoker["J3s"] :=  2
	manosPoker["J2s"] :=  0
	manosPoker["JTo"] :=  15
	manosPoker["J9o"] :=  8
	manosPoker["J8o"] :=  5
	manosPoker["J7o"] :=  3
	manosPoker["J6o"] :=  0
	manosPoker["J5o"] :=  0
	manosPoker["J4o"] :=  0
	manosPoker["J3o"] :=  0
	manosPoker["J2o"] :=  0
	manosPoker["T9s"] :=  15
	manosPoker["T8s"] :=  15
	manosPoker["T7s"] :=  13
	manosPoker["T6s"] :=  "7o3"
	manosPoker["T5s"] :=  0
	manosPoker["T4s"] :=  0
	manosPoker["T3s"] :=  0
	manosPoker["T2s"] :=  0
	manosPoker["T9o"] :=  10
	manosPoker["T8o"] :=  4
	manosPoker["T7o"] :=  0
	manosPoker["T6o"] :=  0
	manosPoker["T5o"] :=  0
	manosPoker["T4o"] :=  0
	manosPoker["T3o"] :=  0
	manosPoker["T2o"] :=  0
	manosPoker["98s"] :=  15
	manosPoker["97s"] :=  13
	manosPoker["96s"] :=  "10o4"
	manosPoker["95s"] :=  0
	manosPoker["94s"] :=  0
	manosPoker["93s"] :=  0
	manosPoker["92s"] :=  0
	manosPoker["98o"] :=  "5o4"
	manosPoker["97o"] :=  0
	manosPoker["96o"] :=  0
	manosPoker["95o"] :=  0
	manosPoker["94o"] :=  0
	manosPoker["93o"] :=  0
	manosPoker["92o"] :=  0
	manosPoker["87s"] :=  "15o3"
	manosPoker["86s"] :=  "12o4"
	manosPoker["85s"] :=  0
	manosPoker["84s"] :=  0
	manosPoker["83s"] :=  0
	manosPoker["82s"] :=  0
	manosPoker["87o"] :=  0
	manosPoker["86o"] :=  0
	manosPoker["85o"] :=  0
	manosPoker["84o"] :=  0
	manosPoker["83o"] :=  0
	manosPoker["82o"] :=  0
	manosPoker["76s"] :=  "13o4"
	manosPoker["75s"] :=  "9o5"
	manosPoker["74s"] :=  0
	manosPoker["73s"] :=  0
	manosPoker["72s"] :=  0
	manosPoker["76o"] :=  0
	manosPoker["75o"] :=  0
	manosPoker["74o"] :=  0
	manosPoker["73o"] :=  0
	manosPoker["72o"] :=  0
	manosPoker["65s"] :=  "11o5"
	manosPoker["63s"] :=  0
	manosPoker["64s"] :=  0
	manosPoker["62s"] :=  0
	manosPoker["65o"] :=  0
	manosPoker["64o"] :=  0
	manosPoker["63o"] :=  0
	manosPoker["62o"] :=  0
	manosPoker["54s"] :=  "8o6"
	manosPoker["53s"] :=  0
	manosPoker["52s"] :=  0
	manosPoker["54o"] :=  0
	manosPoker["53o"] :=  0
	manosPoker["52o"] :=  0
	manosPoker["43s"] :=  0
	manosPoker["42s"] :=  0
	manosPoker["43o"] :=  0
	manosPoker["42o"] :=  0
	manosPoker["32s"] :=  0
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}



nashpushbtn9reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "OS"
	manosPoker["JJo"] :=  "OS"
	manosPoker["TTo"] :=  "OS"
	manosPoker["99o"] :=  "OS"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"	
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "OS"
	manosPoker["A3o"] :=  "OS"
	manosPoker["A2o"] :=  "OS"
	manosPoker["KQs"] :=  "OS"
	manosPoker["KJs"] :=  "OS"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "OS"
	manosPoker["K7s"] :=  "OS"
	manosPoker["K6s"] :=  "OS"
	manosPoker["K5s"] :=  "OS"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORC"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "OS"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "OS"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORC"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "OS"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "OS"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORC"
	manosPoker["T8s"] :=  "OS"
	manosPoker["T7s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
	manosPoker["97s"] :=  "OS"
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
	manosPoker["87s"] :=  "OS"
	manosPoker["86s"] :=  "OS"
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
	manosPoker["76s"] :=  "OS"
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
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "FOLD"
	manosPoker["52s"] :=  "FOLD"
	manosPoker["54o"] :=  "FOLD"
	manosPoker["53o"] :=  "FOLD"
	manosPoker["52o"] :=  "FOLD"
	manosPoker["42s"] :=  "FOLD"
	manosPoker["43o"] :=  "FOLD"
	manosPoker["42o"] :=  "FOLD"
	manosPoker["32s"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

nashpushbtn10reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "OS"
	manosPoker["A3o"] :=  "OS"
	manosPoker["A2o"] :=  "OS"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "OS"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "OS"
	manosPoker["K7s"] :=  "OS"
	manosPoker["K6s"] :=  "OS"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "OS"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
	manosPoker["97s"] :=  "OS"
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
	manosPoker["87s"] :=  "OS"
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
	manosPoker["76s"] :=  "OS"
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
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "FOLD"
	manosPoker["52s"] :=  "FOLD"
	manosPoker["54o"] :=  "FOLD"
	manosPoker["53o"] :=  "FOLD"
	manosPoker["52o"] :=  "FOLD"
	manosPoker["42s"] :=  "FOLD"
	manosPoker["43o"] :=  "FOLD"
	manosPoker["42o"] :=  "FOLD"
	manosPoker["32s"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

nashpushbtn11reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "OS"
	manosPoker["A3o"] :=  "OS"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORC"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "FOLD"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "OS"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
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
	manosPoker["87s"] :=  "OS"
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
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "FOLD"
	manosPoker["52s"] :=  "FOLD"
	manosPoker["54o"] :=  "FOLD"
	manosPoker["53o"] :=  "FOLD"
	manosPoker["52o"] :=  "FOLD"
	manosPoker["42s"] :=  "FOLD"
	manosPoker["43o"] :=  "FOLD"
	manosPoker["42o"] :=  "FOLD"
	manosPoker["32s"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

nashpushbtn13reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "ORC"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "ORC"
	manosPoker["A8s"] :=  "ORC"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "ORC"
	manosPoker["A3o"] :=  "FOLD"
	manosPoker["A2o"] :=  "FOLD"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORC"
	manosPoker["KTs"] :=  "ORC"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "FOLD"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
	manosPoker["97s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
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

nashpushbtn15reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "ORC"
	manosPoker["77o"] :=  "ORC"
	manosPoker["66o"] :=  "ORC"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "ORC"
	manosPoker["A8s"] :=  "ORC"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "ORF"
	manosPoker["AKo"] :=  "ORC"
	manosPoker["AQo"] :=  "ORC"
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "FOLD"
	manosPoker["A2o"] :=  "FOLD"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORC"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "FOLD"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORC"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
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
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
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
	manosPoker["76s"] :=  "ORF"
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

nashpushbtn17reg(manos)
{

; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "ORC"
	manosPoker["77o"] :=  "ORC"
	manosPoker["66o"] :=  "ORC"
	manosPoker["55o"] :=  "ORC"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "ORC"
	manosPoker["A8s"] :=  "ORC"
	manosPoker["A7s"] :=  "ORF"
	manosPoker["A6s"] :=  "ORF"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "ORC"
	manosPoker["A2s"] :=  "ORF"
	manosPoker["AKo"] :=  "ORC"
	manosPoker["AQo"] :=  "ORC"
	manosPoker["AJo"] :=  "ORC"
	manosPoker["ATo"] :=  "ORC"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "FOLD"
	manosPoker["A2o"] :=  "FOLD"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORF"
	manosPoker["KTs"] :=  "ORF"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "ORF"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORF"
	manosPoker["QTs"] :=  "ORF"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "FOLD"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORF"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORF"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
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
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
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
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "FOLD"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
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

nashpushbtn21reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "ORC"
	manosPoker["77o"] :=  "ORC"
	manosPoker["66o"] :=  "ORC"
	manosPoker["55o"] :=  "ORC"
	manosPoker["44o"] :=  "ORC"
	manosPoker["33o"] :=  "ORF"
	manosPoker["22o"] :=  "ORF"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "ORC"
	manosPoker["A8s"] :=  "ORC"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "ORC"
	manosPoker["AQo"] :=  "ORC"
	manosPoker["AJo"] :=  "ORC"
	manosPoker["ATo"] :=  "ORC"
	manosPoker["A9o"] :=  "ORF"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "FOLD"
	manosPoker["A3o"] :=  "FOLD"
	manosPoker["A2o"] :=  "FOLD"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORCS"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORCS"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORCS"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "ORF"
	manosPoker["T5s"] :=  "FOLD"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "FOLD"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
	manosPoker["85s"] :=  "ORF"
	manosPoker["84s"] :=  "FOLD"
	manosPoker["83s"] :=  "FOLD"
	manosPoker["82s"] :=  "FOLD"
	manosPoker["87o"] :=  "FOLD"
	manosPoker["86o"] :=  "FOLD"
	manosPoker["85o"] :=  "FOLD"
	manosPoker["84o"] :=  "FOLD"
	manosPoker["83o"] :=  "FOLD"
	manosPoker["82o"] :=  "FOLD"
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "ORF"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
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


nashpushbtn25reg(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "ORC"
	manosPoker["77o"] :=  "ORC"
	manosPoker["66o"] :=  "ORC"
	manosPoker["55o"] :=  "ORC"
	manosPoker["44o"] :=  "ORC"
	manosPoker["33o"] :=  "ORF"
	manosPoker["22o"] :=  "ORF"
	manosPoker["AKs"] :=  "ORC"
	manosPoker["AQs"] :=  "ORC"	
	manosPoker["AJs"] :=  "ORC"
	manosPoker["ATs"] :=  "ORC"
	manosPoker["A9s"] :=  "ORC"
	manosPoker["A8s"] :=  "ORCS"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "ORC"
	manosPoker["AQo"] :=  "ORC"
	manosPoker["AJo"] :=  "ORC"
	manosPoker["ATo"] :=  "ORC"
	manosPoker["A9o"] :=  "ORCS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "FOLD"
	manosPoker["A3o"] :=  "FOLD"
	manosPoker["A2o"] :=  "FOLD"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORCS"
	manosPoker["K8s"] :=  "ORCS"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORCS"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORCS"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORCS"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "ORF"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORCS"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "ORF"
	manosPoker["T5s"] :=  "FOLD"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "FOLD"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORCS"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORCS"
	manosPoker["86s"] :=  "ORF"
	manosPoker["85s"] :=  "ORF"
	manosPoker["84s"] :=  "FOLD"
	manosPoker["83s"] :=  "FOLD"
	manosPoker["82s"] :=  "FOLD"
	manosPoker["87o"] :=  "FOLD"
	manosPoker["86o"] :=  "FOLD"
	manosPoker["85o"] :=  "FOLD"
	manosPoker["84o"] :=  "FOLD"
	manosPoker["83o"] :=  "FOLD"
	manosPoker["82o"] :=  "FOLD"
	manosPoker["76s"] :=  "ORCS"
	manosPoker["75s"] :=  "ORF"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
	manosPoker["64s"] :=  "ORF"
	manosPoker["63s"] :=  "FOLD"
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "ORF"
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

btn18fish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "ORF"
	manosPoker["22o"] :=  "ORF"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "ORCS"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "ORF"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "ORCS"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "ORF"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "ORF"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "ORF"
	manosPoker["Q2s"] :=  "ORF"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "ORF"
	manosPoker["J5s"] :=  "ORF"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORF"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "ORF"
	manosPoker["T5s"] :=  "FOLD"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "FOLD"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
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
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "ORF"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
	manosPoker["64s"] :=  "ORF"
	manosPoker["63s"] :=  "FOLD"
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "ORF"
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

btn18regfish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "ORF"
	manosPoker["22o"] :=  "ORF"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "ORCS"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "ORF"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "ORCS"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "ORF"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "ORF"
	manosPoker["K7o"] :=  "ORF"
	manosPoker["K6o"] :=  "ORF"
	manosPoker["K5o"] :=  "ORF"
	manosPoker["K4o"] :=  "ORF"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "ORF"
	manosPoker["Q2s"] :=  "ORF"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "ORF"
	manosPoker["Q7o"] :=  "ORF"
	manosPoker["Q6o"] :=  "ORF"
	manosPoker["Q5o"] :=  "ORF"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "ORF"
	manosPoker["J5s"] :=  "ORF"
	manosPoker["J4s"] :=  "ORF"
	manosPoker["J3s"] :=  "ORF"
	manosPoker["J2s"] :=  "ORF"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "ORF"
	manosPoker["J7o"] :=  "ORF"
	manosPoker["J6o"] :=  "ORF"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORF"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "ORF"
	manosPoker["T5s"] :=  "ORF"
	manosPoker["T4s"] :=  "ORF"
	manosPoker["T3s"] :=  "ORF"
	manosPoker["T2s"] :=  "ORF"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "ORF"
	manosPoker["T7o"] :=  "ORF"
	manosPoker["T6o"] :=  "ORF"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
	manosPoker["95s"] :=  "ORF"
	manosPoker["94s"] :=  "ORF"
	manosPoker["93s"] :=  "FOLD"
	manosPoker["92s"] :=  "FOLD"
	manosPoker["98o"] :=  "ORF"
	manosPoker["97o"] :=  "ORF"
	manosPoker["96o"] :=  "ORF"
	manosPoker["95o"] :=  "FOLD"
	manosPoker["94o"] :=  "FOLD"
	manosPoker["93o"] :=  "FOLD"
	manosPoker["92o"] :=  "FOLD"
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
	manosPoker["85s"] :=  "ORF"
	manosPoker["84s"] :=  "ORF"
	manosPoker["83s"] :=  "FOLD"
	manosPoker["82s"] :=  "FOLD"
	manosPoker["87o"] :=  "ORF"
	manosPoker["86o"] :=  "ORF"
	manosPoker["85o"] :=  "FOLD"
	manosPoker["84o"] :=  "FOLD"
	manosPoker["83o"] :=  "FOLD"
	manosPoker["82o"] :=  "FOLD"
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "ORF"
	manosPoker["74s"] :=  "ORF"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "ORF"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
	manosPoker["64s"] :=  "ORF"
	manosPoker["63s"] :=  "ORF"
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "ORF"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "ORF"
	manosPoker["53s"] :=  "ORF"
	manosPoker["52s"] :=  "FOLD"
	manosPoker["54o"] :=  "FOLD"
	manosPoker["53o"] :=  "FOLD"
	manosPoker["52o"] :=  "FOLD"
	manosPoker["43s"] :=  "ORF"
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


btn1418fish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "ORCS"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "ORF"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "ORF"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "ORF"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORF"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "FOLD"
	manosPoker["T5s"] :=  "FOLD"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "FOLD"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
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
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "FOLD"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
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
	manosPoker["32o"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}

btn1418regfish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "ORCS"
	manosPoker["A7s"] :=  "ORCS"
	manosPoker["A6s"] :=  "ORCS"
	manosPoker["A5s"] :=  "ORCS"
	manosPoker["A4s"] :=  "ORCS"
	manosPoker["A3s"] :=  "ORCS"
	manosPoker["A2s"] :=  "ORCS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "ORF"
	manosPoker["A7o"] :=  "ORF"
	manosPoker["A6o"] :=  "ORF"
	manosPoker["A5o"] :=  "ORF"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "ORF"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "ORC"
	manosPoker["KJs"] :=  "ORCS"
	manosPoker["KTs"] :=  "ORCS"
	manosPoker["K9s"] :=  "ORF"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "ORF"
	manosPoker["K2s"] :=  "ORF"
	manosPoker["KQo"] :=  "ORCS"
	manosPoker["KJo"] :=  "ORF"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "ORF"
	manosPoker["K7o"] :=  "ORF"
	manosPoker["K6o"] :=  "ORF"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "ORCS"
	manosPoker["QTs"] :=  "ORCS"
	manosPoker["Q9s"] :=  "ORF"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "ORF"
	manosPoker["Q5s"] :=  "ORF"
	manosPoker["Q4s"] :=  "ORF"
	manosPoker["Q3s"] :=  "ORF"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "ORF"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "ORF"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "ORCS"
	manosPoker["J9s"] :=  "ORF"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "ORF"
	manosPoker["J6s"] :=  "ORF"
	manosPoker["J5s"] :=  "ORF"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "ORF"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "ORF"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "ORF"
	manosPoker["T6s"] :=  "ORF"
	manosPoker["T5s"] :=  "ORF"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "ORF"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
	manosPoker["97s"] :=  "ORF"
	manosPoker["96s"] :=  "ORF"
	manosPoker["95s"] :=  "ORF"
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
	manosPoker["87s"] :=  "ORF"
	manosPoker["86s"] :=  "ORF"
	manosPoker["85s"] :=  "ORF"
	manosPoker["84s"] :=  "FOLD"
	manosPoker["83s"] :=  "FOLD"
	manosPoker["82s"] :=  "FOLD"
	manosPoker["87o"] :=  "FOLD"
	manosPoker["86o"] :=  "FOLD"
	manosPoker["85o"] :=  "FOLD"
	manosPoker["84o"] :=  "FOLD"
	manosPoker["83o"] :=  "FOLD"
	manosPoker["82o"] :=  "FOLD"
	manosPoker["76s"] :=  "ORF"
	manosPoker["75s"] :=  "ORF"
	manosPoker["74s"] :=  "FOLD"
	manosPoker["73s"] :=  "FOLD"
	manosPoker["72s"] :=  "FOLD"
	manosPoker["76o"] :=  "FOLD"
	manosPoker["75o"] :=  "FOLD"
	manosPoker["74o"] :=  "FOLD"
	manosPoker["73o"] :=  "FOLD"
	manosPoker["72o"] :=  "FOLD"
	manosPoker["65s"] :=  "ORF"
	manosPoker["64s"] :=  "ORF"
	manosPoker["63s"] :=  "FOLD"
	manosPoker["62s"] :=  "FOLD"
	manosPoker["65o"] :=  "FOLD"
	manosPoker["64o"] :=  "FOLD"
	manosPoker["63o"] :=  "FOLD"
	manosPoker["62o"] :=  "FOLD"
	manosPoker["54s"] :=  "ORF"
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

btn1114fish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "ORC"
	manosPoker["99o"] :=  "ORC"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "ORF"
	manosPoker["A3o"] :=  "ORF"
	manosPoker["A2o"] :=  "ORF"
	manosPoker["KQs"] :=  "OS"
	manosPoker["KJs"] :=  "OS"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "ORF"
	manosPoker["K7s"] :=  "ORF"
	manosPoker["K6s"] :=  "ORF"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "ORF"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "ORF"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "ORF"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "ORF"
	manosPoker["Q7s"] :=  "ORF"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "ORF"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "ORF"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "ORF"
	manosPoker["J9o"] :=  "ORF"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "ORF"
	manosPoker["T7s"] :=  "FOLD"
	manosPoker["T6s"] :=  "FOLD"
	manosPoker["T5s"] :=  "FOLD"
	manosPoker["T4s"] :=  "FOLD"
	manosPoker["T3s"] :=  "FOLD"
	manosPoker["T2s"] :=  "FOLD"
	manosPoker["T9o"] :=  "ORF"
	manosPoker["T8o"] :=  "FOLD"
	manosPoker["T7o"] :=  "FOLD"
	manosPoker["T6o"] :=  "FOLD"
	manosPoker["T5o"] :=  "FOLD"
	manosPoker["T4o"] :=  "FOLD"
	manosPoker["T3o"] :=  "FOLD"
	manosPoker["T2o"] :=  "FOLD"
	manosPoker["98s"] :=  "ORF"
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
	manosPoker["32o"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}


btn811fish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "ORC"
	manosPoker["KKo"] :=  "ORC"
	manosPoker["QQo"] :=  "ORC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "OS"
	manosPoker["99o"] :=  "OS"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "OS"
	manosPoker["A3o"] :=  "OS"
	manosPoker["A2o"] :=  "OS"
	manosPoker["KQs"] :=  "OS"
	manosPoker["KJs"] :=  "OS"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "OS"
	manosPoker["K7s"] :=  "OS"
	manosPoker["K6s"] :=  "OS"
	manosPoker["K5s"] :=  "ORF"
	manosPoker["K4s"] :=  "FOLD"
	manosPoker["K3s"] :=  "FOLD"
	manosPoker["K2s"] :=  "FOLD"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "ORF"
	manosPoker["K8o"] :=  "FOLD"
	manosPoker["K7o"] :=  "FOLD"
	manosPoker["K6o"] :=  "FOLD"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "OS"
	manosPoker["Q7s"] :=  "FOLD"
	manosPoker["Q6s"] :=  "FOLD"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "OS"
	manosPoker["Q9o"] :=  "ORF"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "OS"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "OS"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
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
	manosPoker["87s"] :=  "ORF"
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
	manosPoker["32o"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}


btn68fish(manos)
{
	
; Crear el diccionario
	manosPoker := {}
	
; Asignar valores a las claves
	
	manosPoker["AAo"] :=  "LC"
	manosPoker["KKo"] :=  "LC"
	manosPoker["QQo"] :=  "LC"
	manosPoker["JJo"] :=  "ORC"
	manosPoker["TTo"] :=  "OS"
	manosPoker["99o"] :=  "OS"
	manosPoker["88o"] :=  "OS"
	manosPoker["77o"] :=  "OS"
	manosPoker["66o"] :=  "OS"
	manosPoker["55o"] :=  "OS"
	manosPoker["44o"] :=  "OS"
	manosPoker["33o"] :=  "OS"
	manosPoker["22o"] :=  "OS"
	manosPoker["AKs"] :=  "OS"
	manosPoker["AQs"] :=  "OS"
	manosPoker["AJs"] :=  "OS"
	manosPoker["ATs"] :=  "OS"
	manosPoker["A9s"] :=  "OS"
	manosPoker["A8s"] :=  "OS"
	manosPoker["A7s"] :=  "OS"
	manosPoker["A6s"] :=  "OS"
	manosPoker["A5s"] :=  "OS"
	manosPoker["A4s"] :=  "OS"
	manosPoker["A3s"] :=  "OS"
	manosPoker["A2s"] :=  "OS"
	manosPoker["AKo"] :=  "OS"	
	manosPoker["AQo"] :=  "OS"	
	manosPoker["AJo"] :=  "OS"
	manosPoker["ATo"] :=  "OS"
	manosPoker["A9o"] :=  "OS"
	manosPoker["A8o"] :=  "OS"
	manosPoker["A7o"] :=  "OS"
	manosPoker["A6o"] :=  "OS"
	manosPoker["A5o"] :=  "OS"
	manosPoker["A4o"] :=  "OS"
	manosPoker["A3o"] :=  "OS"
	manosPoker["A2o"] :=  "OS"
	manosPoker["KQs"] :=  "OS"
	manosPoker["KJs"] :=  "OS"
	manosPoker["KTs"] :=  "OS"
	manosPoker["K9s"] :=  "OS"
	manosPoker["K8s"] :=  "OS"
	manosPoker["K7s"] :=  "OS"
	manosPoker["K6s"] :=  "OS"
	manosPoker["K5s"] :=  "OS"
	manosPoker["K4s"] :=  "OS"
	manosPoker["K3s"] :=  "OS"
	manosPoker["K2s"] :=  "OS"
	manosPoker["KQo"] :=  "OS"
	manosPoker["KJo"] :=  "OS"
	manosPoker["KTo"] :=  "OS"
	manosPoker["K9o"] :=  "OS"
	manosPoker["K8o"] :=  "OS"
	manosPoker["K7o"] :=  "OS"
	manosPoker["K6o"] :=  "OS"
	manosPoker["K5o"] :=  "FOLD"
	manosPoker["K4o"] :=  "FOLD"
	manosPoker["K3o"] :=  "FOLD"
	manosPoker["K2o"] :=  "FOLD"
	manosPoker["QJs"] :=  "OS"
	manosPoker["QTs"] :=  "OS"
	manosPoker["Q9s"] :=  "OS"
	manosPoker["Q8s"] :=  "OS"
	manosPoker["Q7s"] :=  "OS"
	manosPoker["Q6s"] :=  "OS"
	manosPoker["Q5s"] :=  "FOLD"
	manosPoker["Q4s"] :=  "FOLD"
	manosPoker["Q3s"] :=  "FOLD"
	manosPoker["Q2s"] :=  "FOLD"
	manosPoker["QJo"] :=  "OS"
	manosPoker["QTo"] :=  "OS"
	manosPoker["Q9o"] :=  "OS"
	manosPoker["Q8o"] :=  "FOLD"
	manosPoker["Q7o"] :=  "FOLD"
	manosPoker["Q6o"] :=  "FOLD"
	manosPoker["Q5o"] :=  "FOLD"
	manosPoker["Q4o"] :=  "FOLD"
	manosPoker["Q3o"] :=  "FOLD"
	manosPoker["Q2o"] :=  "FOLD"
	manosPoker["JTs"] :=  "OS"
	manosPoker["J9s"] :=  "OS"
	manosPoker["J8s"] :=  "OS"
	manosPoker["J7s"] :=  "FOLD"
	manosPoker["J6s"] :=  "FOLD"
	manosPoker["J5s"] :=  "FOLD"
	manosPoker["J4s"] :=  "FOLD"
	manosPoker["J3s"] :=  "FOLD"
	manosPoker["J2s"] :=  "FOLD"
	manosPoker["JTo"] :=  "OS"
	manosPoker["J9o"] :=  "FOLD"
	manosPoker["J8o"] :=  "FOLD"
	manosPoker["J7o"] :=  "FOLD"
	manosPoker["J6o"] :=  "FOLD"
	manosPoker["J5o"] :=  "FOLD"
	manosPoker["J4o"] :=  "FOLD"
	manosPoker["J3o"] :=  "FOLD"
	manosPoker["J2o"] :=  "FOLD"
	manosPoker["T9s"] :=  "OS"
	manosPoker["T8s"] :=  "OS"
	manosPoker["T7s"] :=  "OS"
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
	manosPoker["98s"] :=  "OS"
	manosPoker["97s"] :=  "OS"
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
	manosPoker["87s"] :=  "OS"
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
	manosPoker["76s"] :=  "OS"
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
	manosPoker["32o"] :=  "FOLD"
	
; Consultar el valor de una clave
	clave := manos
	valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
	
	return valormanos
}