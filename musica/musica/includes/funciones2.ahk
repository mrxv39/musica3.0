

result2(x1, y1, x2, y2, stackvalue, mesa, mano, situacionglobal, situacionfinal, review, ancho, alto, save_img_mesa, posx, posy, p2manos_3h,p3manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h, p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu, p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu,p2name,p3name)  
{

    ;MsgBox, AQUIIIIIIIIIIIIIIII123
    
    ;MsgBox, %p2vip_3h% %p2pfr_3h% %p2_3bet_3h%
    ;MOVER IMAGEN A LA CARPETA QUE CORRESPONDE POR SI SITUACION GLOBAL
    ;MsgBox, save_img_mesa:, %save_img_mesa%
    save_img_mesa_3h := save_img_mesa
    save_img_mesa_hu := save_img_mesa

    ;MsgBox, % situacionglobal
    ;MsgBox, posx %save_img_mesa% 

    ; Usar SplitPath para obtener el nombre del archivo
    SplitPath, save_img_mesa, fileName, fileDir, fileExt, fileNameNoExt, fileDrive

    fileNameNoExt := StrReplace(fileName, "screenshot_", "")
    fileNameNoExt := StrReplace(fileNameNoExt, ".bmp", "")

    ; Mostrar el nombre del archivo
    ;MsgBox, El nombre del archivo es: %fileNameNoExt%

    directorio := A_ScriptDir
    
    directorio := StrReplace(directorio, "includes", "img\")
    ;MsgBox, % directorio
    extraer_datos_hud = 0
    archivo := save_img_mesa
    archivotxt := StrReplace(save_img_mesa, "bmp", "txt")

    if (situacionglobal = "BTN")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BTN"
        extraer_datos_hud = 1
        
    }
    else if (situacionglobal = "SB_HU")
    {
        nuevoDestino := directorio . "PREFLOP\HU\SB"
        extraer_datos_hud = 1
 
    }
    else if (situacionglobal = "BBvsSB_OS_HU")
    {
        nuevoDestino := directorio . "PREFLOP\HU\BB\BBvsSB_OS"
    }
    else if (situacionglobal = "BBvsSB_LIMP_HU")
    {
        nuevoDestino := directorio . "PREFLOP\HU\BB\BBvsSB_LIMP"
    }
    else if (situacionglobal = "BBvsSB_MINOR_HU")
    {
        nuevoDestino := directorio . "PREFLOP\HU\BB\BBvsSB_MINOR"
    }
    else if (situacionglobal = "SBvsBB_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\SB\SBvsBB"
    }
    else if (situacionglobal = "BBvsBTN_OS")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsBTN_OS"
    }
    else if (situacionglobal = "BBvsBTN_LIMP")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsBTN_L"
    }
    else if (situacionglobal = "BBvsBTN_MINOR")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsBTN_MINOR"
    }
    else if (situacionglobal = "SBvsBTN_OS")
    {
        nuevoDestino := directorio . "PREFLOP\3H\SB\SBvsBTN_OS"
    }
    else if (situacionglobal = "BBvsSB_OR_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsSB_OR"
    }
    else if (situacionglobal = "SBvsBTN_OR")
    {
        nuevoDestino := directorio . "PREFLOP\3H\SB\SBvsBTN_OR"
    }
    else if (situacionglobal = "BBvsSB_LIMP_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsSB_LIMP"
    }
    else if (situacionglobal = "BBvsSB_ORx3_3H" || situacionglobal = "BBvsSB_ORx2.5_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsSB_ORx3"
    }
    else if (situacionglobal = "BBvsSB_ORx3_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsSB_OR"
    }
    else if (situacionglobal = "BBvsSB_OS_3H")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsSB_OS"
    }
    else if (situacionglobal = "BB_SQZ")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BB_SQZ"
    }
    else if (situacionglobal = "SB_3Hvs_BTN_LIMP")
    {
        nuevoDestino := directorio . "PREFLOP\3H\SB\SBvsBTN_LIMP"
    }
    else if (situacionglobal = "BBvsBTN_OS_CALL_SB")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BB\BBvsBTN_OS\SB_CALL"
    }
    else if (situacionglobal = "BTNvs3bet_SB_FOLD_BB" || situacionglobal = "BTNvs3bet_BB_FOLD_SB")
    {
        nuevoDestino := directorio . "PREFLOP\3H\BTN\vs3bet"
    }
    else if (situacionglobal = "SB_HUvsROL")
    {
        nuevoDestino := directorio . "PREFLOP\HU\SB\vsROL"
    }
    else if (situacionglobal = "SBvsBB_3HvsROL" || situacionglobal = "SBvsBB_3Hvs3bet")
    {
        nuevoDestino := directorio . "PREFLOP\3H\SB\SBvsBB\vsRaise"
    }
    else if (situacionglobal = "SB_HUvs3bet")
    {
        nuevoDestino := directorio . "PREFLOP\HU\SB\vs3bet"
    }

    ;MsgBox, archivo %archivo%
    
    save_img_mesa_3h := archivo
    save_img_mesa_hu := archivo

    ; Mover el archivo
    FileMove, %archivo%, %nuevoDestino%
    FileMove, %archivotxt%, %nuevoDestino%

    

    ; GUARDAR RELTADOS MANOS
    ruta_archivo := "result" mesa ".txt"
    ; Guardar las variables en el archivo de texto
    FileDelete, %ruta_archivo%  ; Eliminar el archivo si ya existe
    FileAppend, % "stackvalue: " . stackvalue . "`n"
              . "mesa: " . mesa . "`n"
              . "mano: " . mano . "`n"
              . "situacionglobal: " . situacionglobal . "`n"
              . "situacionfinal: " . situacionfinal, %ruta_archivo%

    popupsayuda(x1, y1, mesa, stackefect, mano, situacionfinal, fileNameNoExt)

    ;MsgBox, %p2_manos_hu_db% %p2_vip_hu% %p2_pfr_hu% %p2_bet_3_hu%

    ;MsgBox, 1 %p3manos_3h% 2 %p3vip_3h% 3 %p3pfr_3h% 4 %p3_3bet_3h%

    if (InStr(nuevoDestino, "PREFLOP\3H"))
    {

        popup_hud_l1_p2(x1,y1,mesa,p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h)
        popup_hud_l1_p3(x1,y1,mesa,p3manos_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h)
        situacion := "3h"
    }
    else
    {   
        popup_hud_l1_p2(x1,y1,mesa,p2_manos_hu_db, p2_vip_hu, p2_pfr_hu, p2_bet_3_hu)
        popup_hud_l1_p3(x1,y1,mesa,p3_manos_hu_db, p3_vip_hu, p3_pfr_hu, p3_bet_3_hu)
        situacion := "hu"
    }

    if (p2name = "")
    {
        p2name := "****"
    }
    if (p3name = "")
    {
        p3name := "****"
    }

  
    ;MsgBox, p2 %p2name% p3 %p3name% situ %situacionglobal% file_3h %save_img_mesa_3h% file_hu %save_img_mesa_hu%
    extraer_datos_hud_hide(p2name,p3name,situacionglobal,save_img_mesa_3h,save_img_mesa_hu, nuevoDestino, mano, stackvalue)
    
    
    
    
}

getcartas2(mesa,mano)
{
    
    ;MsgBox, % mano
    mano := StrReplace(mano, "gris", "S")
    mano := StrReplace(mano, "rojo", "H")
    mano := StrReplace(mano, "verde", "C")
    mano := StrReplace(mano, "azul", "D")
    mano := StrReplace(mano, "g", "9")
    mano := StrReplace(mano, "/", "7")
    mano := StrReplace(mano, "()", "Q")
    mano := StrReplace(mano, "0)", "Q")
    mano := StrReplace(mano, "‘", "5H")
    mano := StrReplace(mano, "0S", "6S")
    mano := StrReplace(mano, "?C", "2C")
    mano := StrReplace(mano, "?S", "5S")




    carta1 := SubStr(mano, 1, 1)
    palo1 := SubStr(mano, 2, 1)
    carta2 := SubStr(mano, 3, 1)
    palo2 := SubStr(mano, 4, 1)

    /*
    if(carta1 = "H" && StrLen(mano) = 3)
    {

        mano := "6" . mano
    }

    if(carta1 = "(" && palo1 = "H")
    {

        mano := StrReplace(mano, "(", "")
        mano := "Q" . mano

    }

    if(carta1 = "*" && palo1 = "H")
    {

        mano := StrReplace(mano, "*", "")
        mano := "5" . mano

    }
  
    if(carta1 = "0" && palo1 = "H")
    {

        mano := StrReplace(mano, "0", "6")
        

    }

    if(carta1 = "." && palo1 = "D")
    {

        mano := StrReplace(mano, ".", "5")
    }
    if(carta1 = "." && palo1 = "S")
    {

        mano := StrReplace(mano, ".", "5")
    }
        





    if (carta2 = "." && palo2 = "D")
    {
        mano := StrReplace(mano, ".", "5")
    }
    if (carta2 = "." && palo2 = "C")
    {
        mano := StrReplace(mano, ".", "5")
    }

    */



    ;MsgBox, %mano%
    carta1 := SubStr(mano, 1, 1)
    palo1 := SubStr(mano, 2, 1)
    carta2 := SubStr(mano, 3, 1)
    palo2 := SubStr(mano, 4, 1)
    ;MsgBox, %carta1% %palo1% %carta2% %palo2%
    if(palo1 == palo2)
    {
        manos := carta1 carta2 "s"
    }
    else
    {
        manos := carta1 carta2 "o"
    }
    
    


    
    


    ; Obtener el valor y el palo de la carta original
    c1 := SubStr(manos, 1, 1)
    c2 := SubStr(manos, 2, 1)
    c3 := SubStr(manos, 3, 1)
    
    ; Convertir el valor de c1 si corresponde
    if (c1 = "T")
        c11 := 10
    else if (c1 = "J")
        c11 := 11
    else if (c1 = "Q")
        c11 := 12
    else if (c1 = "K")
        c11 := 13
    else if (c1 = "A")
        c11 := 14
    else
        c11 := c1
    
    ; Convertir el valor de c2 si corresponde
    if (c2 = "T")
        c22 := 10
    else if (c2 = "J")
        c22 := 11
    else if (c2 = "Q")
        c22 := 12
    else if (c2 = "K")
        c22 := 13
    else if (c2 = "A")
        c22 := 14
    else
        c22 := c2
    
    ; Verificar y realizar las transformaciones segun el valor y el palo
    if (c11 > c22)
        manos := c1 c2 c3
    else
        manos := c2 c1 c3
  

    resultado := {}
    resultado.mano := mano
    resultado.manos := manos

    return resultado
    
}


extraer_datos_hud_hide(p2name,p3name,situacionglobal,save_img_mesa_3h,save_img_mesa_hu, nuevoDestino, mano, stackvalue)
{
    directorio := A_ScriptDir
    directorio := StrReplace(directorio, "includes", "")
    script_python := directorio . "extraer_datos_hud.py" ; Cambia esto a la ruta de tu script de Python

    ;MsgBox, %p2name% %p3name% %situacionglobal% %save_img_mesa_3h% %save_img_mesa_hu% %nuevoDestino% %mano% %stackvalue%
    ; Ejecutar el script de Python con los argumentos
    ;Run, %comspec% /k python "%script_python%" %p2name% %p3name% %situacionglobal% %save_img_mesa_3h% %save_img_mesa_hu% %nuevoDestino% %mano% %stackvalue%
    Run, pythonw %script_python% %p2name% %p3name% %situacionglobal% %save_img_mesa_3h% %save_img_mesa_hu% %nuevoDestino% %mano% %stackvalue%, , Hide
}

extraer_datos_hud(p2name,p3name,situacion)
{
    directorio := A_ScriptDir
    directorio := StrReplace(directorio, "includes", "")
    script_python := directorio . "extraer_datos_hud.py"

    ; Ejecutar el script de Python con los argumentos
    Run, %comspec% /k python "%script_python%" %p2name% %p3name% %situacion%
    ;Run, pythonw %script_python% %p2name% %p3name% %situacion%, , Hide
}

popup_hud_l1_p2(posx, posy, mesa, p2manos_3h, p2vip_3h, p2pfr_3h, p2_3bet_3h)
{
    ;MsgBox, p2manos3h %p2manos_3h% posx %posx% posy %posy%
    ;MsgBox, 111 %p2manos_3h% %p2vip_3h% %p2pfr_3h% %p2_3bet_3h%

    posx := posx + 5
    posy := posy + 239

    tamanox := 100
    tamanoy := 15

    directorio := A_ScriptDir
    directorio := StrReplace(directorio, "includes", "")
    script_python := directorio . "\python\ventana_hud.pyw" ; Cambia esto a la ruta de tu script de Python

    ; Ejecutar el script de Python con los argumentos
    ;Run, python %script_python% %posx% %posy% %p2manos_3h% black %tamanox% %tamanoy% %mesa% %p2vip_3h% %p2pfr_3h% %p2_3bet_3h%
    ;descomentar despues del video
    ;Run, pythonw %script_python% %posx% %posy% %p2manos_3h% black %tamanox% %tamanoy% %mesa% %p2vip_3h% %p2pfr_3h% %p2_3bet_3h%
}

popup_hud_l1_p3(posx,posy,mesa,p3manos_3h, p3vip_3h, p3pfr_3h, p3_3bet_3h)
{
    
    ;MsgBox, 1 %p3manos_3h% 2 %p3vip_3h% 3 %p3pfr_3h% 4 %p3_3bet_3h%

    posx := posx+650
    posy := posy+228
    
    
    tamanox := 110
    tamanoy := 15

    directorio := A_ScriptDir
    directorio := StrReplace(directorio, "includes", "")
    script_python := directorio . "\python\ventana_hud_p3.pyw" ; Cambia esto a la ruta de tu script de Python

    ; Ejecutar el script de Python con los argumentos
    ;descomentar despues del video
    ;Run, pythonw %script_python% %posx% %posy% %p3manos_3h% black %tamanox% %tamanoy% %mesa% %p3vip_3h% %p3pfr_3h% %p3_3bet_3h%
    ;Run, python %script_python% %posx% %posy% %p3manos_3h% black %tamanox% %tamanoy% %mesa% %p3vip_3h% %p3pfr_3h% %p3_3bet_3h%

    
}

popupsayuda(posx, posy, mesa, stackefect, mano, situacion, fileNameNoExt)
{
    
    ;MsgBox, posx %situacion% 
    situacion := StrReplace(situacion, " ", "_")

    posx := posx+320
    posy := posy+508
    
    
    tamanox := 180
    tamanoy := 60

    directorio := A_ScriptDir
    directorio := StrReplace(directorio, "includes", "")
    script_python := directorio . "\python\ventana_mano.pyw" ; Cambia esto a la ruta de tu script de Python

    ; Ejecutar el script de Python con los argumentos
    ;descomentar despues del video
    ;Run, pythonw %script_python% %posx% %posy% %mano% black %tamanox% %tamanoy% %mesa% %situacion% %fileNameNoExt%, , Hide
    ;Run, pythonw ventana_mano.pyw %posx% %posy% %mano% black %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
    
}


popupreview(stackvalue, mesa, mano, situacionfinal)
{
    
    
    
    posx := 1300
    posy := 1000
    
    tamanox := 450
    tamanoy := 100
    
    ;MsgBox, %mano%
    ;MsgBox, %posx% %posy% %var1% %var2% %tamanox% %tamanoy% %var3% %mano%
    
    Run, pythonw popup.pyw %posx% %posy% %mesa% %stackvalue% %tamanox% %tamanoy% %situacionfinal% %mano%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 

}


poscionclick(elemento, x1t, y1t, anchot, altot)
{

    ;MsgBox, clicky %elemento%
    ;MsgBox, %x1t%, %y1t%, %anchot%, %altot%
    if (elemento = "IPLA")
    {
        
        clickx := Round(x1t+29+(anchot*0.062))
        clicky := Round(y1t+(altot*0.0828857)) ;58
        clicktablas(clickx, clicky)
        
    }
    else if (elemento = "IIIPLA")
    {
        ;MsgBox, entramossssssssssssssss
        clickx := Round(x1t+29+(anchot*0.174))
        clicky := Round(y1t+(altot*0.0828857))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "IMU")
    {
        
        clickx := Round(x1t+29+(anchot*0.286))
        clicky := Round(y1t+(altot*0.0828857))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "IIIMU")
    {
        ;MsgBox, clicky %elemento%
        clickx := Round(x1t+62+(anchot*0.4)) ;262
        clicky := Round(y1t+(altot*0.0828857))
        clicktablas(clickx, clicky)
    }
    if (elemento = "O31")
    {
        
        clickx := Round(x1t+(anchot*0.146))
        clicky := Round(y1t+(altot*0.151428571)) 
        clicktablas(clickx, clicky)


    }
    else if (elemento = "O32")
    {
        
        clickx := Round(x1t+(anchot*0.372))
        clicky := Round(y1t+(altot*0.151428571))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "O33")
    {
        
        clickx := Round(x1t+(anchot*0.608)) ;306
        clicky := Round(y1t+(altot*0.151428571))
        clicktablas(clickx, clicky)
        
    }
    if (elemento = "O61")
    {
        
        clickx := Round(x1t+(anchot*0.108))
        clicky := Round(y1t+(altot*0.142857142)) 
        clicktablas(clickx, clicky)
        
    }
    else if (elemento = "O62")
    {
        
        clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.142857142)) ;100
        clicktablas(clickx, clicky)
        ;MsgBox, clicky %stackvalue%142857142
    }
    else if (elemento = "O63")
    {
        
        clickx := Round(x1t+(anchot*0.432))
        clicky := Round(y1t+(altot*0.142857142))
        clicktablas(clickx, clicky)
        clicktablas(clickx, clicky)
    }
    if (elemento = "O64")
    {
        
        clickx := Round(x1t+(anchot*0.6))
        clicky := Round(y1t+(altot*0.142857142))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "O65")
    {
        
        clickx := Round(x1t+(anchot*0.76))
        clicky := Round(y1t+(altot*0.142857142))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "O66")
    {
        
        clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.142857142))
        clicktablas(clickx, clicky)
    }
    if (elemento = "F1P1")
    {
        
        clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F1P2")
    {
        
        clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F1P3")
    {
        
        clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
        ;MsgBox, clickx %clicky%
    }
    if (elemento = "F1P4")
    {
        
        clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F1P5")
    {
        
        clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F1P6")
    {
        
        clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.19714285))
        clicktablas(clickx, clicky)
    }

    if (elemento = "F2P1")
    {
        
        clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.23714285714)) ;166
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F2P2")
    {
        
        clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.23714285714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F2P3")
    {
        
        clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.23714285714))
        clicktablas(clickx, clicky)
    }
    if (elemento = "F2P4")
    {
        
        clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.23714285714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F2P5")
    {
        
        clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.23714285714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F2P6")
    {
        
        clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.23714285714))
        clicktablas(clickx, clicky)
    }

    if (elemento = "F3P1")
    {
        
        clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.27)) 
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F3P2")
    {
        
        clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.27))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F3P3")
    {
        
        clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.27))
        clicktablas(clickx, clicky)
    }
    if (elemento = "F3P4")
    {
        
        clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.27))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F3P5")
    {
        
        clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.27))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F3P6")
    {
        
        clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.27))
        clicktablas(clickx, clicky)
    }

    if (elemento = "F4P1")
    {
        
        clickx := Round(x1t+(anchot*0.112))
        clicky := Round(y1t+(altot*0.2985714)) ;209
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F4P2")
    {
        
        clickx := Round(x1t+(anchot*0.274))
        clicky := Round(y1t+(altot*0.2985714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F4P3")
    {
        
        clickx := Round(x1t+(anchot*0.434))
        clicky := Round(y1t+(altot*0.2985714))
        clicktablas(clickx, clicky)
    }
    if (elemento = "F4P4")
    {
        
        clickx := Round(x1t+(anchot*0.582))
        clicky := Round(y1t+(altot*0.2985714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F4P5")
    {
        
        clickx := Round(x1t+(anchot*0.75))
        clicky := Round(y1t+(altot*0.2985714))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "F4P6")
    {
        
        clickx := Round(x1t+(anchot*0.92))
        clicky := Round(y1t+(altot*0.2985714))
        clicktablas(clickx, clicky)
    }
    


    
}


clicktablas(xclic, yclic)
{
    CoordMode, Mouse, Screen

    runtimeDir := A_ScriptDir . "\runtime"
    lockFile   := runtimeDir . "\blockclick.txt"
    traceFile  := runtimeDir . "\click_trace.txt"
    FileCreateDir, %runtimeDir%

    MouseGetPos, origX, origY

    ; --- wait for lock with timeout + stale cleanup ---
    waitStart := A_TickCount
    while (FileExist(lockFile))
    {
        if (A_TickCount - waitStart > 1500)
        {
            FileAppend, %A_TickCount% " STALE_LOCK_REMOVED " lockFile "`n", %traceFile%
            FileDelete, %lockFile%
            break
        }
        Sleep, 10
    }

    ; --- acquire lock ---
    FileAppend,, %lockFile%
    ; MsgBox opcional para debug (quítalo cuando acabes de probar)
    ; MsgBox, LOCK CREATED`nFile:`n%lockFile%

    ; --- move with verification / retries ---
    moved := false
    Loop, 5
    {
        DllCall("SetCursorPos", "Int", xclic, "Int", yclic)
        Sleep, 30
        MouseGetPos, nx, ny
        if (Abs(nx - xclic) <= 2 && Abs(ny - yclic) <= 2)
        {
            moved := true
            break
        }
        Sleep, 30
    }

    if (!moved)
    {
        FileAppend, %A_TickCount% " MOVE_FAIL target=" xclic "," yclic " got=" nx "," ny "`n", %traceFile%
        FileDelete, %lockFile%
        return
    }

    ; --- click robusto (AHK nativo, evita mouse_event legacy) ---
    Click, %xclic%, %yclic%
    Sleep, 50

    ; return to original position
    DllCall("SetCursorPos", "Int", origX, "Int", origY)

    FileAppend, %A_TickCount% " CLICK_OK target=" xclic "," yclic "`n", %traceFile%
    FileDelete, %lockFile%
}







clicktablas2(xclic, yclic)
{
    ;MsgBox, clickx %xclic% clicky %yclic%
    ; --- Cross-process mouse click lock using lock file (AHK v1) ---
    global CLICK_LOCK_DEBUG

    ; Paths (runtime next to project root)
    runtimeDir := A_ScriptDir . "\..\runtime"
    if !FileExist(runtimeDir)
        FileCreateDir, %runtimeDir%

    lockFile := runtimeDir . "\blockclick.lock"
    logFile  := runtimeDir . "\click_lock.log"

    ; Lock params
    lockTimeout  := 3000   ; ms max wait
    staleTimeout := 4000   ; ms to consider stale lock
    sleepStep    := 15     ; ms

    myPID := DllCall("GetCurrentProcessId")
    startWait := A_TickCount
    acquired := false

    ; Acquire lock
    Loop
    {
        if !FileExist(lockFile)
        {
            ts := A_TickCount
            FileDelete, %lockFile%  ; defensive
            FileAppend, %ts% "," myPID, %lockFile%

            ; Confirm we got it (avoid race)
            Sleep, 5
            FileRead, lockContent, %lockFile%
            if (lockContent = ts "," myPID)
            {
                acquired := true
                break
            }
        }
        else
        {
            ; Check staleness
            FileRead, lockContent, %lockFile%
            StringSplit, arr, lockContent, `,
            lockTS  := arr1
            lockPID := arr2

            age := A_TickCount - lockTS
            if (age > staleTimeout)
            {
                FileDelete, %lockFile%
                if (CLICK_LOCK_DEBUG)
                    FileAppend, %A_Now% "," myPID ",stale_delete`n", %logFile%
                continue
            }
        }

        if (A_TickCount - startWait > lockTimeout)
        {
            if (CLICK_LOCK_DEBUG)
                FileAppend, %A_Now% "," myPID ",timeout`n", %logFile%
            return  ; bail safely: no click
        }

        Sleep, %sleepStep%
    }

    if (CLICK_LOCK_DEBUG && acquired)
        FileAppend, %A_Now% "," myPID ",acquire," xclic "," yclic "`n", %logFile%

    ; --- Critical section ---
    CoordMode, Mouse, Screen
    MouseGetPos, originalX, originalY
    SetMouseDelay, 0

    try
    {
        ; Si BlockInput te dio problemas antes, comenta estas 2 líneas.
        BlockInput, MouseMove

        Click, %xclic%, %yclic%
        MouseMove, %originalX%, %originalY%
    }
    finally
    {
        BlockInput, MouseMoveOff

        ; Release lock always
        FileDelete, %lockFile%

        if (CLICK_LOCK_DEBUG && acquired)
            FileAppend, %A_Now% "," myPID ",release," xclic "," yclic "`n", %logFile%
    }
}




nashpush(manos)
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
    manosPoker["77o"] :=  20
    manosPoker["66o"] :=  20
    manosPoker["55o"] :=  20
    manosPoker["44o"] :=  20
    manosPoker["33o"] :=  20
    manosPoker["22o"] :=  20
    manosPoker["AKs"] :=  20    
    manosPoker["AQs"] :=  20    
    manosPoker["AJs"] :=  20
    manosPoker["ATs"] :=  20
    manosPoker["A9s"] :=  20
    manosPoker["A8s"] :=  20
    manosPoker["A7s"] :=  20
    manosPoker["A6s"] :=  20
    manosPoker["A5s"] :=  20
    manosPoker["A4s"] :=  20
    manosPoker["A3s"] :=  20
    manosPoker["A2s"] :=  20
    manosPoker["AKo"] :=  20    
    manosPoker["AQo"] :=  20    
    manosPoker["AJo"] :=  20
    manosPoker["ATo"] :=  20
    manosPoker["A9o"] :=  20
    manosPoker["A8o"] :=  20
    manosPoker["A7o"] :=  20
    manosPoker["A6o"] :=  20
    manosPoker["A5o"] :=  20
    manosPoker["A4o"] :=  20
    manosPoker["A3o"] :=  20
    manosPoker["A2o"] :=  20    
    manosPoker["KQs"] :=  20
    manosPoker["KJs"] :=  20
    manosPoker["KTs"] :=  20
    manosPoker["K9s"] :=  20
    manosPoker["K8s"] :=  20
    manosPoker["K7s"] :=  20
    manosPoker["K6s"] :=  20
    manosPoker["K5s"] :=  20
    manosPoker["K4s"] :=  20
    manosPoker["K3s"] :=  19.9
    manosPoker["K2s"] :=  19.3
    manosPoker["KQo"] :=  20
    manosPoker["KJo"] :=  20
    manosPoker["KTo"] :=  20
    manosPoker["K9o"] :=  20
    manosPoker["K8o"] :=  18
    manosPoker["K7o"] :=  16.1
    manosPoker["K6o"] :=  15.1
    manosPoker["K5o"] :=  14.2
    manosPoker["K4o"] :=  13.1
    manosPoker["K3o"] :=  12.2
    manosPoker["K2o"] :=  11.6  
    manosPoker["QJs"] :=  20
    manosPoker["QTs"] :=  20
    manosPoker["Q9s"] :=  20
    manosPoker["Q8s"] :=  20
    manosPoker["Q7s"] :=  20
    manosPoker["Q6s"] :=  20
    manosPoker["Q5s"] :=  15
    manosPoker["Q4s"] :=  16.3
    manosPoker["Q3s"] :=  13.5
    manosPoker["Q2s"] :=  12.7
    manosPoker["QJo"] :=  20
    manosPoker["QTo"] :=  20
    manosPoker["Q9o"] :=  20
    manosPoker["Q8o"] :=  13
    manosPoker["Q7o"] :=  10.3
    manosPoker["Q6o"] :=  9.6
    manosPoker["Q5o"] :=  8.9
    manosPoker["Q4o"] :=  7.9
    manosPoker["Q3o"] :=  7.5
    manosPoker["Q2o"] :=  7 
    manosPoker["JTs"] :=  20
    manosPoker["J9s"] :=  20
    manosPoker["J8s"] :=  20
    manosPoker["J7s"] :=  20
    manosPoker["J6s"] :=  18.6
    manosPoker["J5s"] :=  14.7
    manosPoker["J4s"] :=  13.5
    manosPoker["J3s"] :=  10.6
    manosPoker["J2s"] :=  8.5
    manosPoker["JTo"] :=  20
    manosPoker["J9o"] :=  20
    manosPoker["J8o"] :=  13.3
    manosPoker["J7o"] :=  8.5
    manosPoker["J6o"] :=  6.5
    manosPoker["J5o"] :=  6
    manosPoker["J4o"] :=  5.4
    manosPoker["J3o"] :=  5
    manosPoker["J2o"] :=  4.6   
    manosPoker["T9s"] :=  20
    manosPoker["T8s"] :=  20
    manosPoker["T7s"] :=  20
    manosPoker["T6s"] :=  20
    manosPoker["T5s"] :=  11.9
    manosPoker["T4s"] :=  10.5
    manosPoker["T3s"] :=  7.7
    manosPoker["T2s"] :=  6.5
    manosPoker["T9o"] :=  20
    manosPoker["T8o"] :=  17.5
    manosPoker["T7o"] :=  9
    manosPoker["T6o"] :=  5.7
    manosPoker["T5o"] :=  4.1
    manosPoker["T4o"] :=  3.8
    manosPoker["T3o"] :=  3.4
    manosPoker["T2o"] :=  2.9
    manosPoker["98s"] :=  20
    manosPoker["97s"] :=  20
    manosPoker["96s"] :=  20
    manosPoker["95s"] :=  14.4
    manosPoker["94s"] :=  6.9
    manosPoker["93s"] :=  4.9
    manosPoker["92s"] :=  3.7
    manosPoker["98o"] :=  20
    manosPoker["97o"] :=  10.8
    manosPoker["96o"] :=  5.2
    manosPoker["95o"] :=  3.5
    manosPoker["94o"] :=  2.7
    manosPoker["93o"] :=  2.5
    manosPoker["92o"] :=  2.2
    manosPoker["87s"] :=  20
    manosPoker["86s"] :=  20
    manosPoker["85s"] :=  18.8
    manosPoker["84s"] :=  10.1
    manosPoker["83s"] :=  2.7
    manosPoker["82s"] :=  2.5
    manosPoker["87o"] :=  14.7
    manosPoker["86o"] :=  7
    manosPoker["85o"] :=  3
    manosPoker["84o"] :=  2.3
    manosPoker["83o"] :=  1.9
    manosPoker["82o"] :=  1.8
    manosPoker["76s"] :=  20
    manosPoker["75s"] :=  20
    manosPoker["74s"] :=  13.9
    manosPoker["73s"] :=  2.5
    manosPoker["72s"] :=  2.1
    manosPoker["76o"] :=  10.7
    manosPoker["75o"] :=  2.6
    manosPoker["74o"] :=  2.1
    manosPoker["73o"] :=  1.8
    manosPoker["72o"] :=  1.6
    manosPoker["65s"] :=  20
    manosPoker["64s"] :=  16.3
    manosPoker["64s"] :=  16.3
    manosPoker["63s"] :=  "7.1o5.1;2.3o0"
    manosPoker["62s"] :=  2
    manosPoker["65o"] :=  2.4
    manosPoker["64o"] :=  2
    manosPoker["63o"] :=  1.7
    manosPoker["62o"] :=  1.5
    manosPoker["54s"] :=  20
    manosPoker["53s"] :=  "12.9o3.8;2.4o0"
    manosPoker["52s"] :=  2
    manosPoker["54o"] :=  2.1
    manosPoker["53o"] :=  1.8
    manosPoker["52o"] :=  1.5
    manosPoker["43s"] :=  "10o4.9;2.2o0"
    manosPoker["42s"] :=  1.8
    manosPoker["43o"] :=  1.6
    manosPoker["42o"] :=  1.4
    manosPoker["32s"] :=  1.7
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

popuptabla(posx, posy, mesa, imagen)
{
    
 

    posx := posx+443
    posy := posy+470
    
    
    tamanox := 30
    tamanoy := 30

    ; Ejemplo: Mostrar los valores (puedes quitar esta parte)
    ;MsgBox, posx=%posx%`nposy=%posy%`ntamanox=%tamanox%`ntamanoy=%tamanoy%`nmesa=%mesa%`nimagen=%imagen%

    ; Ruta del script de Python
    script_python := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\musica\python\ventana_tabla.pyw" ; Cambia esto a la ruta de tu script de Python

    ; Ejecutar el script de Python con los argumentos
    ;descomentar despues del video
    ;Run, pythonw %script_python% %posx% %posy% T grey %tamanox% %tamanoy% %mesa% %imagen%, , Hide
    
    ;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
    ;Run, pythonw ventana_tabla.pyw %posx% %posy% T grey %tamanox% %tamanoy% %mesa% %imagen%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}

popupnashpush(valormanos, color, posx, posy, mesa)
{
    
    
    ;MsgBox, %valormanos% %color% %posx% %posy% %mesa%
    posx := posx+443
    posy := posy+440
    
    
    tamanox := 30
    tamanoy := 30
    
    ;Run, run_python.bat %posx% %posy% %valormanos% %color% %tamanox% %tamanoy%
    ; Ruta del script de Python
    script_python := "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\musica\python\popupsimple.pyw" ; Cambia esto a la ruta de tu script de Python

    ; Ejecutar el script de Python con los argumentos
    Run, pythonw %script_python% %posx% %posy% %valormanos% %color% %tamanox% %tamanoy% %mesa%, , Hide
    ;Run, pythonw popupsimple.pyw %posx% %posy% %valormanos% %color% %tamanox% %tamanoy% %mesa%, , Hide ;mostrar mensaje con python de momento solo 2 varibles que hay que pasarle 
}

movimientos(elemento, x1, y1, ancho, alto)
{
    /*
    MsgBox,  % elemento
    
    if (elemento = "ALLIN")
    {
        
        clickx := Round(x1+(ancho*0.9909))
        clicky := Round(y1+(alto*0.8408))
        clicktablas(clickx, clicky)

        clickx := Round(x1+(ancho*0.9394))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        clickx := Round(x1+(ancho*0.8247))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "FOLD")
    {
        
        clickx := Round(x1+(ancho*0.7061))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)
    }
    else if (elemento = "RAISETO")
    {
        ;MsgBox, AQUI
        clickx := Round(x1+(ancho*0.9394))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        ;MsgBox,  % x1 y1
        ;MsgBox,  % clickx clicky
    }
    else if (elemento = "CALL")
    {
        ;MsgBox, AQUI
        clickx := Round(x1+(ancho*0.8247))
        clicky := Round(y1+(alto*0.9514))
        clicktablas(clickx, clicky)

        
        ;MsgBox,  % clickx clicky
        
    }
    ;MsgBox,  % clickx clicky elemento
    situacionaqui := "pushofold"

    Run, pythonw CaptureScreenshot.pyw %x1% %y1% 1296 807 %situacionaqui%, , Hide ;toma foto de la mesa
    ;MsgBox, % situacionaqui x1 y1
    */

}






sbhuvsreg7(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "LC"
    manosPoker["KKo"] :=  "LC"
    manosPoker["QQo"] :=  "LC"
    manosPoker["JJo"] :=  "LC"
    manosPoker["TTo"] :=  "LC"
    manosPoker["99o"] :=  "LR"
    manosPoker["88o"] :=  "LR"
    manosPoker["77o"] :=  "LR"
    manosPoker["66o"] :=  "LR"
    manosPoker["55o"] :=  "OS"
    manosPoker["44o"] :=  "OS"
    manosPoker["33o"] :=  "OS"
    manosPoker["22o"] :=  "OS"
    manosPoker["AKs"] :=  "LR"
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
    manosPoker["KQs"] :=  "LR"
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
    manosPoker["K5o"] :=  "OS"
    manosPoker["K4o"] :=  "OS"
    manosPoker["K3o"] :=  "OS"
    manosPoker["K2o"] :=  "OS"
    manosPoker["QJs"] :=  "LR"
    manosPoker["QTs"] :=  "LR"
    manosPoker["Q9s"] :=  "OS"
    manosPoker["Q8s"] :=  "OS"
    manosPoker["Q7s"] :=  "OS"
    manosPoker["Q6s"] :=  "OS"
    manosPoker["Q5s"] :=  "OS"
    manosPoker["Q4s"] :=  "OS"
    manosPoker["Q3s"] :=  "OS"
    manosPoker["Q2s"] :=  "OS"
    manosPoker["QJo"] :=  "OS"
    manosPoker["QTo"] :=  "OS"
    manosPoker["Q9o"] :=  "OS"
    manosPoker["Q8o"] :=  "OS"
    manosPoker["Q7o"] :=  "OS"
    manosPoker["Q6o"] :=  "OS"
    manosPoker["Q5o"] :=  "OS"
    manosPoker["Q4o"] :=  "OS"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LR"
    manosPoker["J9s"] :=  "LR"
    manosPoker["J8s"] :=  "LC"
    manosPoker["J7s"] :=  "OS"
    manosPoker["J6s"] :=  "OS"
    manosPoker["J5s"] :=  "OS"
    manosPoker["J4s"] :=  "OS"
    manosPoker["J3s"] :=  "OS"
    manosPoker["J2s"] :=  "LCS"
    manosPoker["JTo"] :=  "OS"
    manosPoker["J9o"] :=  "OS"
    manosPoker["J8o"] :=  "OS"
    manosPoker["J7o"] :=  "OS"
    manosPoker["J6o"] :=  "LCS"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "OS"
    manosPoker["T8s"] :=  "LC"
    manosPoker["T7s"] :=  "OS"
    manosPoker["T6s"] :=  "OS"
    manosPoker["T5s"] :=  "OS"
    manosPoker["T4s"] :=  "LCS"
    manosPoker["T3s"] :=  "LCS"
    manosPoker["T2s"] :=  "LCS"
    manosPoker["T9o"] :=  "OS"
    manosPoker["T8o"] :=  "OS"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "OS"
    manosPoker["97s"] :=  "OS"
    manosPoker["96s"] :=  "OS"
    manosPoker["95s"] :=  "OS"
    manosPoker["94s"] :=  "LCS"
    manosPoker["93s"] :=  "LCS"
    manosPoker["92s"] :=  "LCS"
    manosPoker["98o"] :=  "OS"
    manosPoker["97o"] :=  "LCS"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "OS"
    manosPoker["86s"] :=  "OS"
    manosPoker["85s"] :=  "OS"
    manosPoker["84s"] :=  "LCS"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "FOLD"
    manosPoker["87o"] :=  "OS"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "OS"
    manosPoker["75s"] :=  "OS"
    manosPoker["74s"] :=  "OS"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "OS"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "OS"
    manosPoker["64s"] :=  "OS"
    manosPoker["63s"] :=  "LCS"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "OS"
    manosPoker["53s"] :=  "OS"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "OS"
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


sbhuvsreg8(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "LC"
    manosPoker["KKo"] :=  "LC"
    manosPoker["QQo"] :=  "LC"
    manosPoker["JJo"] :=  "LC"
    manosPoker["TTo"] :=  "LC"
    manosPoker["99o"] :=  "LC"
    manosPoker["88o"] :=  "LR"
    manosPoker["77o"] :=  "LR"
    manosPoker["66o"] :=  "LR"
    manosPoker["55o"] :=  "LR"
    manosPoker["44o"] :=  "OS"
    manosPoker["33o"] :=  "OS"
    manosPoker["22o"] :=  "OS"
    manosPoker["AKs"] :=  "LR"
    manosPoker["AQs"] :=  "LR"
    manosPoker["AJs"] :=  "LR"
    manosPoker["ATs"] :=  "LR"
    manosPoker["A9s"] :=  "OS"
    manosPoker["A8s"] :=  "OS"
    manosPoker["A7s"] :=  "OS"
    manosPoker["A6s"] :=  "OS"
    manosPoker["A5s"] :=  "LC"
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
    manosPoker["KQs"] :=  "LR"
    manosPoker["KJs"] :=  "LR"
    manosPoker["KTs"] :=  "LR"
    manosPoker["K9s"] :=  "OS"
    manosPoker["K8s"] :=  "OS"
    manosPoker["K7s"] :=  "LC"
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
    manosPoker["K5o"] :=  "OS"
    manosPoker["K4o"] :=  "OS"
    manosPoker["K3o"] :=  "OS"
    manosPoker["K2o"] :=  "OS"
    manosPoker["QJs"] :=  "LR"
    manosPoker["QTs"] :=  "LR"
    manosPoker["Q9s"] :=  "LR"
    manosPoker["Q8s"] :=  "LC"
    manosPoker["Q7s"] :=  "OS"
    manosPoker["Q6s"] :=  "OS"
    manosPoker["Q5s"] :=  "OS"
    manosPoker["Q4s"] :=  "OS"
    manosPoker["Q3s"] :=  "OS"
    manosPoker["Q2s"] :=  "OS"
    manosPoker["QJo"] :=  "OS"
    manosPoker["QTo"] :=  "OS"
    manosPoker["Q9o"] :=  "OS"
    manosPoker["Q8o"] :=  "OS"
    manosPoker["Q7o"] :=  "OS"
    manosPoker["Q6o"] :=  "OS"
    manosPoker["Q5o"] :=  "LF"
    manosPoker["Q4o"] :=  "LF"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LC"
    manosPoker["J9s"] :=  "LC"
    manosPoker["J8s"] :=  "LC"
    manosPoker["J7s"] :=  "OS"
    manosPoker["J6s"] :=  "OS"
    manosPoker["J5s"] :=  "OS"
    manosPoker["J4s"] :=  "OS"
    manosPoker["J3s"] :=  "LCS"
    manosPoker["J2s"] :=  "LCS"
    manosPoker["JTo"] :=  "OS"
    manosPoker["J9o"] :=  "OS"
    manosPoker["J8o"] :=  "OS"
    manosPoker["J7o"] :=  "LCS"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "FOLD"
    manosPoker["J2o"] :=  "FOLD"
    manosPoker["T9s"] :=  "LC"
    manosPoker["T8s"] :=  "OS"
    manosPoker["T7s"] :=  "OS"
    manosPoker["T6s"] :=  "OS"
    manosPoker["T5s"] :=  "LCS"
    manosPoker["T4s"] :=  "LCS"
    manosPoker["T3s"] :=  "LCS"
    manosPoker["T2s"] :=  "LCS"
    manosPoker["T9o"] :=  "OS"
    manosPoker["T8o"] :=  "LCS"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "FOLD"
    manosPoker["T4o"] :=  "FOLD"
    manosPoker["T3o"] :=  "FOLD"
    manosPoker["T2o"] :=  "FOLD"
    manosPoker["98s"] :=  "OS"
    manosPoker["97s"] :=  "OS"
    manosPoker["96s"] :=  "OS"
    manosPoker["95s"] :=  "OS"
    manosPoker["94s"] :=  "LCS"
    manosPoker["93s"] :=  "LCS"
    manosPoker["92s"] :=  "LCS"
    manosPoker["98o"] :=  "LCS"
    manosPoker["97o"] :=  "LCS"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "FOLD"
    manosPoker["94o"] :=  "FOLD"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "OS"
    manosPoker["86s"] :=  "OS"
    manosPoker["85s"] :=  "OS"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LCS"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "FOLD"
    manosPoker["84o"] :=  "FOLD"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "OS"
    manosPoker["75s"] :=  "OS"
    manosPoker["74s"] :=  "LCS"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "FOLD"
    manosPoker["76o"] :=  "OS"
    manosPoker["75o"] :=  "FOLD"
    manosPoker["74o"] :=  "FOLD"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "OS"
    manosPoker["64s"] :=  "OS"
    manosPoker["63s"] :=  "LCS"
    manosPoker["62s"] :=  "FOLD"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "FOLD"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "OS"
    manosPoker["53s"] :=  "OS"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "FOLD"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "LCS"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "FOLD"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

SBfish18(manos)
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
    manosPoker["A9o"] :=  "ORF"
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
    manosPoker["K4s"] :=  "LCS"
    manosPoker["K3s"] :=  "LCS"
    manosPoker["K2s"] :=  "LCS"
    manosPoker["KQo"] :=  "ORCS"
    manosPoker["KJo"] :=  "ORCS"
    manosPoker["KTo"] :=  "ORF"
    manosPoker["K9o"] :=  "ORF"
    manosPoker["K8o"] :=  "ORF"
    manosPoker["K7o"] :=  "ORF"
    manosPoker["K6o"] :=  "LCS"
    manosPoker["K5o"] :=  "LCS"
    manosPoker["K4o"] :=  "LF"
    manosPoker["K3o"] :=  "LF"
    manosPoker["K2o"] :=  "LF"
    manosPoker["QJs"] :=  "ORCS"
    manosPoker["QTs"] :=  "ORCS"
    manosPoker["Q9s"] :=  "ORF"
    manosPoker["Q8s"] :=  "ORF"
    manosPoker["Q7s"] :=  "LCS"
    manosPoker["Q6s"] :=  "LCS"
    manosPoker["Q5s"] :=  "LCS"
    manosPoker["Q4s"] :=  "LCS"
    manosPoker["Q3s"] :=  "LCS"
    manosPoker["Q2s"] :=  "LCS"
    manosPoker["QJo"] :=  "ORF"
    manosPoker["QTo"] :=  "ORF"
    manosPoker["Q9o"] :=  "ORF"
    manosPoker["Q8o"] :=  "LCS"
    manosPoker["Q7o"] :=  "LF"
    manosPoker["Q6o"] :=  "LF"
    manosPoker["Q5o"] :=  "LF"
    manosPoker["Q4o"] :=  "LF"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LCS"
    manosPoker["J9s"] :=  "ORF"
    manosPoker["J8s"] :=  "ORF"
    manosPoker["J7s"] :=  "LCS"
    manosPoker["J6s"] :=  "LCS"
    manosPoker["J5s"] :=  "LCS"
    manosPoker["J4s"] :=  "LCS"
    manosPoker["J3s"] :=  "LCS"
    manosPoker["J2s"] :=  "LCS"
    manosPoker["JTo"] :=  "ORF"
    manosPoker["J9o"] :=  "LCS"
    manosPoker["J8o"] :=  "LF"
    manosPoker["J7o"] :=  "LF"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "LF"
    manosPoker["J2o"] :=  "LF"
    manosPoker["T9s"] :=  "ORF"
    manosPoker["T8s"] :=  "LCS"
    manosPoker["T7s"] :=  "LCS"
    manosPoker["T6s"] :=  "LCS"
    manosPoker["T5s"] :=  "LF"
    manosPoker["T4s"] :=  "LF"
    manosPoker["T3s"] :=  "LF"
    manosPoker["T2s"] :=  "LF"
    manosPoker["T9o"] :=  "LCS"
    manosPoker["T8o"] :=  "LF"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "LF"
    manosPoker["T4o"] :=  "LF"
    manosPoker["T3o"] :=  "LF"
    manosPoker["T2o"] :=  "LF"
    manosPoker["98s"] :=  "LCS"
    manosPoker["97s"] :=  "LCS"
    manosPoker["96s"] :=  "LCS"
    manosPoker["95s"] :=  "LF"
    manosPoker["94s"] :=  "LF"
    manosPoker["93s"] :=  "LF"
    manosPoker["92s"] :=  "LF"
    manosPoker["98o"] :=  "LF"
    manosPoker["97o"] :=  "LF"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "LF"
    manosPoker["94o"] :=  "LF"
    manosPoker["93o"] :=  "LF"
    manosPoker["92o"] :=  "LF"
    manosPoker["87s"] :=  "LCS"
    manosPoker["86s"] :=  "LCS"
    manosPoker["85s"] :=  "LCS"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LF"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "LF"
    manosPoker["84o"] :=  "LF"
    manosPoker["83o"] :=  "LF"
    manosPoker["82o"] :=  "LF"
    manosPoker["76s"] :=  "LCS"
    manosPoker["75s"] :=  "LCS"
    manosPoker["74s"] :=  "LCS"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "LF"
    manosPoker["76o"] :=  "LF"
    manosPoker["75o"] :=  "LF"
    manosPoker["74o"] :=  "LF"
    manosPoker["73o"] :=  "LF"
    manosPoker["72o"] :=  "LF"
    manosPoker["65s"] :=  "LCS"
    manosPoker["64s"] :=  "LCS"
    manosPoker["63s"] :=  "LCS"
    manosPoker["62s"] :=  "LF"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "LF"
    manosPoker["63o"] :=  "LF"
    manosPoker["62o"] :=  "LF"
    manosPoker["54s"] :=  "LCS"
    manosPoker["53s"] :=  "LCS"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "LF"
    manosPoker["53o"] :=  "LF"
    manosPoker["52o"] :=  "LF"
    manosPoker["43s"] :=  "LCS"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "LF"
    manosPoker["42o"] :=  "LF"
    manosPoker["32s"] :=  "LF"
    manosPoker["32o"] :=  "LF"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

SBfish1418(manos)
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
    manosPoker["A9s"] :=  "OS"
    manosPoker["A8s"] :=  "OS"
    manosPoker["A7s"] :=  "OS"
    manosPoker["A6s"] :=  "LCS"
    manosPoker["A5s"] :=  "LCS"
    manosPoker["A4s"] :=  "LCS"
    manosPoker["A3s"] :=  "LCS"
    manosPoker["A2s"] :=  "LCS"
    manosPoker["AKo"] :=  "OS"
    manosPoker["AQo"] :=  "OS"
    manosPoker["AJo"] :=  "OS"
    manosPoker["ATo"] :=  "OS"
    manosPoker["A9o"] :=  "OS"
    manosPoker["A8o"] :=  "OS"
    manosPoker["A7o"] :=  "OS"
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
    manosPoker["K5s"] :=  "LCS"
    manosPoker["K4s"] :=  "LCS"
    manosPoker["K3s"] :=  "LCS"
    manosPoker["K2s"] :=  "LCS"
    manosPoker["KQo"] :=  "ORCS"
    manosPoker["KJo"] :=  "ORF"
    manosPoker["KTo"] :=  "ORF"
    manosPoker["K9o"] :=  "ORF"
    manosPoker["K8o"] :=  "ORF"
    manosPoker["K7o"] :=  "ORF"
    manosPoker["K6o"] :=  "LF"
    manosPoker["K5o"] :=  "LF"
    manosPoker["K4o"] :=  "LF"
    manosPoker["K3o"] :=  "LF"
    manosPoker["K2o"] :=  "LF"
    manosPoker["QJs"] :=  "ORCS"
    manosPoker["QTs"] :=  "ORCS"
    manosPoker["Q9s"] :=  "ORF"
    manosPoker["Q8s"] :=  "ORF"
    manosPoker["Q7s"] :=  "LCS"
    manosPoker["Q6s"] :=  "LCS"
    manosPoker["Q5s"] :=  "LCS"
    manosPoker["Q4s"] :=  "LCS"
    manosPoker["Q3s"] :=  "LCS"
    manosPoker["Q2s"] :=  "LCS"
    manosPoker["QJo"] :=  "ORF"
    manosPoker["QTo"] :=  "ORF"
    manosPoker["Q9o"] :=  "ORF"
    manosPoker["Q8o"] :=  "LCS"
    manosPoker["Q7o"] :=  "LF"
    manosPoker["Q6o"] :=  "LF"
    manosPoker["Q5o"] :=  "LF"
    manosPoker["Q4o"] :=  "LF"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LCS"
    manosPoker["J9s"] :=  "ORF"
    manosPoker["J8s"] :=  "LCS"
    manosPoker["J7s"] :=  "LCS"
    manosPoker["J6s"] :=  "LCS"
    manosPoker["J5s"] :=  "LCS"
    manosPoker["J4s"] :=  "LF"
    manosPoker["J3s"] :=  "LF"
    manosPoker["J2s"] :=  "LF"
    manosPoker["JTo"] :=  "ORF"
    manosPoker["J9o"] :=  "LCS"
    manosPoker["J8o"] :=  "LF"
    manosPoker["J7o"] :=  "LF"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "LF"
    manosPoker["J2o"] :=  "LF"
    manosPoker["T9s"] :=  "ORF"
    manosPoker["T8s"] :=  "LCS"
    manosPoker["T7s"] :=  "LCS"
    manosPoker["T6s"] :=  "LCS"
    manosPoker["T5s"] :=  "LF"
    manosPoker["T4s"] :=  "LF"
    manosPoker["T3s"] :=  "LF"
    manosPoker["T2s"] :=  "LF"
    manosPoker["T9o"] :=  "LCS"
    manosPoker["T8o"] :=  "LF"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "LF"
    manosPoker["T4o"] :=  "LF"
    manosPoker["T3o"] :=  "LF"
    manosPoker["T2o"] :=  "LF"
    manosPoker["98s"] :=  "LCS"
    manosPoker["97s"] :=  "LCS"
    manosPoker["96s"] :=  "LCS"
    manosPoker["95s"] :=  "LF"
    manosPoker["94s"] :=  "LF"
    manosPoker["93s"] :=  "LF"
    manosPoker["92s"] :=  "LF"
    manosPoker["98o"] :=  "LF"
    manosPoker["97o"] :=  "LF"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "LF"
    manosPoker["94o"] :=  "LF"
    manosPoker["93o"] :=  "LF"
    manosPoker["92o"] :=  "LF"
    manosPoker["87s"] :=  "LCS"
    manosPoker["86s"] :=  "LCS"
    manosPoker["85s"] :=  "LCS"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LF"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "LF"
    manosPoker["84o"] :=  "LF"
    manosPoker["83o"] :=  "LF"
    manosPoker["82o"] :=  "LF"
    manosPoker["76s"] :=  "LCS"
    manosPoker["75s"] :=  "LCS"
    manosPoker["74s"] :=  "LCS"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "LF"
    manosPoker["76o"] :=  "LF"
    manosPoker["75o"] :=  "LF"
    manosPoker["74o"] :=  "LF"
    manosPoker["73o"] :=  "LF"
    manosPoker["72o"] :=  "LF"
    manosPoker["65s"] :=  "LCS"
    manosPoker["64s"] :=  "LCS"
    manosPoker["63s"] :=  "LCS"
    manosPoker["62s"] :=  "LF"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "LF"
    manosPoker["63o"] :=  "LF"
    manosPoker["62o"] :=  "LF"
    manosPoker["54s"] :=  "LCS"
    manosPoker["53s"] :=  "LCS"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "LF"
    manosPoker["53o"] :=  "LF"
    manosPoker["52o"] :=  "LF"
    manosPoker["43s"] :=  "LCS"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "LF"
    manosPoker["42o"] :=  "LF"
    manosPoker["32s"] :=  "LF"
    manosPoker["32o"] :=  "LF"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

SBfish1114(manos)
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
    manosPoker["KJs"] :=  "ORC"
    manosPoker["KTs"] :=  "ORC"
    manosPoker["K9s"] :=  "OS"
    manosPoker["K8s"] :=  "OS"
    manosPoker["K7s"] :=  "LCS"
    manosPoker["K6s"] :=  "LCS"
    manosPoker["K5s"] :=  "LCS"
    manosPoker["K4s"] :=  "LCS"
    manosPoker["K3s"] :=  "LCS"
    manosPoker["K2s"] :=  "LCS"
    manosPoker["KQo"] :=  "OS"
    manosPoker["KJo"] :=  "OS"
    manosPoker["KTo"] :=  "LCS"
    manosPoker["K9o"] :=  "LCS"
    manosPoker["K8o"] :=  "LCS"
    manosPoker["K7o"] :=  "LCS"
    manosPoker["K6o"] :=  "LF"
    manosPoker["K5o"] :=  "LF"
    manosPoker["K4o"] :=  "LF"
    manosPoker["K3o"] :=  "LF"
    manosPoker["K2o"] :=  "LF"
    manosPoker["QJs"] :=  "ORC"
    manosPoker["QTs"] :=  "ORC"
    manosPoker["Q9s"] :=  "LCS"
    manosPoker["Q8s"] :=  "LCS"
    manosPoker["Q7s"] :=  "LCS"
    manosPoker["Q6s"] :=  "LCS"
    manosPoker["Q5s"] :=  "LCS"
    manosPoker["Q4s"] :=  "LCS"
    manosPoker["Q3s"] :=  "LCS"
    manosPoker["Q2s"] :=  "LCS"
    manosPoker["QJo"] :=  "LCS"
    manosPoker["QTo"] :=  "LCS"
    manosPoker["Q9o"] :=  "LCS"
    manosPoker["Q8o"] :=  "LF"
    manosPoker["Q7o"] :=  "LF"
    manosPoker["Q6o"] :=  "LF"
    manosPoker["Q5o"] :=  "LF"
    manosPoker["Q4o"] :=  "LF"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LC"
    manosPoker["J9s"] :=  "LCS"
    manosPoker["J8s"] :=  "LCS"
    manosPoker["J7s"] :=  "LCS"
    manosPoker["J6s"] :=  "LF"
    manosPoker["J5s"] :=  "LF"
    manosPoker["J4s"] :=  "LF"
    manosPoker["J3s"] :=  "LF"
    manosPoker["J2s"] :=  "LF"
    manosPoker["JTo"] :=  "LCS"
    manosPoker["J9o"] :=  "LCS"
    manosPoker["J8o"] :=  "LF"
    manosPoker["J7o"] :=  "LF"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "LF"
    manosPoker["J2o"] :=  "LF"
    manosPoker["T9s"] :=  "LCS"
    manosPoker["T8s"] :=  "LCS"
    manosPoker["T7s"] :=  "LCS"
    manosPoker["T6s"] :=  "LCS"
    manosPoker["T5s"] :=  "LF"
    manosPoker["T4s"] :=  "LF"
    manosPoker["T3s"] :=  "LF"
    manosPoker["T2s"] :=  "LF"
    manosPoker["T9o"] :=  "LCS"
    manosPoker["T8o"] :=  "LF"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "LF"
    manosPoker["T4o"] :=  "LF"
    manosPoker["T3o"] :=  "LF"
    manosPoker["T2o"] :=  "LF"
    manosPoker["98s"] :=  "LCS"
    manosPoker["97s"] :=  "LCS"
    manosPoker["96s"] :=  "LCS"
    manosPoker["95s"] :=  "LF"
    manosPoker["94s"] :=  "LF"
    manosPoker["93s"] :=  "LF"
    manosPoker["92s"] :=  "LF"
    manosPoker["98o"] :=  "LF"
    manosPoker["97o"] :=  "LF"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "LF"
    manosPoker["94o"] :=  "LF"
    manosPoker["93o"] :=  "LF"
    manosPoker["92o"] :=  "LF"
    manosPoker["87s"] :=  "LCS"
    manosPoker["86s"] :=  "LCS"
    manosPoker["85s"] :=  "LF"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LF"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "LF"
    manosPoker["84o"] :=  "LF"
    manosPoker["83o"] :=  "LF"
    manosPoker["82o"] :=  "LF"
    manosPoker["76s"] :=  "LCS"
    manosPoker["75s"] :=  "LCS"
    manosPoker["74s"] :=  "LF"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "LF"
    manosPoker["76o"] :=  "LF"
    manosPoker["75o"] :=  "LF"
    manosPoker["74o"] :=  "LF"
    manosPoker["73o"] :=  "LF"
    manosPoker["72o"] :=  "LF"
    manosPoker["65s"] :=  "LCS"
    manosPoker["64s"] :=  "LCS"
    manosPoker["63s"] :=  "LF"
    manosPoker["62s"] :=  "LF"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "LF"
    manosPoker["63o"] :=  "LF"
    manosPoker["62o"] :=  "LF"
    manosPoker["54s"] :=  "LCS"
    manosPoker["53s"] :=  "LCS"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "LF"
    manosPoker["53o"] :=  "LF"
    manosPoker["52o"] :=  "LF"
    manosPoker["43s"] :=  "LCS"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "LF"
    manosPoker["42o"] :=  "LF"
    manosPoker["32s"] :=  "LF"
    manosPoker["32o"] :=  "LF"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}

SBfish811(manos)
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
    manosPoker["KJs"] :=  "ORC"
    manosPoker["KTs"] :=  "LC"
    manosPoker["K9s"] :=  "OS"
    manosPoker["K8s"] :=  "OS"
    manosPoker["K7s"] :=  "OS"
    manosPoker["K6s"] :=  "OS"
    manosPoker["K5s"] :=  "LCS"
    manosPoker["K4s"] :=  "LCS"
    manosPoker["K3s"] :=  "LCS"
    manosPoker["K2s"] :=  "LCS"
    manosPoker["KQo"] :=  "OS"
    manosPoker["KJo"] :=  "OS"
    manosPoker["KTo"] :=  "OS"
    manosPoker["K9o"] :=  "OS"
    manosPoker["K8o"] :=  "OS"
    manosPoker["K7o"] :=  "OS"
    manosPoker["K6o"] :=  "LF"
    manosPoker["K5o"] :=  "LF"
    manosPoker["K4o"] :=  "LF"
    manosPoker["K3o"] :=  "LF"
    manosPoker["K2o"] :=  "LF"
    manosPoker["QJs"] :=  "LC"
    manosPoker["QTs"] :=  "LC"
    manosPoker["Q9s"] :=  "OS"
    manosPoker["Q8s"] :=  "OS"
    manosPoker["Q7s"] :=  "LCS"
    manosPoker["Q6s"] :=  "LCS"
    manosPoker["Q5s"] :=  "LCS"
    manosPoker["Q4s"] :=  "LF"
    manosPoker["Q3s"] :=  "LF"
    manosPoker["Q2s"] :=  "LF"
    manosPoker["QJo"] :=  "OS"
    manosPoker["QTo"] :=  "OS"
    manosPoker["Q9o"] :=  "OS"
    manosPoker["Q8o"] :=  "LF"
    manosPoker["Q7o"] :=  "LF"
    manosPoker["Q6o"] :=  "LF"
    manosPoker["Q5o"] :=  "LF"
    manosPoker["Q4o"] :=  "LF"
    manosPoker["Q3o"] :=  "LF"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "LC"
    manosPoker["J9s"] :=  "OS"
    manosPoker["J8s"] :=  "OS"
    manosPoker["J7s"] :=  "LCS"
    manosPoker["J6s"] :=  "LF"
    manosPoker["J5s"] :=  "LF"
    manosPoker["J4s"] :=  "LF"
    manosPoker["J3s"] :=  "LF"
    manosPoker["J2s"] :=  "LF"
    manosPoker["JTo"] :=  "OS"
    manosPoker["J9o"] :=  "OS"
    manosPoker["J8o"] :=  "LF"
    manosPoker["J7o"] :=  "LF"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "LF"
    manosPoker["J2o"] :=  "LF"
    manosPoker["T9s"] :=  "LCS"
    manosPoker["T8s"] :=  "LCS"
    manosPoker["T7s"] :=  "LCS"
    manosPoker["T6s"] :=  "LCS"
    manosPoker["T5s"] :=  "LF"
    manosPoker["T4s"] :=  "LF"
    manosPoker["T3s"] :=  "LF"
    manosPoker["T2s"] :=  "LF"
    manosPoker["T9o"] :=  "LCS"
    manosPoker["T8o"] :=  "LF"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "LF"
    manosPoker["T4o"] :=  "LF"
    manosPoker["T3o"] :=  "LF"
    manosPoker["T2o"] :=  "LF"
    manosPoker["98s"] :=  "OS"
    manosPoker["97s"] :=  "LCS"
    manosPoker["96s"] :=  "LCS"
    manosPoker["95s"] :=  "LF"
    manosPoker["94s"] :=  "LF"
    manosPoker["93s"] :=  "LF"
    manosPoker["92s"] :=  "LF"
    manosPoker["98o"] :=  "LF"
    manosPoker["97o"] :=  "LF"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "LF"
    manosPoker["94o"] :=  "LF"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "OS"
    manosPoker["86s"] :=  "LCS"
    manosPoker["85s"] :=  "LF"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LF"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "LF"
    manosPoker["84o"] :=  "LF"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "OS"
    manosPoker["75s"] :=  "LCS"
    manosPoker["74s"] :=  "LF"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "LF"
    manosPoker["76o"] :=  "LF"
    manosPoker["75o"] :=  "LF"
    manosPoker["74o"] :=  "LF"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "OS"
    manosPoker["64s"] :=  "LF"
    manosPoker["63s"] :=  "LF"
    manosPoker["62s"] :=  "LF"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "LF"
    manosPoker["63o"] :=  "LF"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "LCS"
    manosPoker["53s"] :=  "LF"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "LF"
    manosPoker["53o"] :=  "LF"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "LF"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "LF"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "LF"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}


SBfish68(manos)
{
    
; Crear el diccionario
    manosPoker := {}
    
; Asignar valores a las claves
    
    manosPoker["AAo"] :=  "LC"
    manosPoker["KKo"] :=  "LC"
    manosPoker["QQo"] :=  "LC"
    manosPoker["JJo"] :=  "LC"
    manosPoker["TTo"] :=  "LC"
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
    manosPoker["K5o"] :=  "OS"
    manosPoker["K4o"] :=  "OS"
    manosPoker["K3o"] :=  "OS"
    manosPoker["K2o"] :=  "OS"
    manosPoker["QJs"] :=  "OS"
    manosPoker["QTs"] :=  "OS"
    manosPoker["Q9s"] :=  "OS"
    manosPoker["Q8s"] :=  "OS"
    manosPoker["Q7s"] :=  "OS"
    manosPoker["Q6s"] :=  "OS"
    manosPoker["Q5s"] :=  "OS"
    manosPoker["Q4s"] :=  "OS"
    manosPoker["Q3s"] :=  "OS"
    manosPoker["Q2s"] :=  "OS"
    manosPoker["QJo"] :=  "OS"
    manosPoker["QTo"] :=  "OS"
    manosPoker["Q9o"] :=  "OS"
    manosPoker["Q8o"] :=  "OS"
    manosPoker["Q7o"] :=  "OS"
    manosPoker["Q6o"] :=  "OS"
    manosPoker["Q5o"] :=  "OS"
    manosPoker["Q4o"] :=  "OS"
    manosPoker["Q3o"] :=  "OS"
    manosPoker["Q2o"] :=  "LF"
    manosPoker["JTs"] :=  "OS"
    manosPoker["J9s"] :=  "OS"
    manosPoker["J8s"] :=  "OS"
    manosPoker["J7s"] :=  "OS"
    manosPoker["J6s"] :=  "OS"
    manosPoker["J5s"] :=  "OS"
    manosPoker["J4s"] :=  "OS"
    manosPoker["J3s"] :=  "OS"
    manosPoker["J2s"] :=  "OS"
    manosPoker["JTo"] :=  "OS"
    manosPoker["J9o"] :=  "OS"
    manosPoker["J8o"] :=  "OS"
    manosPoker["J7o"] :=  "OS"
    manosPoker["J6o"] :=  "LF"
    manosPoker["J5o"] :=  "LF"
    manosPoker["J4o"] :=  "LF"
    manosPoker["J3o"] :=  "LF"
    manosPoker["J2o"] :=  "LF"
    manosPoker["T9s"] :=  "OS"
    manosPoker["T8s"] :=  "OS"
    manosPoker["T7s"] :=  "OS"
    manosPoker["T6s"] :=  "OS"
    manosPoker["T5s"] :=  "OS"
    manosPoker["T4s"] :=  "LF"
    manosPoker["T3s"] :=  "LF"
    manosPoker["T2s"] :=  "LF"
    manosPoker["T9o"] :=  "OS"
    manosPoker["T8o"] :=  "OS"
    manosPoker["T7o"] :=  "LF"
    manosPoker["T6o"] :=  "LF"
    manosPoker["T5o"] :=  "LF"
    manosPoker["T4o"] :=  "LF"
    manosPoker["T3o"] :=  "LF"
    manosPoker["T2o"] :=  "LF"
    manosPoker["98s"] :=  "OS"
    manosPoker["97s"] :=  "OS"
    manosPoker["96s"] :=  "OS"
    manosPoker["95s"] :=  "OS"
    manosPoker["94s"] :=  "LF"
    manosPoker["93s"] :=  "LF"
    manosPoker["92s"] :=  "LF"
    manosPoker["98o"] :=  "OS"
    manosPoker["97o"] :=  "LF"
    manosPoker["96o"] :=  "LF"
    manosPoker["95o"] :=  "LF"
    manosPoker["94o"] :=  "LF"
    manosPoker["93o"] :=  "FOLD"
    manosPoker["92o"] :=  "FOLD"
    manosPoker["87s"] :=  "OS"
    manosPoker["86s"] :=  "OS"
    manosPoker["85s"] :=  "OS"
    manosPoker["84s"] :=  "LF"
    manosPoker["83s"] :=  "LF"
    manosPoker["82s"] :=  "LF"
    manosPoker["87o"] :=  "LF"
    manosPoker["86o"] :=  "LF"
    manosPoker["85o"] :=  "LF"
    manosPoker["84o"] :=  "LF"
    manosPoker["83o"] :=  "FOLD"
    manosPoker["82o"] :=  "FOLD"
    manosPoker["76s"] :=  "OS"
    manosPoker["75s"] :=  "OS"
    manosPoker["74s"] :=  "LF"
    manosPoker["73s"] :=  "LF"
    manosPoker["72s"] :=  "LF"
    manosPoker["76o"] :=  "LF"
    manosPoker["75o"] :=  "LF"
    manosPoker["74o"] :=  "LF"
    manosPoker["73o"] :=  "FOLD"
    manosPoker["72o"] :=  "FOLD"
    manosPoker["65s"] :=  "OS"
    manosPoker["64s"] :=  "LF"
    manosPoker["63s"] :=  "LF"
    manosPoker["62s"] :=  "LF"
    manosPoker["65o"] :=  "LF"
    manosPoker["64o"] :=  "LF"
    manosPoker["63o"] :=  "FOLD"
    manosPoker["62o"] :=  "FOLD"
    manosPoker["54s"] :=  "OS"
    manosPoker["53s"] :=  "LF"
    manosPoker["52s"] :=  "LF"
    manosPoker["54o"] :=  "LF"
    manosPoker["53o"] :=  "FOLD"
    manosPoker["52o"] :=  "FOLD"
    manosPoker["43s"] :=  "LF"
    manosPoker["42s"] :=  "LF"
    manosPoker["43o"] :=  "FOLD"
    manosPoker["42o"] :=  "FOLD"
    manosPoker["32s"] :=  "LF"
    manosPoker["32o"] :=  "FOLD"
    
; Consultar el valor de una clave
    clave := manos
    valormanos := manosPoker.HasKey(clave) ? manosPoker[clave] : ""
    
    return valormanos
}




CheckInRange(valormanos, stackefectivo)
{
    ; Dividir la cadena en partes basadas en el punto y coma
    rangos := StrSplit(valormanos, ";")

    ; Iterar sobre cada rango
    Loop, % rangos.Length()
    {
        ; Obtener el rango actual
        rango := rangos[A_Index]
        
        ; Separar los límites del rango usando "o"
        limite_inferior := SubStr(rango, 1, InStr(rango, "o") - 1)
        limite_superior := SubStr(rango, InStr(rango, "o") + 1)
        
        ; Convertir los límites a números para comparar
        limite_inferior := StrReplace(limite_inferior, "o", ".")
        limite_superior := StrReplace(limite_superior, "o", ".")
        
        ; Convertir el stackefectivo a un número para comparar
        numero := StrReplace(stackefectivo, "o", ".")
        
        ; Verificar si el stackefectivo está dentro del rango actual
        if (limite_inferior + 0 <= numero && numero <= limite_superior + 0)
        {
            ; Si está dentro del rango, devolver el límite superior del rango
            return limite_superior
        }
    }

    ; Si no está dentro de ningún rango, devolver una cadena vacía
    return ""
}







IsNumber(n) {
    return RegExMatch(n, "^\s*-?\d+(\.\d+)?\s*$")
}

IsStr(s) {
    return !IsNumber(s)
}






