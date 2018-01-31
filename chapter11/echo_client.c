#include"socket_funcs.h"

int main(int argc, char **argv) {
    int clientfd;
    char *host, *port, buf[MAXLEN];

    if (argc != 3) {
        fprintf(stderr, "args error!\n");
        exit(0);
    }

    host = argv[1];
    port = argv[2];

    clientfd = open_clientfd(host, port);
    while (fgets(buf, MAXLEN, stdin) != NULL) {
        write(clientfd, buf, strlen(buf));
        read(clientfd, buf, MAXLEN);
        fputs(buf, stdout);
    }

    close(clientfd);
    exit(0);
}