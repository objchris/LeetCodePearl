/*
440. 字典序的第K小数字
https://leetcode-cn.com/problems/k-th-smallest-in-lexicographical-order/
*/
class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var p = 1
        var prefix = 1
        while p < k {
            let steps = getSteps(prefix, n)
            if p + steps > k {
                p += 1
                prefix *= 10
            } else if p + steps <= k {
                p += steps
                prefix += 1
            }
        }
        return prefix
    }

    func getSteps(_ prefix: Int, _ n: Int) -> Int {
        var steps = 0
        var first = prefix
        var second = prefix + 1
        while first <= n {
            steps += min(n + 1, second) - first
            first *= 10
            second *= 10
        }
        return steps
    }
}
