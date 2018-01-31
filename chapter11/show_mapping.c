#include<sys/socket.h>
#include<netdb.h>


int main (int argc, char **argv) {
    struct addrinfo *p, *lisp, hints;

    char buf[MAXLEN];
    int rc, flags;

    if (argc != 2) {
        fprintf(stderr, "args error!\n");
        eixt(0);
    }

    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;

    if ((rc = getaddrinfo(argv[1], NULL, &hints, &listp)) != 0) {
        fprintf(stderr, "getaddrinfo error\n");
        exit(0);
    }

    flags = NI_NUMERICHOST;

    for (p = listp; p; p = p->ai_next) {
        getnameinfo(p->ai_addr, p->ai_addrlen, buf, MAXLEN, NULL, 0, flags);
        printf("%s\n", buf);
    }

    freeaddrinfo(listp);

    exit(0);
}