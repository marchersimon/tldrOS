void main () {
    char* video_memory = (char*) 0xb8000;
    
    video_memory += 480;  
    
    for (char i = 0; i < 26; i++) {
        video_memory[2*i+4] = 0x50;
    }
    

    video_memory[1] = 'S';
    video_memory[3] = 'u';
    video_memory[5] = 'c';
    video_memory[7] = 'c';
    video_memory[9] = 'e';
    video_memory[11] = 's';
    video_memory[13] = 's';
    video_memory[15] = 'f';
    video_memory[17] = 'u';
    video_memory[19] = 'l';
    video_memory[21] = 'l';
    video_memory[23] = 'y';
    video_memory[25] = ' ';
    video_memory[27] = 'l';
    video_memory[29] = 'o';
    video_memory[31] = 'a';
    video_memory[33] = 'd';
    video_memory[35] = 'e';
    video_memory[37] = 'd';
    video_memory[39] = ' ';
    video_memory[41] = 'k';
    video_memory[43] = 'e';
    video_memory[45] = 'r';
    video_memory[47] = 'n';
    video_memory[49] = 'e';
    video_memory[51] = 'l';
    
    
    
    /*
    for (int i = 0; i < 10; i++) {
        *video_memory = string[i];
        video_memory += 2;
    }*/
}
