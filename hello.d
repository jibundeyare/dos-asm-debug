a
; Hello World
mov dx,010D ; OFFSET string
mov ah,09
int 21
mov ah,4C
mov al,0
int 21
; #string
db "Hello World!",0D,"$"

n hello.com
r cx
011B
w
q

