char* videoMemory = 0xb8000;
int cursorPosition = 0;
char fontColor = 0x07;

enum attributeColor{black, blue, green, cyan, red, purple, brown, gray, darkGray, lightBlue, lightGreen, lightCyan, lightRed, lightPurple, yellow, white};

int printf(char* string) {
	for(int i = 0; string[i]; i++) {
		
		if(string[i] == '\n') {
			cursorPosition = (((int) (cursorPosition) + 160 - 1) / 160) * 160;
			continue;
		}
		videoMemory[cursorPosition] = string[i];
		videoMemory[cursorPosition+1] = fontColor;
		cursorPosition += 2;
	}
	return 0;
}

void skipLines(int lines) {
	for(int i = 0; i < lines; i++) {
		cursorPosition += 160;
	}
}

void clearScreen() {
	for(int i = 0; i < 3000; i++) {
		videoMemory[i] = 0;
	}
	cursorPosition = 0;
}

void setFontColor (char foregroundColor, char backgroundColor) {
	fontColor = foregroundColor | (backgroundColor << 4);
}

void bootMsg(int status, char* msg) {
	switch(status) {
		case 0:
			fontColor = 0x07;
			printf("[  ");
			fontColor = 0x02;
			printf("OK");
			fontColor = 0x07;
			printf("  ] ");
			break;
		case 1:
			fontColor = 0x07;
			printf("[");
			fontColor = 0x04;
			printf("FAILED");
			fontColor = 0x07;
			printf("] ");
			break;
	}
	printf(msg);
	printf("\n");
}
