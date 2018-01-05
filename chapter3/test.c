int foo(int x, int *y) {
    int m = bar(x);
    return x + *y;
}

int bar(int x) {
    return x;
}

int main() {
    int x = 0;
    int y = 0;
    int z = foo(x, &y);
    return 0;
}
