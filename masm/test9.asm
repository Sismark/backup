assume cs:code
data segment
	db 'welcome to masm!',0
data ends

code segment
start:	
	
	mov dh,8				;行
	mov dl,3				;列
	mov cl,2				;颜色
	
	mov ax,data
	mov ds,ax
	mov si,0
	call shoow_str
	
	mov ax,4c00h
	int 21h
shoow_str:
	mov ax,0
	mov bx,0b800h
	mov al,dh
	mov bl,10
	mul bl
	add bx,ax
	mov es,bx
	
	mov ax,0
	
	mov al,2
	mov bl,dl
	mul bl
	
	mov di,ax
	
	push cx				;颜色入栈
	s:
		pop cx			;颜色出栈
		mov al,[si]
		mov ah,cl
		mov es:[di],ax
		inc si
		add di,2
		push cx			;颜色入栈
		mov cl,[si]
		mov ch,[si]
		add cx,1
	loop s
	pop cx
	ret
code ends
end start