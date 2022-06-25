/*
剑指 Offer II 091. 粉刷房子
https://leetcode.cn/problems/JEj789/
*/
class Solution {

    func minCost(_ costs: [[Int]]) -> Int {
        let n = costs.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
        dp[0][0] = costs[0][0]
        dp[0][1] = costs[0][1]
        dp[0][2] = costs[0][2]
        for i in 1..<n {
            dp[i][0] = costs[i][0] + min(dp[i - 1][1], dp[i - 1][2])
            dp[i][1] = costs[i][1] + min(dp[i - 1][0], dp[i - 1][2])
            dp[i][2] = costs[i][2] + min(dp[i - 1][0], dp[i - 1][1])
        }
        return dp[n - 1].min()!
    }

}
