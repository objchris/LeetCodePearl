/*
479. 最大回文数乘积
https://leetcode-cn.com/problems/largest-palindrome-product/
*/
class Solution {
    func largestPalindrome(_ n: Int) -> Int {
        if n == 1 { return 9 }
        let upper = Int(pow(Double(10), Double(n)) - 1)
        for left in (0...upper).reversed() {
            var p = left, x = left
            while x > 0 {
                p = p * 10 + x % 10
                x /= 10
            }
            x = upper
            while x * x > p {
                if p % x == 0 {
                    return p % 1337
                }
                x -= 1
            }
        }
        return 0
    }
}
