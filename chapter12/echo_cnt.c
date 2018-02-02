#include<pthread.h>

static int byte_cnt;
static sem_t mutex;

static void int_echo_cnt(void) {
    sem_init(&mutex, 0, 1);
    byte_cnt = 0;
}

void echo_cnt(int connfd) {
    int n;
    char buf[MAXLINE];
    static pthread_once_t once = PTHREAD_ONCE_INIT;

    pthread_once(&once, init_echo_cnt);
    while ((n = read(connfd, buf, MAXLINE)) != 0) {
        sem_wait(&mutex);
        byte_cnt += n;
        printf("server received %d (%d total) bytes ont fd %d\n", n, byte_cnt, connfd);
        sem_post(&mutex);
        write(connfd, buf, n);
    }
}