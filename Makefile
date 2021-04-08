main:
	nasm boot.asm -o build/boot.bin
	nasm kernel_entry.asm -f elf -o build/kernel_entry.o
	gcc -fno-pie -m32 -ffreestanding -c kernel.c -o build/kernel.o
	ld -m elf_i386 -o build/kernel.bin -Ttext 0x1000 build/kernel_entry.o build/kernel.o --oformat binary
	cat build/boot.bin build/kernel.bin > os.iso
	truncate -s 1M os.iso # os.iso must not be bigger than 1 MiB
	qemu-system-x86_64 os.iso
