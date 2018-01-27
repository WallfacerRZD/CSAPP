/*
* 简单shell
* OS: Linux
*/

#include "csapp.h"
#define MAXARGS 128

int builtin_command(char **argv) {
    if (!strcmp(argv[0], "quit")) {
        exit(0);
    }
    if (!strcmp(argv[0], "&")) {
        return 1;
    }
    return 0;       //not a builtin command
}

int parseline(char *buf ,char **argv) {
    char *delim;
    int argc;
    int bg;

    buf[strlen(buf)-1] = ' ';
    // 去掉开头的空格
    while(*buf && (*buf == ' ')) {
        buf++;
    }

    //构造argv
    argc = 0;
    while( ( delim = strchr(buf, ' ') ) ) {
        argv[argc++] = buf;
        *delim = '\0';
        buf = delim + 1;
        while(*buf && (*buf == ' ')){
            buf++;
        }
    }

    argv[argc] = NULL;

    if (argc == 0) {
        return 1;
    }

    if ( ( bg = (*argv[argc-1] == '&') ) != 0 ) {
        argv[--argc] == NULL;
    }

    return bg;
}

void unix_error(char *msg) /* Unix-style error */ {
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}

char *Fgets(char *ptr, int n, FILE *stream) {
    char *rptr;

    if ( (rptr = fgets(ptr, n, stream) ) == NULL) {
        return rptr;
    }
}

pid_t Fork(void) {
    pid_t pid;

    if ((pid = fork()) < 0)
	unix_error("Fork error");
    return pid;
}


int main() {

    char cmdline[MAXARGS];

    while(1) {
        printf(">");
        Fgets(cmdline, MAXLINE, stdin);
        if (feof(stdin)) {
            exit(0);
        }
        eval(cmdline);
    }
}

void eval(char *cmdline) {
    char *argv[MAXARGS];
    char buf[MAXLINE];
    int bg;
    pid_t pid;

    strcpy(buf, cmdline);
    bg = parseline(buf, argv);
    if (argv[0] == NULL) {
        return;
    }
    if(!builtin_command(argv)) {
        if ((pid = Fork()) == 0) {
            if (execve(argv[0], argv, environ) < 0) {
                printf("%s: Command not found.\n", argv[0]);
                exit(0);
            }
        }
    }
    if (!bg) {
        int status;
        if (waitpid(pid, &status, 0) < 0) {
            unix_error("waitfg: waitpid error");
        }
    }
    else {
        printf("%d %s", pid, cmdline);
    }
}