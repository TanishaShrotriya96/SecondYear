section .data
var1 db 40
var2 db 20
section .text
global _start
_start:
mov eax,var1
mov ebx,var2
cmp eax,ebx
jz same
jc gr2
jmp next
same:
mov dl,01
jmp end
gr2:
mov dl,02
jmp end
next:
mov dl,03
end:
mov rax,60
mov rdi,0
syscall

