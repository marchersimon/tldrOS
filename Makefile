main:
	nasm src/bootloader/boot.asm -o build/boot.bin
	nasm src/bootloader/kernel_entry.asm -f elf -o build/kernel_entry.o
	/home/simon/opt/cross/bin/i386-elf-gcc -fno-pic -m32 -ffreestanding -c src/kernel/kernel.c -o build/kernel.o
	/home/simon/opt/cross/bin/i386-elf-ld -T ./link.ld #-no-pie -m elf_i386 -o build/kernel.bin -Ttext 0xA000 build/kernel_entry.o build/kernel.o --oformat binary
	cat build/boot.bin build/kernel.bin > os.iso
	truncate -s 1M os.iso # os.iso must not be bigger than 1 MiB
	qemu-system-x86_64 os.iso
