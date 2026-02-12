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





;str(posx), str(posy), str(mesa), str(x1), str(y1), str(x2), str(y2), str(alto), str(ancho), str(x1t), str(y1t), str(anchot), str(altot), str(p2name), str(p2stack), str(p2bet), str(p2btn), str(p3name), str(p3stack), str(p3bet), str(p3btn), str(stackefect), str(p1bet), str(p1btn)
resultado := BBvsSQZ(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)

BBvsSQZ(posx, posy, mesa, x1, y1, x2, y2, alto, ancho, x1t, y1t, altot, anchot, p2name, p2stack, p2bet, p2btn, p3name, p3stack, p3bet, p3btn, stackefect, p1bet, p1btn, mano, p2, p3, save_img_mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
{


	
	if(p2btn = 0 && p2bet = 2)
	{
	

		
		if(p1bet = 1)
		{
		
            
			if(0.5 < p3bet && p3bet <= 2)
			{
                
				stackvalue := stackefect
    
			    


                resultado := getcartas2(mesa,mano)

                mano := resultado.mano
                manos := resultado.manos

			
				
				
				
				situacionglobal := "BB_SQZ"
				
				if(p2 == "fish" && p3 == "fish")
				{
					BBvsSQZvsFISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				else if(p2 == "fish" && p3 == "reg")
				{
					BBvsSQZvsFISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				else if(p2 == "reg" && p3 == "fish")
				{

					BBvsSQZvsREG_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				else if(p2 == "reg" && p3 == "reg")
				{
					BBvsSQZvsREG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
				}
				
				result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)
                ExitApp  
                
               

			}						
		}
	}
     ExitApp
}

BBvsSQZvsFISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
    situacion := "bb sqz vs fish"

    if (stackvalue < 11)
    {
        if (situacionfinal = "BB_SQZ FISH 8-11")
        {
            return
        }
        situacionfinal := "BB_SQZ FISH 8-11"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O66", x1t, y1t, anchot, altot)
        poscionclick("F2P5", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 11 && stackvalue < 14)
    {
        if (situacionfinal = "BB_SQZ FISH 11-14 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ FISH 11-14 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O66", x1t, y1t, anchot, altot)
        poscionclick("F2P4", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 14 && stackvalue < 18)
    {
        if (situacionfinal = "BB_SQZ FISH14-18 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ FISH14-18 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O66", x1t, y1t, anchot, altot)
        poscionclick("F2P3", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 18 && stackvalue < 1000)
    {
        if (situacionfinal = "BB_SQZ FISH +18 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ FISH +18 BB"
        poscionclick("IIIPLA", x1t, y1t, anchot, altot)
        poscionclick("O66", x1t, y1t, anchot, altot)
        poscionclick("F2P2", x1t, y1t, anchot, altot)
    }
}


BBvsSQZvsREG(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
    situacion := "bb sqz vs reg"

    if (stackvalue < 17.5)
    {
        if (situacionfinal = "BB_SQZ REG 15 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG 15 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F3P4", x1t, y1t, anchot, altot)
    }

    if (stackvalue >= 17.5 && stackvalue < 23)
    {
        if (situacionfinal = "BB_SQZ REG 21 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG 21 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F3P3", x1t, y1t, anchot, altot)
    }

    if (stackvalue >= 23 && stackvalue < 1000)
    {
        if (situacionfinal = "BB_SQZ REG 25 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG 25 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F3P2", x1t, y1t, anchot, altot)
    }
}



BBvsSQZvsREG_FISH(posx, posy, manos, stackvalue, mesa, x1t, y1t, anchot, altot)
{
    situacion := "bb sqz vs regfish"
    if (stackvalue < 12.5)
    {
        if (situacionfinal = "BB_SQZ REG_FISH_SB 11 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG_FISH_SB 11 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F4P4", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 12.5 && stackvalue < 17.5)
    {
        if (situacionfinal = "BB_SQZ REG_FISH_SB 15 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG_FISH_SB 15 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F4P4", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 17.5 && stackvalue < 22.5)
    {
        if (situacionfinal = "BB_SQZ REG_FISH_SB 20 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG_FISH_SB 20 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F4P3", x1t, y1t, anchot, altot)
    }
    else if (stackvalue >= 22.5 && stackvalue < 1000)
    {
        if (situacionfinal = "BB_SQZ REG_FISH_SB 25 BB")
        {
            return
        }
        situacionfinal := "BB_SQZ REG_FISH_SB 25 BB"
        poscionclick("IIIMU", x1t, y1t, anchot, altot)
        poscionclick("O63", x1t, y1t, anchot, altot)
        poscionclick("F4P2", x1t, y1t, anchot, altot)
    }
}
