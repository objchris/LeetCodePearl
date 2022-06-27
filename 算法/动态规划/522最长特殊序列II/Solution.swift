/*
522. 最长特殊序列 II
https://leetcode.cn/problems/longest-uncommon-subsequence-ii/
*/
class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        let n = strs.count
        var ans = -1
        for i in 0..<n {
            if strs[i].count <= ans { continue }
            var ok = true
            for j in 0..<n where i != j {
                if check(strs[i], strs[j]) {
                    ok = false
                    break
                }
            }
            if ok { ans = strs[i].count }
        }
        return ans
    }

    func check(_ s1: String, _ s2: String) -> Bool {
        // 判断 s1 是不是 s2 的子序列
        var a1 = Array(s1), a2 = Array(s2)
        let n = a1.count, m = a2.count
        if m < n { return false }
        var f = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        for i in 1...n {
            for j in 1...m {
                f[i][j] = a1[i - 1] == a2[j - 1] ? f[i - 1][j - 1] + 1 : f[i - 1][j - 1]
                f[i][j] = max(f[i][j], f[i - 1][j])
                f[i][j] = max(f[i][j], f[i][j - 1])
                if f[i][j] == n { return true }
            }
        }
        return false
    }
}
