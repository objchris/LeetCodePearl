/*
172. 阶乘后的零
https://leetcode-cn.com/problems/factorial-trailing-zeroes/
*/
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var ans = 0
        for i in stride(from: 5, through: n, by: 5) {
            var x = i
            while (x % 5) == 0 {
                ans += 1
                x /= 5
            }
        }
        return ans
    }
}
