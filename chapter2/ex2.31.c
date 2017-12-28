#include<stdio.h>

int tadd_ok(int x, int y) {
    int sum = x + y;
    int neg_over = x < 0 && y < 0 && sum >=0;
    int pos_over = x >= 0 && y >= 0 && sum < 0;
    if (neg_over) {
        printf("neg_over! sum-x == %d, y == %d\n", sum-x, y);
    }
    else if (pos_over) {
        printf("pos_over! sum-x == %d, y == %d\n", sum-x, y);
    }
    else {
        printf("no  over! sum-x == %d, y == %d\n", sum-x, y);
    }
}

int main() {
    // neg_over
    tadd_ok(0x80000000, 0x80000000);
    // pos_over
    tadd_ok(0x7fffffff, 0x7fffffff);
    // no over
    tadd_ok(0x80000000, 0x7ffffffe);
    return 0;
}