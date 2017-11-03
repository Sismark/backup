assume cs:codesg,ds:datasg

datasg segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	;表示21年的字符串
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	;21年收入的dword数据
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
	;21年雇员人数得word数据
datasg ends

table segment
	db 21 dup ('year summ ne ?? ')
table ends
	
codesg segment
start:
	
	mov ax,datasg
	mov ds,ax
	
	mov ax,table
	mov es,ax
	
	mov bx,0
	mov si,0
	mov cx,21
	s:
		mov ax,ds:[si]
		mov dx,ds:[si+2]
		mov es:[bx],ax				;存年份
		mov es:[bx+2],dx
		add si,4
		add bx,10h
	loop s
	
	mov bx,5
	mov cx,21
	r:
		mov ax,ds:[si]
		mov dx,ds:[si+2]			;存收入
		mov es:[bx],ax
		mov es:[bx+2],dx
		add si,4
		add bx,10h
	loop r
	
	mov bx,10
	mov cx,21
	n:
		mov ax,ds:[si]
		mov word ptr es:[bx],ax		;存雇员
		add si,2
		add bx,10h
	loop n
	
	mov bx,5						;收入
	mov si,10						;人数
	mov cx,21
	m:
		mov ax,es:[bx]
		mov dx,es:[bx+2]
		div word ptr es:[si]		;作除法
		mov word ptr es:[bx+8],ax	;存商
		add si,10h
		add bx,10h
	loop m
		
	mov ax,4c00h
	int 21h
codesg ends
end start
		
	
	
	
	
	
	
	
