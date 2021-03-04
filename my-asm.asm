global _main
section .text

_main:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, str
  mov rdx, str.len
  syscall

  mov rax, 0x2000001
  xor rdi, rdi ; can also do `mov rdi, 0`, if want a 1 exit code then `mov rdi, 1`
  syscall

section .data
str: db "Hello, World!", 10
.len: equ $ - str

; syscall value determined by rax register
; rax is the syscall number (on macos syscalls begin with 20 million or 0x2000000)
; 0x2000004 is a write syscall
; rdi is the write location, 1 being stdout
; $ is location of len, str is location of hello world
; $ - str is the relative position of len minus str which will give the length of the string
; 0x2000001 is the code for exit
; xor rdi, rdi is exlusive-or ie if the two values are the same it will return zero otherwise it will return 1
; rdi, rsi, rdx are arguments for syscalls
