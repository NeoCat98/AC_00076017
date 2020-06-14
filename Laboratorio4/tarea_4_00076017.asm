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
	CMP al,48d
	JE	numero0
	CMP al,49d
	JE	numero1
	CMP al,50d
	JE	numero2
	CMP al,51d
	JE	numero3
	CMP al,52d
	JE	numero4
	CMP al,53d
	JE	numero5
	CMP al,54d
	JE	numero6
	CMP al,55d
	JE	numero7
	CMP al,56d
	JE	numero8
	CMP al,57d
	JE	numero9
	ret
numero0:
	mov al,0d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero1:
	mov al,1d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero2:
	mov al,2d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero3:
	mov al,3d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero4:
	mov al,4d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero5:
	mov ax,5d
	mov [300h+di],ax
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero6:
	mov al,6d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero7:
	mov al,7d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero8:
	mov al,8d
	mov [300h+di],al
	CMP di,4d
	JE calculo
	inc di
	call transformar
numero9:
	mov al,9d
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
    ; Promedio
    div di
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
    mov     [200h+di],cl
	inc	di
	cmp di, len10
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
    mov     [200h+di],cl
	inc	di
	cmp di, len9
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
    mov     [200h+di],cl
	inc	di
	cmp di, len8
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
    mov     [200h+di],cl
	inc	di
	cmp di, len7
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
    mov     [200h+di],cl
	inc	di
	cmp di, len6
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
    mov     [200h+di],cl
	inc	di
	cmp di, len5
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
    mov     [200h+di],cl
	inc	di
	cmp di, len4
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
    mov     [200h+di],cl
	inc	di
	cmp di, len3
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
    mov     [200h+di],cl
	inc	di
	cmp di, len2
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
    mov     [200h+di],cl
	inc	di
	cmp di, len1
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

msg 	db 	"Ingrese su los ultimos 5 numeros del carnet: $"
nota10		db 	"Perfecto solo Dios$"
len10 	equ	$-nota10
nota9		db 	"Siempre me esfuerzo$"
len9	equ	$-nota9
nota8		db 	"Colocho$"
len8	equ	$-nota8
nota7		db 	"Muy bien$"
len7	equ	$-nota7
nota6		db 	"Peor es nada$"
len6	equ	$-nota6
nota5		db 	"En el segundo$"
len5	equ	$-nota5
nota4		db 	"Me recupero$"
len4 	equ	$-nota4
nota3		db 	"Hay salud$"
len3 	equ	$-nota3
nota2		db 	"Aun se pasa$"
len2 	equ	$-nota2
nota1		db 	"Solo necesito el 0$"
len1 	equ	$-nota1
nl	db 	0xA, 0xD, "$"