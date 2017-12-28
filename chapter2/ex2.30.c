#include<stdio.h>

int tadd_ok(int x, int y) {
    int sum = x + y;
    int neg_over = x >= 0 && y >= 0 && sum < 0;
    int pos_over = x < 0 && y < 0 && sum >= 0;
    return !neg_over && ! pos_over;
}
int main() {
    printf("%d", tadd_ok(0xf0000000, 0x70000000));
    return 0;
}