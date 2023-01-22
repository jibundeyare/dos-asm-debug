a
; cmpjmp
;
;           init  => NV UP EI PL NZ NA PO NC
mov ax,2
mov bx,3
cmp ax,bx ; 3 - 2 => NV UP EI NG NZ AC PE CY
mov ax,3
mov bx,2
cmp ax,bx ; 2 - 3 => NV UP EI PL NZ NA PO NC
mov ax,2
mov bx,2
cmp ax,bx ; 2 - 2 => NV UP EI PL ZR NA PE NC
;
; if ax == bx : jne offset_end_if
; if ax != bx : je offset_end_if
; if ax < bx : jnl offset_end_if
; if ax <= bx : jnle offset_end_if
; if ax > bx : jng offset_end_if
; if ax >= bx : jnge offset_end_if
mov ah,4C
mov al,0
int 21

q

