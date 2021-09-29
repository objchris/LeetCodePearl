/*
 650. 只有两个键的键盘
 https://leetcode-cn.com/problems/2-keys-keyboard/
 */
class Solution {
    func minSteps(_ n: Int) -> Int {
        if n <= 1 { return 0 }
        var n = n
        var ans = 0
        for i in 2...n {
          if n % i == 0 {
            ans += i
            ans += minSteps(n / i)
            break
          }
        }
        return ans
    }
}
