loop: loop.asm
	nasm -f macho64 -o loop.o loop.asm && ld loop.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out && rm a.out && rm loop.o

name: name.asm
	nasm -f macho64 -o name.o name.asm && ld name.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out && rm a.out && rm name.o

triangle: triangle.asm
	nasm -f macho64 -o triangle.o triangle.asm && ld triangle.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out && rm a.out && rm triangle.o

square: square.asm
	nasm -f macho64 -o square.o square.asm && ld square.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./a.out && rm a.out && rm square.o

buildname: name.asm
	nasm -f macho64 -o name.o name.asm && ld name.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie

buildloop:
	nasm -f macho64 -o loop.o loop.asm && ld loop.o -o a.out -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie