#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* reverseWords(char* s) {
    char *result = (char *)malloc(strlen(s));
    const char * split = " ";
    char *p = strtok(s, split);
    while (p != NULL) {
        char *start = p;
        char *end = p + strlen(p) - 1;
        while (p < end) {
            *p ^= *end;
            *end ^= *p;
            *p ^= *end;
            p ++;
            end --;
        }
        strcat(result, start);
        strcat(result, " ");
        p = strtok(NULL, " ");
    }
    char *resulta = result;
    while(*++result);
    result--;
    *result = 0;
    return resulta;
}

int main() {
    char str[] = "Let's take LeetCode contest";
    char * result = reverseWords(str);
    printf(result);
    return 0;
}

