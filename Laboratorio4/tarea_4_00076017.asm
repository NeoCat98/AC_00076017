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
    mov cl,10d
    CMP al,cl
    JE msg10
    mov cl,9d
    CMP al,cl
    JE msg9
    mov cl,8d
    CMP al,cl
    JE msg8
    mov cl,7d
    CMP al,cl
    JE msg7
    mov cl,6d
    CMP al,cl
    JE msg6
    mov cl,5d
    CMP al,cl
    JE msg5
    mov cl,4d
    CMP al,cl
    JE msg4
    mov cl,3d
    CMP al,cl
    JE msg3
    mov cl,2d
    CMP al,cl
    JE msg2
    mov cl,1d
    CMP al,cl
    JE msg1
msg10:
	mov dx,nota10
	call w_strng
	mov di,0d
	;call saveMsg10
	int 20h
msg9:
	mov dx,nota9
	call w_strng
	mov di,0d
	;call saveMsg9
	int 20h
msg8:
	mov dx,nota8
	call w_strng
	mov di,0d
	;call saveMsg8
	int 20h
msg7:
	mov dx,nota7
	call w_strng
	mov di,0d
	;call saveMsg7
	int 20h
msg6:
	mov dx,nota6
	call w_strng
	mov di,0d
	;call saveMsg6
	int 20h
msg5:
	mov dx,nota5
	call w_strng
	mov di,0d
	;call saveMsg5
	int 	20h
msg4:
	mov dx,nota4
	call w_strng
	;call saveMsg4
	int 	20h
msg3:
	mov dx,nota3
	call w_strng
	mov di,0d
	;call saveMsg3
	int 	20h
msg2:
	mov dx,nota2
	call w_strng
	mov di,0d
	;call saveMsg2
	int 	20h
msg1:
	mov dx,nota1
	call w_strng
	mov di,0d
	;call saveMsg1
	int 	20h
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