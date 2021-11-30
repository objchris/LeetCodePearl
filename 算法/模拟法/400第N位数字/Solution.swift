/*
400. 第 N 位数字
https://leetcode-cn.com/problems/nth-digit/

1. 1-9，总共有 1 * 9 = 9 位
2. 10-99，总共有 2 * 90 = 180 位
3. 100-999，总共有 3 * 900 = 2700 位
以此类推

解本题需要：
1. 先找出 n 位对应的数是多少
2. 再找出结果处于该数的第几位
*/
class Solution {
    func findNthDigit(_ n: Int) -> Int {
        var cur = 1, base = 9, n = n
        while n > cur * base {
            n -= cur * base
            cur += 1
            base *= 10
        }
        n -= 1
        // 找出该数 10^(cur - 1) + n / cur
        var num = Int(pow(10.0, Double(cur - 1))) + n / cur
        // 要找的结果位于 num 的第几位
        let idx = n % cur
        // 取出 num 的第 idx 位
        return num / Int(pow(10.0, Double(cur - 1 - idx))) % 10
    }
}
