ENTRY(entry)

OUTPUT_FORMAT(binary)

SECTIONS {
	. = 0xA000;
	.text : ALIGN(0x1000) {
		*(.text)
	}
	.data : ALIGN(0x1000) {
		*(.data)
	}
	.bss : ALIGN(0x1000) {
		*(.bss)
	}
}

INPUT(build/kernel_entry.o build/kernel.o)

OUTPUT(build/kernel.bin)
