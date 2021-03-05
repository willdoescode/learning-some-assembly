global _main
section .text
_main:
  mov rdx, output
  mov r8, 1
  mov r9, 0
line:
  mov byte [rdx], '*' 
  inc rdx 
  inc r9 
  cmp r9, r8
  jne line 
lineDone:
  mov byte [rdx], 10 
  inc rdx
  inc r8 
  mov r9, 0                   
  cmp r8, linewidth
  jng line 
done:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, output
  mov rdx, outputsize
  syscall

  mov rax, 0x2000001
  xor rdi, rdi
  syscall

section .bss
linewidth: equ 8
outputsize: equ 44
output: resb outputsize
