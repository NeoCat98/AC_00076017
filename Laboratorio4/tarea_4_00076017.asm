org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	mostrar
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

mostrar:mov 	dx, nl
	call	w_strng
	mov	byte [300h+si], "$"
	mov di,0d
	; Transformar los numero de ASCII a su numero correspondiente para poder emplear la suma
	call transformar
	call 	kb	; solo detenemos la ejecución
	int 	20h
transformar:
	mov al,[300h+di]
	SUB al,48d
	mov [300h+di],al
	inc di
	CMP di,5d
	JE calculo
	call transformar
calculo:
    ; se realiza la suma
	mov ax, 0d
    mov cx,[300h]
    mov ax,cx
    mov cx,[301h]
    mov bx,cx
    ADD ax,bx
    mov cx,[302h]
    ADD ax,cx
    mov cx,[303h]
    ADD ax,cx
    mov cx,[304h]
    ADD ax,cx
	mov [310h],al
	mov ax,[310h]
    ; Promedio
    mov cl,5d
    div cl
	mov [320h],al
    ; Mostrar el mensaje dependiendo de la calificacion
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
    mov cx,3d
    CMP ax,cx
    JE msg3
    mov cx,2d
    CMP ax,cx
    JE msg2
    mov cx,1d
    CMP ax,cx
    JE msg1
msg10:
	mov dx,nota10
	call w_strng
	mov di,0d
	call saveMsg10
	int 	20h
saveMsg10:
	mov 	cl, [nota10+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg10
	ret
msg9:
	mov dx,nota9
	call w_strng
	mov di,0d
	call saveMsg9
	int 	20h
saveMsg9:
	mov 	cl, [nota9+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg9
	ret
msg8:
	mov dx,nota8
	call w_strng
	mov di,0d
	call saveMsg8
	int 	20h
saveMsg8:
	mov 	cl, [nota8+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg8
	ret
msg7:
	mov dx,nota7
	call w_strng
	mov di,0d
	call saveMsg7
	int 	20h
saveMsg7:
	mov 	cl, [nota7+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg7
	ret
msg6:
	mov dx,nota6
	call w_strng
	mov di,0d
	call saveMsg6
	int 	20h
saveMsg6:
	mov 	cl, [nota6+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg6
	ret
msg5:
	mov dx,nota5
	call w_strng
	mov di,0d
	call saveMsg5
	int 	20h
saveMsg5:
	mov 	cl, [nota5+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg5
	ret
msg4:
	mov dx,nota4
	call w_strng
	mov di,0d
	call saveMsg4
	int 	20h
saveMsg4:
	mov 	cl, [nota4+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg4
	ret
msg3:
	mov dx,nota3
	call w_strng
	mov di,0d
	call saveMsg3
	int 	20h
saveMsg3:
	mov 	cl, [nota3+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg3
	ret
msg2:
	mov dx,nota2
	call w_strng
	mov di,0d
	call saveMsg2
	int 	20h
saveMsg2:
	mov 	cl, [nota2+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg2
	ret
msg1:
	mov dx,nota1
	call w_strng
	mov di,0d
	call saveMsg1
	int 	20h
saveMsg1:
	mov 	cl, [nota1+di]
    mov     [300h+di],cl
	inc	di
	cmp cl, "$"
	jb	saveMsg1
	ret
texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:
	mov	ah, 09h
	int 	21h
	ret

section .data
msg 	db 	"Ingrese los ultimos 5 numeros del carnet: $"
nota10		db 	"Perfecto solo Dios$"
nota9		db 	"Siempre me esfuerzo$"
nota8		db 	"Colocho$"
nota7		db 	"Muy bien$"
nota6		db 	"Peor es nada$"
nota5		db 	"En el segundo$"
nota4		db 	"Me recupero$"
nota3		db 	"Hay salud$"
nota2		db 	"Aun se pasa$"
nota1		db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"