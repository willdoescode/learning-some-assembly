loop: loop.asm
	nasm -f macho64 -o loop.o loop.asm && ld loop.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out

name: name.asm
	nasm -f macho64 -o name.o name.asm && ld name.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out