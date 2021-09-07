/*
 1221. 分割平衡字符串
 https://leetcode-cn.com/problems/split-a-string-in-balanced-strings/
 */
class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        let arr = Array(s)
        var ans = 0
        var count = 0
        for c in s {
            if c == "R" {
                count += 1
            } else {
                count -= 1
            }
            if count == 0 {
                ans += 1
            }
        }
        return ans
    }
}
