org 	100h

section .text

calculo:
    ; Suma 7 + 6 + 0 + 1 + 7
    mov cx,7d
    mov ax,cx
    mov cx,6d
    mov bx,cx
    ADD ax,bx
    mov cx, 0d
    ADD ax,cx
    mov cx, 1d
    ADD ax,cx
    mov cx, 7d
    ADD ax,cx
    ; Promedio 
    mov cx,5d
    div cx
    ; Mostrar el mensaje dependiendo de la calificacion
    mov cx,10d
    CMP ax,cx
    ;JE msg10
    mov cx,9d
    CMP ax,cx
    ;JE msg9
    mov cx,8d
    CMP ax,cx
    ;JE msg8
    mov cx,7d
    CMP ax,cx
    ;JE msg7
    mov cx,6d
    CMP ax,cx
    ;JE msg6
    mov cx,5d
    CMP ax,cx
    ;JE msg5
    mov cx,4d
    CMP ax,cx
    JE msg4
    mov cx,3d
    CMP ax,cx
    ;JE msg3
    mov cx,2d
    CMP ax,cx
    ;JE msg2
    mov cx,1d
    CMP ax,cx
    ;JE msg1
msg4:
	call 	texto	
	call 	cursor
	call 	phrase4
	call	kbwait
	int 	20h
texto:	
    mov 	ah, 00h
	mov	    al, 03h
	int 	10h
	ret

cursor: 
    mov	    ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: 
    mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 4d ; fila
	mov 	bh, 0h
	int 	10h
	ret
phrase1:	mov 	di, 0d
lupi1:	
    mov 	cl, [nota1+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi1
	ret
phrase2:	mov 	di, 0d
lupi2:	
    mov 	cl, [nota2+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret
phrase3:	mov 	di, 0d
lupi3:	
    mov 	cl, [nota3+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret
phrase4:	mov 	di, 10d
lupi4:	
    mov 	cl, [nota4+di-10d]
    mov     [200h+di-10d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lupi4
	ret
phrase5:	mov 	di, 0d
lupi5:	
    mov 	cl, [nota5+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len5
	jb	lupi5
	ret
phrase6:	mov 	di, 0d
lupi6:	
    mov 	cl, [nota6+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len6
	jb	lupi6
	ret
phrase7:	mov 	di, 0d
lupi7:	
    mov 	cl, [nota7+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len7
	jb	lupi7
	ret
phrase8:	mov 	di, 0d
lupi8:	
    mov 	cl, [nota8+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len8
	jb	lupi8
	ret
phrase9:	mov 	di, 0d
lupi9:	
    mov 	cl, [nota9+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len9
	jb	lupi9
	ret
phrase10:	mov 	di, 0d
lupi10:	
    mov 	cl, [nota10+di-0d]
    mov     [200h+di-0d],cl
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len10
	jb	lupi10
	ret
section .data
nota10		db 	"Perfecto solo Dios"
len10 	equ	$-nota10
nota9		db 	"Siempre me esfuerzo"
len9 	equ	$-nota9
nota8		db 	"Colocho"
len8 	equ	$-nota8
nota7		db 	"Muy bien"
len7	equ	$-nota7
nota6		db 	"Peor es nada"
len6 	equ	$-nota6
nota5		db 	"En el segundo"
len5 	equ	$-nota5
nota4		db 	"Me recupero"
len4 	equ	$-nota4+10d
nota3		db 	"Hay salud"
len3 	equ	$-nota3
nota2		db 	"Aun se pasa"
len2	equ	$-nota2
nota1		db 	"Solo necesito el 0"
len1 	equ	$-nota1
