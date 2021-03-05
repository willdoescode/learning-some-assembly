global _main
section .text
_main:
  mov rdx, output
  mov r8, 20
  mov r9, 0

  mov r10, 9
  mov r11, 0

setup_hor:
  mov r8, 20
  mov r9, 0
  call horizontal

horizontal:
  mov byte [rdx], '*'
  inc rdx 
  inc r9 
  cmp r9, r8
  jne horizontal

  mov byte [rdx], 10
  inc rdx

  inc r11
  cmp r11, 10
  jne setup_hor
  
done:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, output
  mov rdx, output.len
  syscall

  call _exit

_exit:
  mov rax, 0x2000001
  xor rdi, rdi
  syscall

section .bss
output: resb 210
.len: equ 210
