/*
241. 为运算表达式设计优先级
https://leetcode.cn/problems/different-ways-to-add-parentheses/
*/
class Solution {
    var arr: [Character]!

    func diffWaysToCompute(_ expression: String) -> [Int] {
        arr = Array(expression)
        return dfs(0, arr.count - 1)
    }

    func dfs(_ l: Int, _ r: Int) -> [Int] {
        var ans = [Int]()
        for i in l...r {
            if arr[i].isNumber { continue }
            let l1 = dfs(l, i - 1), l2 = dfs(i + 1, r)
            for a in l1 {
                for b in l2 {
                    var cur = 0
                    if arr[i] == "+" { cur = a + b }
                    else if arr[i] == "-" { cur = a - b }
                    else { cur = a * b }
                    ans.append(cur)
                }
            }
        }
        if ans.isEmpty {
            ans.append(Int(String(arr[l...r]))!)
        }
        return ans
    }
}

