
.model small
.stack 100h
.data  
new_line db 0AH,0DH,"$"

.code
main proc 
    
 mov ax,@data
 mov ds,ax
 
mov dl, 'A'
mov ah, 02
int 21h

call newLine

mov dl, 'B'
mov ah, 02
int 21h  

call newLine

mov dl, 'C'
mov ah, 02
int 21h  
         
         
mov ah,4ch
int 21h  


newLine:
lea dx,new_line
mov ah,09
int 21h
ret
       
 
main endp 
end main 