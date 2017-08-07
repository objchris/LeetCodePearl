#include <stdio.h>
#include <math.h>

int findComplement(int num) {
    for (int i = 1; i <= 32; ++i) {
        if(num <= pow(2,i) - 1) {
            return num ^ ((int)pow(2,i) - 1);
        }
    }
}

int main() {
    int i = findComplement(1);
    printf("%d",i);
    return 0;
}

