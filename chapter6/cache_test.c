#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define N 9999
void foo1(long a[][N]) {
    long i, j, sum = 0;
    clock_t begin = clock();
    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            sum += a[i][j];
        }
    }
    clock_t end = clock();
    printf("i-j: %d\n", end-begin);
}

void foo2(long a[][N]) {
    long i, j, sum = 0;
    clock_t begin = clock();
    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            sum += a[j][i];
        }
    }
    clock_t end = clock();
    printf("j-i: %d\n", end-begin);
}

long a[N][N];
int main() {
    foo1(a);
    foo2(a);
    return 0;
}