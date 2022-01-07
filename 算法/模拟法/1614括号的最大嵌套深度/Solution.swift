/*
1614. 括号的最大嵌套深度
https://leetcode-cn.com/problems/maximum-nesting-depth-of-the-parentheses/
*/
class Solution {
    func maxDepth(_ s: String) -> Int {
        var t = 0, ans = 0
        for c in s {
            if c == "(" { t += 1 }
            else if c == ")" { 
                ans = max(ans, t)
                t -= 1
            }
        }
        return ans
    }
}
