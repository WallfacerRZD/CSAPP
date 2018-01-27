/*
 * 捕获Ctrl + C
 * OS: Linux
 */

#include<signal.h>
#include<stdlib.h>
#include<stdio.h>

void sigint_handler(int sig) {
    printf("catch signal!\n");
    exit(0);
}


int main() {
    signal(SIGINT, sigint_handler);
    pause();
    return 0;
}