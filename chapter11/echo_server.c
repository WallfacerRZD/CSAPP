#include"socket_funcs.h"

typedef struct sockaddr SA;
void echo(int connfd) {
    size_t n;
    char buf[MAXLEN];
    while ((n = read(connfd, buf, MAXLEN)) != 0) {
        printf("server recevied %d bytes\n", (int)n);
        write(connfd, buf, n);
    }
} 


int main(int argc, char **argv) {
    int listenfd, connfd;
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    char client_hostname[MAXLEN], client_port[MAXLEN];

    if (argc != 2) {
        fprintf(stderr, "args error!\n");
        exit(0);
    }

    listenfd = open_listpfd(argv[1]);
    while (1) {
        clientlen = sizeof(struct sockaddr_storage);
        connfd = accept(listenfd, (SA *)&clientaddr, &clientlen);
        getnameinfo((SA *)&clientaddr, clientlen, client_hostname, MAXLEN, client_port, MAXLEN, 0);
        printf("Connect to (%s %s)\n", client_hostname, client_port);
        echo(connfd);
        close(connfd);
    } 
}
