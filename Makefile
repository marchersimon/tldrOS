main:
	nasm boot.asm -o boot.bin
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
	cat boot.bin kernel.bin > os.iso
	truncate -s 1M os.iso #os.iso must not be greater than 
	qemu-system-x86_64 os.iso
