Learning some x86_64 asm for macos (this is macos syscalls so not compatible with linux)

Running
```shell
nasm -f macho64 my-asm.asm && gcc my-asm.o && ./a.out
```