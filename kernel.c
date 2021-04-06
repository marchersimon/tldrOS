void main () {
    char* video_memory = (char*) 0xb8000;
    
    video_memory += 160;    
    *video_memory = 'S';
    video_memory += 2;
    *video_memory = 'u';
    video_memory += 2;
    *video_memory = 'c';
    video_memory += 2;
    *video_memory = 'c';
    video_memory += 2;
    *video_memory = 'e';
    video_memory += 2;
    *video_memory = 's';
    video_memory += 2;
    *video_memory = 's';
    video_memory += 2;
    *video_memory = 'f';
    video_memory += 2;
    *video_memory = 'u';
    video_memory += 2;
    *video_memory = 'l';
    video_memory += 2;
    *video_memory = 'l';
    video_memory += 2;
    *video_memory = 'y';
    video_memory += 2;
    *video_memory = ' ';
    video_memory += 2;
    *video_memory = 'l';
    video_memory += 2;
    *video_memory = 'o';
    video_memory += 2;
    *video_memory = 'a';
    video_memory += 2;
    *video_memory = 'd';
    video_memory += 2;
    *video_memory = 'e';
    video_memory += 2;
    *video_memory = 'd';
    video_memory += 2;
    *video_memory = ' ';
    video_memory += 2;
    *video_memory = 'k';
    video_memory += 2;
    *video_memory = 'e';
    video_memory += 2;
    *video_memory = 'r';
    video_memory += 2;
    *video_memory = 'n';
    video_memory += 2;
    *video_memory = 'e';
    video_memory += 2;
    *video_memory = 'l';
    video_memory += 2;
    
    /*
    for (int i = 0; i < 10; i++) {
        *video_memory = string[i];
        video_memory += 2;
    }*/
}
