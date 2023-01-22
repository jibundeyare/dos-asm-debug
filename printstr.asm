a
; printstr
;
jmp near 0100 ; OFFSET start
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
mov dx,0100 ; OFFSET CR
int 21
; print LF
mov dx,0100 ; OFFSET LF
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
mov dx,0100 ; OFFSET message1
call near 0100 ; OFFSET proc_print_str_crlf
mov dx,0100 ; OFFSET message2
call near 0100 ; OFFSET proc_print_str_crlf
mov dx,0100 ; OFFSET message3
call near 0100 ; OFFSET proc_print_str
; #exit
mov ah,4C
mov al,0
int 21

q

