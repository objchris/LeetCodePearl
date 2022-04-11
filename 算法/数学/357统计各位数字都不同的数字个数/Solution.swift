/*
357. 统计各位数字都不同的数字个数
https://leetcode-cn.com/problems/count-numbers-with-unique-digits/
*/
class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        if n == 0 { return 1 }
        if n == 1 { return 10 }
        var ans = 10, cur = 9
        for i in 0..<n-1 {
            cur *= 9 - i
            ans += cur
        }
        return ans
    }
}
