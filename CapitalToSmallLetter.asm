
; Program to convert capital letter to small letter

.model small
.stack 100h
.data
.code
main proc

; taking value from user  
mov ah,1
int 21h
;moving value to data register
mov dl,al 

add dl,32

mov ah,2 
int 21h

mov ah,4ch
int 21h

main endp
end main