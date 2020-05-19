org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call 	phrase2
	call 	phrase3
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


m_cursr2:
    mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 8d ; fila
	mov 	bh, 0h
	int 	10h
	ret


m_cursr3:
    mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 12d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 10d
lupi:	
    mov 	cl, [msg+di-10d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase2:	mov 	di, 16d
escribir1:	
    mov 	cl, [msg2+di-16d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	escribir1
	ret

phrase3:	mov 	di, 8d
escribir2:	
    mov 	cl, [msg3+di-8d]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	escribir2
	ret

section .data
msg		db 	"Capitan Teemo de servicio"
len 	equ	$-msg+10

msg2	db 	"Nunca subestimes el poder del codigo de los exploradores"
len2	equ	$-msg2+16

msg3	db 	"Frases de lol - Teemo"
len3 	equ	$-msg3+8
