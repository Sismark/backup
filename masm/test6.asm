assume cs:codesg,ds:datasg,ss:stacksg
stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends
datasg segment
	db '1. display      '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
datasg ends
codesg segment
start:
	mov ax,stacksg
	mov ss,ax				;初始化栈
	mov sp,16				
	
	mov ax,datasg		
	mov ds,ax				;datasg数据放入内存
	mov bx,0         		;偏移地址从零开始
	
	mov dx,0
	mov cx,4				;共4行16列数据，每行操作相同
	s:	push cx				;cx中的数据存入栈中
		mov si,3			;每行第三个为字母，开始改变大小写
		
		mov cx,4			;改变每行前四个字母的大小写，每个字母操作方式相同
		r:	mov al,[bx+si]	
			and al,11011111b;将偏移地址为[bc+si]中的字母与11011111作与运算并将结果赋给al
			mov [bx+si],al	;改变了偏移地址为[bc+si]中的字母的大小写
			inc si			;偏移地址+1,对下一个字母进行操作
		loop r
			
		add bx,16			;继续操作下一行的数据
		pop cx				;通过出栈的方式恢复r循环中cx的值
	loop s
	
	mov ax,4c00h
	int 21h
codesg ends
end start
			
			
	