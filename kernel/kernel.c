void skipLines(int lines, char** cursorPosition) {
	for(int i = 0; i < lines; i++) {
		*cursorPosition += 160;
	}
}

int printf(char* string, char** cursorPosition) {
	for(int i = 0; string[i]; i++) {
		**cursorPosition = string[i];
		*cursorPosition += 2;
	}
	return 0;
}

void main () {

	char* cursorPosition = (char*) 0xb8000;
	
	skipLines(2, &cursorPosition);
	
	char b[] = "bcdefgh";
	char c[] = "test2";
	
	printf(b, &cursorPosition);
	
	printf(c, &cursorPosition);
}
