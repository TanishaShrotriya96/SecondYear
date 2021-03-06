section .data
	

	msg db "Enter first string: ",0AH
	msglen equ $-msg
	msg1 db "Enter second string: ",0AH
	msg1len equ $-msg1
	;msg2 db "Copied String: ",0AH
	;msg2len equ $-msg2
        msg2 db "Enter offset: ",0AH
	msg2len equ $-msg2

section .bss
offset: resb 2
	str3 : resb 50		;str to be copied in
	name : resb 25
	name1 : resb 25
tlen: resb 3
temp :resb 3

section .text
global _start
_start:
	mov rax,1		;to accept first str, display the msg
	mov rdi,1
	mov rsi,msg
	mov rdx,msglen
	syscall

	mov rax,0		;accept value
	mov rdi,0
	mov rsi,name
	mov rdx,25
	syscall

	mov rax,1		;to accept second str, display the msg
	mov rdi,1
	mov rsi,msg1
	mov rdx,msg1len
	syscall

	
	mov rax,0		;accept value
	mov rdi,0
	mov rsi,name1
	mov rdx,25
	syscall

	mov rax,1		;to accept offset, display the msg
	mov rdi,1
	mov rsi,msg2
	mov rdx,msg2len
	syscall

       mov rax,0		;accept value
	mov rdi,0
	mov rsi,temp
	mov rdx,3
	syscall


mov esi,name	;address of start of string
mov edi,str3 	;address of destination string after copying
;mov cl,[offset]	;counter type variable to count until 7 characters
;mov bx,str3
;--------------------------------offset----------------------------------------------------------
dec al
mov[tlen],al
cmp al,01
je one
mov al,[temp]
sub al,30
mov bl ,[temp+1]
sub bl,30H
mov cl,10
mul cl
add al,bl
jmp next
one: mov al,[temp]
sub al,30H
next:mov [offset],al
;----------------------------------copy from str1------------------------------------------------
mov cl,[offset]
loop:		

	mov al,[esi]	;address of src string
	mov [edi],al	;move from reg to dest index
	inc esi		;to next position in src string
	inc edi		;to next position of dest string
	dec cl		;dec offset from 7 to 6
        
	jnz loop	;jump if cl is nt zero

mov esi,name1

;---------------------------------copy from str2-------------------------------------------------

loop1:

	mov al,[esi]
	cmp al,0AH
	jz skip
	mov [edi],al
	inc esi
	inc edi
        
	jmp loop1

skip:
	mov rax,1		;to display the copied string
	mov rdi,1
	mov rsi,str3
	mov rdx,50
	syscall

	mov rax,60
	mov rdi,0
	syscall

;---------------------------------accept from user------------------------------------------------

