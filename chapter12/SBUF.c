#include"SBUF.h"

void sbuf_init(sbuf_t *sp, int n) {
    sp->buf = calloc(n, sizeof(sbuf_t));
    sp->n = n;
    sp->front = sp->rear = 0;
    sem_init(&sp->mutex, 0, 1);
    sem_init(&sp->slots, 0, n);
    sem_init(&sp->items, 0, 0);
}

void sbuf_deinit(sbuf_t *sp) {
    free(sp->buf);
}

void sbuf_insert(sbuf_t *sp, int item) {
    sem_wait(&sp->slots);
    sem_wait(&sp->mutex);
    sp->buf[(++sp->rear) % sp->n] = item;
    sem_post(&sp->mutex);
    sem_post(&sp->items);
}

int sbuf_remove(sbuf_t *sp) {
    int item;
    sem_wait(&sp->items);
    sem_wait(&sp->mutex);
    item = sp->buf[(++sp->front) % sp->n];
    sem_post(&sp->mutex);
    sem_post(&sp->slots);
    return item;
}