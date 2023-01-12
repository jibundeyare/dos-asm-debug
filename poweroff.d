a
; power off
; [Making POWEROFF.COM and REBOOT.COM using MS-DOS DEBUG - YouTube](https://www.youtube.com/watch?v=zc-W8xq7L5Q&ab_channel=TylerMitchell)
mov ax,5307
mov bx,1
mov cx,3
int 15

n poweroff.com
r cx
010B
w
q

