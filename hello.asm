a
; Hello World
mov dx,0100 ; OFFSET string
mov ah,09
int 21
mov ah,4C
mov al,0
int 21
; #string
db "Hello World!",0D,"$"

q

