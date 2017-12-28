#include<stdio.h>

int uadd_ok(unsigned x, unsigned y) {
    unsigned sum = x + y;
    int over = sum < x || sum < y;
    return over;
}

int main() {
    printf("%d", uadd_ok(0x55555555, 0x55555555));
    return 0;
}