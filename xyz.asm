print macro p1
mov dx , offset p1
mov ah , 09
int 21h
endm

p macro p1
mov dl , p1
mov ah , 02
int 21h
endm

.model small
.stack 100h
.data
   str db 100 dup(?)
   x2 db "Enter Counter for Loop To Run : $"
   ArrAdd db "Addition of index 0  and 1  :  $"
   ArrSub db "Subtraction of Index 2 and 3 :  $"
   ArrMul db "Multiplication of Index 4 and 5 :  $"
   new_line db 0AH,0DH,"$" 
   valueMsg db "Value At Index : $"
   index db 0
.code

main proc

mov ax , @data
mov ds, ax


print x2
InputStringEnd: 
;taking Input
mov ah ,1
int 21h
; subtracting 48 to convert to real number
; example user input 5 we get ascii 53
; so 53 - 48 = 5
sub al , 48     
; making ah register 0
xor ah , ah

;so now  ax have value 5 
; moving it to counter reg
mov cx , ax
; getting first index of arr
mov si, offset str  

printLoop:
print new_line 
print valueMsg 
mov bl , index
add bl ,48
p bl
p " "
p ":"
p " "
mov ah,1
int 21h   
sub al ,48
mov [si],al
inc si  
inc index

loop printLoop


Part2:
call ArrayAdd
call ArraySub
call ArrayMul 
call End

 
ArrayAdd: 
mov si ,  offset str
mov cl ,[si]
mov bl , [si + 1]  
add bl , cl
print new_line 
add bl, 48  
print ArrAdd
p bl
ret 


ArraySub: 
mov si ,  offset str
mov cl ,[si + 2]
mov bl , [si + 3]  
sub cl , bl
print new_line
add cl , 48 
print ArrSub
p cl
ret  

ArrayMul:  
print new_line
mov si ,  offset str
mov ax , [si + 4]
mov bl , [si + 5]
mul bl
mov bl , al
add bl , 48 
print ArrMul
p bl
ret


End:
mov ah,4ch
int 21h

main endp
end main