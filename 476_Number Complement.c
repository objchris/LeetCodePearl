// =================== 476. Number Complement =====================
/*
 * Input: 5
 * Output: 2
 * Explanation: The binary representation of 5 is 101 (no leading zero bits),
 * and its complement is 010. So you need to output 2.
 */
// 总结此题:
// 1、使用unsigned就不需要担心位运算带来的补位问题
// 2、~ 这个取反运算

// My First Solution
#include <math.h>
int findComplement(int num) {
    for (int i = 1; i <= 32; ++i) {
        if(num <= pow(2,i) - 1) {
            return num ^ ((int)pow(2,i) - 1);
        }
    }
}

// Fast Solution
int findComplement(int num) {
    // 使用unsigned就不需要担心位运算带来的补位问题
    // · ((unsigned)~0) >> 1 == 01111111111111111111111111111111
    // · ~0 >> 1             == 11111111111111111111111111111111
    unsigned mask = ~0;
    while (num & mask) mask <<= 1;
    return ~mask & ~num;
}