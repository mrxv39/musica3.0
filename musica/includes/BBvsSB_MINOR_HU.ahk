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




resultado := BBvsSB_MINOR_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

BBvsSB_MINOR_HU(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa,p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{


	if(p2bet = 2)
	{
	
		if (p3stack = "")
		{
	
		}
		if(p3stack = "" || StrLen(p3name) < 5)
		{
			

			if (p1bet = 1)
			{

			}
			if(p1bet = 1)
			{
		
				stackvalue := stackefect
    

				resultado := getcartas2(mesa, mano)

				mano := resultado.mano
				manos := resultado.manos

				situacionglobal := "BBvsSB_MINOR_HU"
				;MsgBox, %p2%
				if(p2 == "fish")
				{
					BBvsSB_MINOR_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				else if(p2 == "reg")
				{
					BBvsSB_MINOR_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
				ExitApp  
    
			  
			}
		}
	}
	else
	{
		;MsgBox, % StrLen(p2name)
		
		if(p3bet = 2)
		{
	
		
			if((p2stack = "" || StrLen(p2name) < 5) && p2btn = 1)
			{
				
				
				if(p1bet = 1)
				{
				


					stackvalue := stackefect
    
			


					resultado := getcartas2(mesa, mano)

					mano := resultado.mano
					manos := resultado.manos
				

					situacionglobal := "BBvsSB_MINOR_HU"
					;MsgBox, %p2%
					if(p3 == "fish")
					{
						BBvsSB_MINOR_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					else if(p3 == "reg")
					{
						BBvsSB_MINOR_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
					}
					
					result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
    				ExitApp  
			  
				}
			}
		}
	}	
	
	ExitApp
}

BBvsSB_MINOR_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	
	if (stackvalue < 6)
	{
		
		if (situacionfinal = "BB HU vs MINOR FISH < 6 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH < 6 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P6", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 6 && stackvalue < 8)
	{
		if (situacionfinal = "BB HU vs MINOR FISH 6-8 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH 6-8 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 8 && stackvalue < 11)
	{
		if (situacionfinal = "BB HU vs MINOR FISH 8-11 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH 8-11 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "BB HU vs MINOR FISH 11-14 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH 11-14 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 14 && stackvalue < 18)
	{
		if (situacionfinal = "BB HU vs MINOR FISH 14-18 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH 14-18 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 18 && stackvalue < 1000)
	{
		if (situacionfinal = "BB HU vs MINOR FISH +18 BB")
		{
			return
		}
		situacionfinal := "BB HU vs MINOR FISH +18 BB"
		poscionclick("IPLA", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
	}
}


BBvsSB_MINOR_REG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
	
	if (stackvalue >= 11 && stackvalue < 14)
	{
		if (situacionfinal = "BB HU vs REG MINOR  13 BB")
		{
			return
		}
		situacionfinal := "BB HU vs REG MINOR  13 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P5", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 14 && stackvalue < 16)
	{
		if (situacionfinal = "BB HU vs REG MINOR  15 BB")
		{
			return
		}
		situacionfinal := "BB HU vs REG MINOR  15 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P4", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 16 && stackvalue < 19)
	{
		if (situacionfinal = "BB HU vs REG MINOR 17 BB")
		{
			return
		}
		situacionfinal := "BB HU vs REG MINOR 17 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P3", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 19 && stackvalue < 23)
	{
		if (situacionfinal = "BB HU vs REG MINOR  21 BB")
		{
			return
		}
		situacionfinal := "BB HU vs REG MINOR  21 BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P2", x1t, y1t, anchot, altot)
	}
	else if (stackvalue >= 23 && stackvalue < 1000)
	{
		if (situacionfinal = "BB HU vs REG MINOR 25+ BB")
		{
			return
		}
		situacionfinal := "BB HU vs REG MINOR 25+ BB"
		poscionclick("IMU", x1t, y1t, anchot, altot)
		poscionclick("O32", x1t, y1t, anchot, altot)
		poscionclick("F1P1", x1t, y1t, anchot, altot)
	}
}

