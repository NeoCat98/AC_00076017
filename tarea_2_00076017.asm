        org     100
        mov di,0d
        mov cx, ""
        
clear:
        mov [200h+di],cx
        CMP di,80h
        JE ejercicio1
        inc di
        loop clear

ejercicio1: mov cx, 7d
        mov ax,cx
        mov cx, 6d
        mov bx,cx
        ADD ax,bx
        mov cx, 0d
        ADD ax,cx
        mov cx, 1d
        ADD ax,cx
        mov cx, 7d
        ADD ax,cx
        mov [200h],ax
        mov cx,5d
        div cx
        mov cx,10d
        CMP ax,cx
        JE msg10
        mov cx,9d
        CMP ax,cx
        JE msg9
        mov cx,8d
        CMP ax,cx
        JE msg8
        mov cx,7d
        CMP ax,cx
        JE msg7
        mov cx,6d
        CMP ax,cx
        JE msg6
        mov cx,5d
        CMP ax,cx
        JE msg5
        mov cx,4d
        CMP ax,cx
        JE msg4
        int 20h
        mov cx,3d
        CMP ax,cx
        JE msg3
        mov cx,2d
        CMP ax,cx
        JE msg2
        mov cx,1d
        CMP ax,cx
        JE msg1

        int 20h

msg10:   
        MOV bl, "P"
        mov [200h],bl
        MOV bl, "e"
        mov [201h],bl
        MOV bl, "r"
        mov [202h],bl
        MOV bl, "f"
        mov [203h],bl
        MOV bl, "e"
        mov [204h],bl
        MOV bl, "c"
        mov [205h],bl
        MOV bl, "t"
        mov [206h],bl
        MOV bl, "o"
        mov [207h],bl
        MOV bl, ""
        mov [208h],bl
        MOV bl, "s"
        mov [209h],bl
        MOV bl, "o"
        mov [20Ah],bl
        MOV bl, "l"
        mov [20Bh],bl
        MOV bl, "o"
        mov [20Ch],bl
        MOV bl, ""
        mov [20Dh],bl
        MOV bl, "d"
        mov [20Eh],bl
        MOV bl, "i"
        mov [20Fh],bl
        MOV bl, "o"
        mov [240h],bl
        MOV bl, "s"
        mov [241h],bl
        call ejercicio2
msg9:   
        MOV bl, "S"
        mov [200h],bl
        MOV bl, "i"
        mov [201h],bl
        MOV bl, "e"
        mov [202h],bl
        MOV bl, "m"
        mov [203h],bl
        MOV bl, "p"
        mov [204h],bl
        MOV bl, "r"
        mov [205h],bl
        MOV bl, "e"
        mov [206h],bl
        MOV bl, ""
        mov [207h],bl
        MOV bl, "m"
        mov [208h],bl
        MOV bl, "e"
        mov [209h],bl
        MOV bl, ""
        mov [20Ah],bl
        MOV bl, "e"
        mov [20Bh],bl
        MOV bl, "s"
        mov [20Ch],bl
        MOV bl, "f"
        mov [20Dh],bl
        MOV bl, "u"
        mov [20Eh],bl
        MOV bl, "e"
        mov [20Fh],bl
        MOV bl, "r"
        mov [240h],bl
        MOV bl, "z"
        mov [241h],bl
        MOV bl, "o"
        mov [242h],bl
        call ejercicio2
        int 20h
msg8:   
        MOV bl, "C"
        mov [200h],bl
        MOV bl, "o"
        mov [201h],bl
        MOV bl, "l"
        mov [202h],bl
        MOV bl, "o"
        mov [203h],bl
        MOV bl, "c"
        mov [204h],bl
        MOV bl, "h"
        mov [205h],bl
        MOV bl, "o"
        mov [206h],bl
        call ejercicio2
        int 20h
msg7:   
        MOV bl, "M"
        mov [200h],bl
        MOV bl, "u"
        mov [201h],bl
        MOV bl, "y"
        mov [202h],bl
        MOV bl, ""
        mov [203h],bl
        MOV bl, "b"
        mov [204h],bl
        MOV bl, "i"
        mov [205h],bl
        MOV bl, "e"
        mov [206h],bl
        MOV bl, "n"
        mov [207h],bl
        call ejercicio2
        int 20h
msg6:   
        MOV bl, "P"
        mov [200h],bl
        MOV bl, "e"
        mov [201h],bl
        MOV bl, "o"
        mov [202h],bl
        MOV bl, "r"
        mov [203h],bl
        MOV bl, ""
        mov [204h],bl
        MOV bl, "e"
        mov [205h],bl
        MOV bl, "s"
        mov [206h],bl
        MOV bl, ""
        mov [207h],bl
        MOV bl, "n"
        mov [208h],bl
        MOV bl, "a"
        mov [209h],bl
        MOV bl, "d"
        mov [20Ah],bl
        MOV bl, "a"
        mov [20Bh],bl
        call ejercicio2
        int 20h
msg5:   
        MOV bl, "E"
        mov [200h],bl
        MOV bl, "n"
        mov [201h],bl
        MOV bl, ""
        mov [202h],bl
        MOV bl, "e"
        mov [203h],bl
        MOV bl, "l"
        mov [204h],bl
        MOV bl, ""
        mov [205h],bl
        MOV bl, "s"
        mov [206h],bl
        MOV bl, "e"
        mov [207h],bl
        MOV bl, "g"
        mov [208h],bl
        MOV bl, "u"
        mov [209h],bl
        MOV bl, "n"
        mov [20Ah],bl
        MOV bl, "d"
        mov [20Bh],bl
        MOV bl, "o"
        mov [20Ch],bl
        call ejercicio2
        int 20h
msg4:   
        MOV bl, "M"
        mov [200h],bl
        MOV bl, "e"
        mov [201h],bl
        MOV bl, ""
        mov [202h],bl
        MOV bl, "r"
        mov [203h],bl
        MOV bl, "e"
        mov [204h],bl
        MOV bl, "c"
        mov [205h],bl
        MOV bl, "u"
        mov [206h],bl
        MOV bl, "p"
        mov [207h],bl
        MOV bl, "e"
        mov [208h],bl
        MOV bl, "r"
        mov [209h],bl
        MOV bl, "o"
        mov [20Ah],bl
        call ejercicio2
        int 20h
msg3:   
        MOV bl, "H"
        mov [200h],bl
        MOV bl, "a"
        mov [201h],bl
        MOV bl, "y"
        mov [202h],bl
        MOV bl, ""
        mov [203h],bl
        MOV bl, "s"
        mov [204h],bl
        MOV bl, "a"
        mov [205h],bl
        MOV bl, "l"
        mov [206h],bl
        MOV bl, "u"
        mov [207h],bl
        MOV bl, "d"
        mov [208h],bl
        call ejercicio2
        int 20h
msg2:   
        MOV bl, "A"
        mov [200h],bl
        MOV bl, "u"
        mov [201h],bl
        MOV bl, "n"
        mov [202h],bl
        MOV bl, ""
        mov [203h],bl
        MOV bl, "s"
        mov [204h],bl
        MOV bl, "e"
        mov [205h],bl
        MOV bl, ""
        mov [206h],bl
        MOV bl, "p"
        mov [207h],bl
        MOV bl, "a"
        mov [208h],bl
        MOV bl, "s"
        mov [209h],bl
        MOV bl, "a"
        mov [20Ah],bl
        call ejercicio2
        int 20h
msg1:   
        MOV bl, "S"
        mov [200h],bl
        MOV bl, "o"
        mov [201h],bl
        MOV bl, "l"
        mov [202h],bl
        MOV bl, "o"
        mov [203h],bl
        MOV bl, ""
        mov [204h],bl
        MOV bl, "n"
        mov [205h],bl
        MOV bl, "e"
        mov [206h],bl
        MOV bl, "c"
        mov [207h],bl
        MOV bl, "e"
        mov [208h],bl
        MOV bl, "s"
        mov [209h],bl
        MOV bl, "i"
        mov [20Ah],bl
        MOV bl, "t"
        mov [20Bh],bl
        MOV bl, "o"
        mov [20Ch],bl
        MOV bl, ""
        mov [20Dh],bl
        MOV bl, "e"
        mov [20Eh],bl
        MOV bl, "l"
        mov [20Fh],bl
        MOV bl, ""
        mov [240h],bl
        MOV bl, "0"
        mov [241h],bl
        call ejercicio2
        int 20h

ejercicio2:
        mov di,0d
        mov cx,0d
        mov ax,2d
        mov bx,2d

grafica:
        MUL bx
        mov [210h+di],ax
        inc di
        inc cx
        cmp ah,0d
        JE grafica
        call grafica2
        int 20h
grafica2:
        MUL bx
        inc di
        mov [210h+di],ax
        inc di
        inc cx
        CMP cx,11d
        JE ejercicio3
        call grafica2
        int 20h
ejercicio3:
        mov     di,0d
        mov     ax, 0d
        mov     [220h],ax
        mov     bx, 1d
        mov     [221h],bx

fibo:
        ADD     ax,bx
        mov     [222h+di],ax
        mov     cx, bx
        mov     bx, ax
        mov     ax, cx
        inc     di
        CMP     di,13d
        JE      finish
        cmp     bh,0h     
        JE      fibo
        call    fibo2
        int     20h

fibo2:
        ADD     ax,bx
        inc     di
        mov     [222h+di],ax
        mov     cx, bx
        mov     bx, ax
        mov     ax, cx
        CMP     di,13d
        JE      finish
        inc     di
        loop fibo2
        int 20h
finish:
        int 20h