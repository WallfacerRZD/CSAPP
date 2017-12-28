#include<stdio.h>
#include<string.h>

int strlonger(const char *s, const char *t) {
    // 当s比t长时出现bug
    return strlen(s) - strlen(t) > 0;
    // return strlen(s) > strlen(t);
}

int main(){
    const char *str1 = "test";
    const char *str2 = "testtest";
    printf("%d", strlonger(str1, str2));
    return 0;
}