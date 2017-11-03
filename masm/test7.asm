assume cs:codesg,ds:datasg,ss:stacksg

datasg segment
	db 'welcome to asm' ;14
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends

codesg segment
start:	
	mov ax,stacksg
	mov ss,ax
	mov sp,16
	
	mov ax,datasg
	mov ds,ax
	
	mov bx,0b800h+12*10
	mov es,bx
	mov di,68
	 
	mov ah,10100101b			;设置第一行字体的属性
	
	mov cx,3					;三行，每行循环一次
	r:
		push cx
		mov si,0				;定位字符串第一个字符
		
		mov cx,14				;一行14个字符，每个字符操作相同，循环14次
		s:
			mov al,[si]			;地位放字符
			mov es:[di],ax		;高位放属性
			add si,1			;db型字符到下一个字符地址每次加一
			add di,2			;字符和属性占两个字节
		loop s
		
		add di,132				;到下一行显示
		add ah,10011001b		;属性变化
		pop cx
	loop r
	mov ax,4c00h
	int 21h
codesg ends
end start