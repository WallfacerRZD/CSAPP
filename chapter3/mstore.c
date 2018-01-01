long mult2(long x, long y);

void multstore(long x, long y, long *dest) {
    long product = x * y;
    *dest = product;
}

int main() {
    return 0;
}