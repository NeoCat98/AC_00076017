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
	CMP di,4d
	JE calculo
	inc di
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
nota4		db 	"Me recupero$"
len4 	equ	$-nota4
nl	db 	0xA, 0xD, "$"