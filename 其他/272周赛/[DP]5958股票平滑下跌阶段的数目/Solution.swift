/*
 5958. 股票平滑下跌阶段的数目
 https://leetcode-cn.com/problems/number-of-smooth-descent-periods-of-a-stock/
 
 */
class Solution {
    func getDescentPeriods(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [Int](repeating: 0, count: n)
        for i in 0..<n {
            dp[i] += 1
            if i > 0 && prices[i - 1] - prices[i] == 1 {
                dp[i] += dp[i - 1]
            }
        }
        return dp.reduce(0, +)
    }
}
