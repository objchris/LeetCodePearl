/*
873. 最长的斐波那契子序列的长度
https://leetcode.cn/problems/length-of-longest-fibonacci-subsequence/
https://leetcode.cn/problems/length-of-longest-fibonacci-subsequence/solution/-by-objchris-oqox/
*/
class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        let n = arr.count 
        var dp = [[Int: Int]](repeating:[:], count: n) // last: count
        var ans = 0
        dp[1][arr[0]] = 2
        for i in 2..<n {
            for j in 0..<i {
                if let c = dp[j][arr[i] - arr[j]] {
                    dp[i][arr[j]] = c + 1
                } else {
                    dp[i][arr[j]] = 2
                }
                ans = max(ans, dp[i][arr[j]]!)
            }
        }
        return ans > 2 ? ans : 0
    } 
}
