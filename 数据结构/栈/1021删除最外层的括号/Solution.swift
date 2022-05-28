/*
1021. 删除最外层的括号
https://leetcode.cn/problems/remove-outermost-parentheses/
*/
class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var stack = [Int]()
        var arr = Array(s)
        var ans = ""
        for i in arr.indices {
            if arr[i] == ")" {
                stack.popLast()
            } 
            if !stack.isEmpty {
                ans += String(arr[i])
            }
            if arr[i] == "(" {
                stack.append(i)
            }
        }
        return ans
    }
}
