
;Program to print a pyramid using nested loop

.model small
.stack 100h
.data
.code   
main proc   
    
mov bx ,1
mov cx,5   
;outer loop
l1:
push cx
mov cx,bx 
;inner loop 
l2:
mov dx,"*"
call print  
    
loop l2

call newline  
inc bx
pop cx
loop l1


mov ah,4ch
int 21h   
    
    
print:
mov ah,2
int 21h  
ret

newline:
mov dl,0ah
int 21h
mov dl,0dh
int 21h
ret  
         

main endp
end main