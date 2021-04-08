void main () {
    char* video_memory = (char*) 0xb8000;
    
    video_memory += 480;  
    
	
	
    for (char i = 0; i < 26; i++) {
        video_memory[2*i+1] = 0x50;
    }
    
	
    video_memory[0] = 'S';
    video_memory[2] = 'u';
    video_memory[4] = 'c';
    video_memory[6] = 'c';
    video_memory[8] = 'e';
    video_memory[10] = 's';
    video_memory[12] = 's';
    video_memory[14] = 'f';
    video_memory[16] = 'u';
    video_memory[18] = 'l';
    video_memory[20] = 'l';
    video_memory[22] = 'y';
    video_memory[24] = ' ';
    video_memory[26] = 'l';
    video_memory[28] = 'o';
    video_memory[30] = 'a';
    video_memory[32] = 'd';
    video_memory[34] = 'e';
    video_memory[36] = 'd';
    video_memory[38] = ' ';
    video_memory[40] = 'k';
    video_memory[42] = 'e';
    video_memory[44] = 'r';
    video_memory[46] = 'n';
    video_memory[48] = 'e';
    video_memory[50] = 'l';
    
    
    
    /*
    for (int i = 0; i < 10; i++) {
        *video_memory = string[i];
        video_memory += 2;
    }*/
}
