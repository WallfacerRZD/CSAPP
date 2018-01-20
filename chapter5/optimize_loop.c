#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define OP *
#define IDENT 1
#define N 9999999
typedef double data_t; 

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
    clock_t begin = clock();
    long i;
    *dest = IDENT;
    for (i = 0; i < get_vec_len(v); ++i) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
    clock_t end = clock();
    printf("combine1:%d\n", end-begin);
}

void combine2(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    *dest = IDENT;
    // 避免重复计算len, 但程序的瓶颈并不在此
    long len = get_vec_len(v);
    for (i = 0; i < len; ++i) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
    clock_t end = clock();
    printf("combine2:%d\n", end-begin);
}

data_t* get_vec_start(vec_ptr v) {
    return v->data;
}

void combine3(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    *dest = IDENT;
    long len = get_vec_len(v);
    // 减少过程调用
    data_t *data = get_vec_start(v);
    for (i = 0; i < len; ++i) {
        *dest = *dest OP data[i];
    }
    clock_t end = clock();
    printf("combine3:%d\n", end-begin);
}

void combine4(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    long len = get_vec_len(v);
    data_t *data = get_vec_start(v);
    // 减少内存引用
    data_t acc = IDENT;
    for (i = 0; i < len; ++i) {
        acc = acc OP data[i];
    }
    *dest = acc;
    clock_t end = clock();
    printf("combine4:%d\n", end-begin);
}

void combine4b(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    long len = get_vec_len(v);
    // 减少内存引用
    data_t acc = IDENT;
    for (i = 0; i < len; ++i) {
        if (i >= 0 && i < v->length) {
            acc = acc OP v->data[i];
        }
    }
    *dest = acc;
    clock_t end = clock();
    printf("combine4b:%d\n", end-begin);
}

void combine5(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    long length = get_vec_len(v);
    long limit = length - 1;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    // 循环展开优化
    for (i = 0; i < limit; i += 2) {
        acc = (acc OP data[i]) OP data[i+1];
    }
    for (; i < length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
    clock_t end = clock();
    printf("combine5:%d\n", end - begin);
}

void combine6(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    long length = get_vec_len(v);
    long limit = length - 1;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT, acc1 = IDENT;

    for (i = 0; i < limit; i += 2) {
        acc0 = acc0 OP data[i];
        acc1 = acc1 OP data[i+1];
    }

    for (; i < length; ++i) {
        acc0 = acc0 OP data[i];
    }
    *dest = acc0 OP acc1;
    clock_t end = clock();
    printf("combine6:%d\n", end-begin);
}

void combine7(vec_ptr v, data_t *dest) {
    clock_t begin = clock();
    long i;
    long length = get_vec_len(v);
    long limit = length - 1;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    // 循环展开优化
    for (i = 0; i < limit; i += 2) {
        acc = acc OP (data[i] OP data[i+1]);
    }
    for (; i < length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
    clock_t end = clock();
    printf("combine7:%d\n", end - begin);
}


void minmax1() {
    long a[N];
    long b[N];
    long i;
    srand((unsigned)time(NULL));
    for (i = 0; i < N; ++i) {
        a[i] = rand() % 1000;
    }
    srand((unsigned)time(NULL));
    for (i = 0; i < N; ++i) {
        b[i] = rand() % 1000;
    }
    clock_t begin = clock();
    for (i = 0; i < N; ++i) {
        if (a[i] > b[i]) {
            long temp = a[i];
            a[i] = b[i];
            b[i] = temp;
        }
    }
    clock_t end = clock();
    printf("minmax1:");
    printf("minmax1:%d", end-begin);
}
int main() {
    vec_ptr test_vec = get_new_vec(99999999);
    data_t dest;
    // combine1(test_vec, &dest);
    // combine2(test_vec, &dest);
    // combine3(test_vec, &dest);
    // combine4(test_vec, &dest);
    // combine4b(test_vec, &dest);
    // combine5(test_vec, &dest);
    // combine6(test_vec, &dest);
    // combine7(test_vec, &dest);
    minmax1();
    free(test_vec);
    return 0;
}