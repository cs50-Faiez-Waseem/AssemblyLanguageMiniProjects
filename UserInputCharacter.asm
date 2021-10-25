
.model small
.stack 100h
.data
.code
main proc

mov ah,1 ; getting user input
int 21h
;when we take user input value stored into al
;So moving al to data register dl
mov dl , al

mov ah,2  ; printing
int 21h

mov ah ,4ch ;Exiting register
int 21h 
    
    
main endp
end main 
