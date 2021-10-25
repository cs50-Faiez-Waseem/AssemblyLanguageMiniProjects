        
; program to print number from 0 to 9

.model small
.stack 100h
.data
.code
main proc


;initialiazing counter 
mov cx ,10

mov dx,48


;create a loop
L1:
mov ah,02
int 21h
;increasing value by 1
add dx,1 




loop L1


mov ah,4ch
int 21h    
    
main endp
end main
        