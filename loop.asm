global _main
section .text

%define WRITE 0x2000004 
%define EXIT  0x2000001
%define ENDL  10

print:
  mov rax, WRITE
  mov rdi, 1
  syscall
  ret

exit:
  mov rax, EXIT
  xor rdi, rdi
  syscall

_main:
  mov r8, 10
  mov r9, 1

start_loop:
  cmp r8, r9
  jle exit_loop

  mov rsi, x
  mov rdx, x.len
  call print

  inc r9
  jmp start_loop

exit_loop:
  mov rsi, second
  mov rdx, second.len
  call print

  call exit

section .data
x: db "Inside of the loop", ENDL
.len: equ $ - x
numberFormat: db '%d', 10, 0

second: db "Out of the loop now", ENDL
.len: equ $ - second