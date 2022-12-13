nasm -f elf64 -o $1.o $1.asm
c99 -O2 -c -o $1_wrapper.o $1_wrapper.c
c99 -o $1 $1_wrapper.o $1.o 
./$1 $2 $3