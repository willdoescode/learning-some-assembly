global _main
section .text

%define WRITE 0x2000004
%define READ  0x2000003

_main:
  mov rax, WRITE
  mov rdi, 1
  mov rsi, question
  mov rdx, question.len
  syscall

  mov rax, READ
  mov rdi, 0
  mov rsi, name
  mov rdx, 255
  syscall

  mov rax, WRITE
  mov rdi, 1
  mov rsi, response
  mov rdx, response.len
  syscall

  mov rax, WRITE
  mov rdi, 1
  mov rsi, name
  mov rdx, 255
  syscall

  call _exit

_exit:
  mov rax, 0x2000001
  xor rdi, rdi ; can also do `mov rdi, 0`, if want a 1 exit code then `mov rdi, 1`
  syscall

section .data
question: db "What is your name?", 10
question.len: equ $ - question
response: db "Hello "
response.len: equ $ - response

section .bss
name resb 255

; syscall value determined by rax register
; rax is the syscall number (on macos syscalls begin with 20 million or 0x2000000)
; 0x2000004 is a write syscall
; rdi is the write location, 1 being stdout
; $ is location of len, str is location of hello world
; $ - str is the relative position of len minus str which will give the length of the string
; 0x2000001 is the code for exit
; xor rdi, rdi is exlusive-or ie if the two values are the same it will return zero otherwise it will return 1
; rdi, rsi, rdx are arguments for syscalls
