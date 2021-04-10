char* cursorPosition = (char*) 0xb8000;
int x = 4;

void skipLines(int lines) {
	for(int i = 0; i < lines; i++) {
		cursorPosition += 160;
	}
}

int printf(char* string) {
	for(int i = 0; string[i]; i++) {
		*cursorPosition = string[i];
		cursorPosition += 2;
	}
	return 0;
}

void main () {
	
	skipLines(3);
	
	char b[] = "Successfully loadad";
	char c[] = " kernel";
	
	printf(b);
	
	printf(" kernel");

}
