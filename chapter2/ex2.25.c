#include<stdio.h>

int main() {
    int i;
    unsigned length = 0;
    // length永远为正数导致死循环
    for (i = 0; i <= length-1; ++i) {
        printf("infinite loop!!\n");
    }
    return 0;
}