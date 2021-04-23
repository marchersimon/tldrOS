all: compile
	qemu-system-x86_64 os.iso

compile: bootloader
	/home/simon/opt/cross/bin/i386-elf-gcc -fno-pic -m32 -ffreestanding -c src/kernel/kernel.c -o build/kernel.o
	/home/simon/opt/cross/bin/i386-elf-gcc -fno-pic -m32 -ffreestanding -c src/kernel/stdio.c -o build/stdio.o
	/home/simon/opt/cross/bin/i386-elf-ld -T ./link.ld
	cat build/boot.bin build/kernel.bin > os.iso
	truncate -s 1M os.iso # os.iso must not be bigger than 1 MiB
	
bootloader:
	nasm src/bootloader/boot.asm -o build/boot.bin
	nasm src/bootloader/kernel_entry.asm -f elf -o build/kernel_entry.o
	
run:
	qemu-system-x86_64 os.iso

	
clean:
	rm build/*
	rm os.iso
