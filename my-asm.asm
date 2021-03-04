; Syscall docs I used: https://opensource.apple.com/source/xnu/xnu-1228.0.2/bsd/kern/syscalls.c.auto.html
; https://github.com/apple/darwin-xnu/blob/main/bsd/kern/syscalls.master

global _main
section .text

%define WRITE 0x2000004
%define READ  0x2000003

_print:
  mov rax, WRITE
  mov rdi, 1
  syscall
  ret

_read:
  mov rax, READ
  mov rdi, 0
  mov rdx, 256
  syscall
  ret

_main:
  mov rsi, question
  mov rdx, question.len
  call _print

  mov rsi, name
  call _read

  mov rsi, response
  mov rdx, response.len
  call _print

  mov rsi, name
  mov rdx, 255
  call _print

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

; Some understanding ive gained

; rdi rsi rdx rcx r8 r9 are used instead of stack on machos

; syscall value determined by rax register
; rax is the syscall number (on macos syscalls begin with 20 million or 0x2000000)
; 0x2000004 is a write syscall
; rdi is the write location, 1 being stdout
; $ is location of len, str is location of hello world
; $ - str is the relative position of len minus str which will give the length of the string
; 0x2000001 is the code for exit
; xor rdi, rdi is exlusive-or ie if the two values are the same it will return zero otherwise it will return 1
; rdi, rsi, rdx are arguments for syscalls
