#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<errno.h>
#include<string.h>

pid_t Fork() {
    pid_t pid;
    if ((pid = fork()) < 0 ) {
        fprintf(stderr, "fork error: %s\n", strerror(errno));
        exit(0);
    }
    return pid;
}
int main () {
    pid_t pid;
    int x = 1;
    pid = Fork();
    if (pid == 0) {
        printf("child : x = %d\n", --x);
    }
    printf("parent : x = %d\n", ++x);
    return 0;
}
