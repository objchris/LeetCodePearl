//
// 此题通过自己的解题方法学习到了strtok的使用方式
// 复习了使用三次 ^= 能达到交换的方法
// 总结：能少创建内存空间尽量少创建
// Created by Chris Cheung on 2017/8/21.
//
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// My Solution
// 这样的解决方式欠妥，原因在于代码中会再创建内存。
// 如果遇到特别长的字符串，会有问题
// 使用strtok会破坏原有字符串char *s,使其中的" "变成"\0"
// 这样不得不在最后又对result再做一次trim的操作，实在不好。
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
    result[strlen(result) - 1] = 0;
    return result;
}

// Good Solution
// 直接对传入的char *s做操作，免去了内存的创建。
void reverse(int b, int e, char *s){
    while(b < e) {
        s[b] = s[b] ^ s[e];
        s[e] = s[b] ^ s[e];
        s[b] = s[b] ^ s[e];
        b++;
        e--;
    }
}

char* reverseWords2(char* s) {
    int i, s_len = strlen(s), index = 0;

    for(i = 0; i <= s_len; i++) {
        if((s[i] == ' ') || (s[i] == '\0')){
            reverse(index, i - 1, s);
            index = i + 1;
        }
    }
    return s;
}