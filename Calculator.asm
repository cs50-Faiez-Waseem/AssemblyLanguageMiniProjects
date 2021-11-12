            .model small
.stack 100h

.data
msg1    db 13, 10, 13, 10,"MENU "
        db 10, 13,"1. Add   "
        db 10, 13,"2. Subtract "
        db 10, 13,"3. Multiply "
        db 10, 13,"4. Divide "
        db 10, 13,"5. Exit "
        db 13,10,13,10, "Enter 1st Number : $"
msg2 db 13,10, "Enter 2nd Number : $"
msgEr db 13,10, "Error $"
choiceseu db 13,10, "Enter choice: $ "
sumseu db 13,10,13,10, "***Sum is : $"
Diffseu db 13,10,13,10, "***Difference is : $"
Divseu db 13,10,13,10, "***Quotient is : $"
Mulseu db 13,10,13,10, "***Product is : $"
temp     db ?


.code

start:
mov ax, @data
mov ds, ax

lea dx, msg1
mov ah, 09h
int 21h
mov bx, 0

ph1:
mov ah, 01h
int 21h
cmp al,0dh ;comparing if user pressed enter     
je input1
mov ah,0        
sub al,30h      
push ax         
mov ax,10d      
mul bx          
pop bx          
add bx,ax       
jmp ph1      




input1:
push bx
lea dx,msg2
mov ah,09h
int 21h

mov bx,0


ph2:
mov ah,01h
int 21h
cmp al,0dh
je choice
mov ah,0
sub al,30h
push ax
mov ax,10d
mul bx
pop bx
add bx,ax 
jmp ph2


choice:
lea dx, choiceseu
mov ah, 09h
int 21h

mov ah, 01h
int 21h


cmp al,'4'
je divd

cmp al,'1'  
je addz

cmp al,'2'
je subt

cmp al,'3'
je mult

cmp al,'5'
mov ah, 4ch
int 21h

error:
lea dx,msgEr
mov ah,09h
int 21h 
jmp start


divd: 
pop ax
mov dx, 0
div bx
push ax
lea dx,Divseu
mov ah,09h
int 21h 
pop ax
mov cx,0
mov dx,0
mov bx,10d
jmp wrong

addz:     
pop ax
add ax,bx   
push ax
lea dx,sumseu   
mov ah,09h
int 21h 
pop ax
mov cx,0
mov dx,0
mov bx,10d
jmp wrong   

mult: 
pop ax
mul bx      
push ax     
lea dx,Mulseu   
mov ah,09h
int 21h 
pop ax
mov cx,0
mov dx,0
mov bx,10d
jmp wrong


subt: 
pop ax
sub ax,bx 
push ax
lea dx,Diffseu
mov ah,09h
int 21h 
pop ax
mov cx,0
mov dx,0
mov bx,10d

wrong:
mov dx, 0
div bx
push dx
mov dx,0
inc cx
or ax,ax 
jne wrong 

ans:        
pop dx
add dl,30h
mov ah,02h
int 21h
loop ans

jmp start



end start