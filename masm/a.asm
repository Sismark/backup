assume cs:codesg
codesg segment
	mov cx,1
s: 	add cx,1
	loop s
	mov ax,4c00h
	int 21h
	codesg ends
end