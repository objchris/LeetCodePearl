void c_swap(char *left, char *right) {
    char temp = *left;
    *left = *right;
    *right = temp;
}

void deleteDuplicateSpace(char *s) {
    char *p = s;
    char *q = s;
    while(*q) {
        if(!(isspace(*q) && isspace(*(q+1)))) {
            *p++ = *q;
        }
        q++;
    }
    *p = '\0';
}

void c_reverse(char *s, int start, int end) {
    end--;
    while(start < end) {
        c_swap(&s[start++], &s[end--]);
    }
}

char * reverseWords(char * s){
    if(s == 0 || *s == '\0') {
        return s;
    }
    while (isspace(*s)) {
        s++;
    }
    char *p = s + strlen(s) - 1;
    while (p >= s && isspace(*p)) {
        *p = '\0';
        --p;
    }
    deleteDuplicateSpace(s);
    int len = strlen(s);
    c_reverse(s, 0, len);
    int start = 0;
    for (int end=0; end < strlen(s); end++) {
        if(isspace(s[end])) {
            c_reverse(s, start, end);
            start = end + 1;
        }
    }
    c_reverse(s,start, strlen(s));
    return s;
}

