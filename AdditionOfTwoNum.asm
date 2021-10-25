  
;Program to add two numbers  
.model small
.stack 100h
.data
.code
main proc

; setting default value in dl to 48  
; because assembler only read the ascii code
mov dl ,48 
mov bl , 2
mov cl ,3

;adding both bl and cl

add bl,cl
;addition value saved to first value  
;adding are addition to older number 48 for making it ascii code
add dl,bl

mov ah,02
int 21h

mov ah,4ch
int 21h    
    
main endp
end main   