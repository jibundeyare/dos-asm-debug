a
; printstr
;
jmp near 012D ; OFFSET start
;
; #message1
db "Lorem","$"
; #message2
db "Bar","$"
; #message3
db "Baz","$"
;
; #proc_print_str_crlf
; save ax
push ax
; print message
mov ah,09
int 21
; print CR
mov dx,0122 ; OFFSET CR
int 21
; print LF
mov dx,0124 ; OFFSET LF
int 21
; restore ax
pop ax
ret
; #CR
db 0D,"$"
; #LF
db 0A,"$"
; endp
;
; #proc_print_str
; save ax
push ax
; print message
mov ah,09
int 21
; restore ax
pop ax
ret
; endp
;
; #start
mov dx,0103 ; OFFSET message1
call near 0111 ; OFFSET proc_print_str_crlf
mov dx,0109 ; OFFSET message2
call near 0111 ; OFFSET proc_print_str_crlf
mov dx,010D ; OFFSET message3
call near 0126 ; OFFSET proc_print_str
; #exit
mov ah,4C
mov al,0
int 21

n printstr.com
r cx
0145
w
q

