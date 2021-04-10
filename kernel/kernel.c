char* videoMemory = 0xb8000;
int cursorPosition = 0;

void skipLines(int lines) {
	for(int i = 0; i < lines; i++) {
		cursorPosition += 160;
	}
}

int printf(char* string) {
	for(int i = 0; string[i]; i++) {
		
		if(string[i] == '\n') {
			cursorPosition = (((int) (cursorPosition) + 160 - 1) / 160) * 160;
			continue;
		}
		videoMemory[cursorPosition] = string[i];
		videoMemory[cursorPosition+1] = 0x07;
		cursorPosition += 2;
	}
	return 0;
}

void clearScreen() {
	for(int i = 0; i < 3000 /*4000*/; i++) {
		videoMemory[i] = 0;
	}
	cursorPosition = 0;
}

void main () {
	
	skipLines(3);
	printf("Successfully loaded kernel\n");
	printf("Welcome to tldrOS\n");
	printf("      ___           ___       ___           ___           ___           ___     \n");
	printf("     /\\  \\         /\\__\\     /\\  \\         /\\  \\         /\\  \\         /\\  \\    \n");
	printf("     \\:\\  \\       /:/  /    /::\\  \\       /::\\  \\       /::\\  \\       /::\\  \\   \n");
	printf("      \\:\\  \\     /:/  /    /:/\\:\\  \\     /:/\\:\\  \\     /:/\\:\\  \\     /:/\\ \\  \\  \n");
	printf("      /::\\  \\   /:/  /    /:/  \\:\\__\\   /::\\~\\:\\  \\   /:/  \\:\\  \\   _\\:\\~\\ \\  \\ \n");
	printf("     /:/\\:\\__\\ /:/__/    /:/__/ \\:|__| /:/\\:\\ \\:\\__\\ /:/__/ \\:\\__\\ /\\ \\:\\ \\ \\__\\\n");
	printf("    /:/  \\/__/ \\:\\  \\    \\:\\  \\ /:/  / \\/_|::\\/:/  / \\:\\  \\ /:/  / \\:\\ \\:\\ \\/__/\n");
	printf("   /:/  /       \\:\\  \\    \\:\\  /:/  /     |:|::/  /   \\:\\  /:/  /   \\:\\ \\:\\__\\  \n");
	printf("   \\/__/         \\:\\  \\    \\:\\/:/  /      |:|\\/__/     \\:\\/:/  /     \\:\\/:/  /  \n");
	printf("                  \\:\\__\\    \\::/__/       |:|  |        \\::/  /       \\::/  /   \n");
	printf("                   \\/__/     ~~            \\|__|         \\/__/         \\/__/    \n");

	//clearScreen();
}
