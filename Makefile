main:
	nasm boot.asm -o build/boot.bin
	gcc -ffreestanding -c kernel.c -o build/kernel.o
	ld -o build/kernel.bin -Ttext 0x1000 build/kernel.o --oformat binary
	cat build/boot.bin build/kernel.bin > os.iso
	truncate -s 1M os.iso # os.iso must not be bigger than 1 MiB
	qemu-system-x86_64 os.iso
