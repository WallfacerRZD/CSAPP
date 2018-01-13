#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define OP +
#define IDENT 0

typedef long data_t; 
typedef struct {
    data_t *data;
    long length;
} vec, *vec_ptr;

long get_vec_len(vec_ptr p) {
    return p->length;
}

int get_vec_element(vec_ptr p, long index, data_t *dest) {
    if (index < 0 || index >= p->length) {
        return 0;
    }
    *dest = p->data[index];
    return 1;
}

vec_ptr get_new_vec(long len) {
    vec_ptr result = (vec_ptr) malloc(sizeof(vec));
    if (!result) {
        return NULL;
    }
    data_t *data = NULL;
    result->length = len;
    if (len > 0) {
        data = (data_t*) calloc(len, sizeof(data_t));
        if (!data) {
            free((void *)result);
            return NULL;
        }
    }
    result->data = data;
    return result;
}

void combine1(vec_ptr v, data_t *dest) {
    long i;
    *dest = IDENT;
    for (i = 0; i < get_vec_len(v); ++i) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}

void combine2(vec_ptr v, data_t *dest) {
    long i;
    *dest = IDENT;
    // 避免重复计算len, 但程序的瓶颈并不在此
    long len = get_vec_len(v);
    for (i = 0; i < len; ++i) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}


int main() {
    vec_ptr test_vec = get_new_vec(9999999);
    data_t dest;

    clock_t begin = clock();
    combine2(test_vec, &dest);
    clock_t end = clock();

    printf("%d\n", end-begin);
    free(test_vec);
    return 0;
}