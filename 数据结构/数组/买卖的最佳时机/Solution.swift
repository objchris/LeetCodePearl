/*
 
 给定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2zsx1/
 
 输入: prices = [7,1,5,3,6,4]
 输出: 7
 
 题解：
    升序的时候，计算相邻两天的差值，这些差值之和即为这一段升序过程中，最高点 - 最低点
    降序的时候，直接赋值给买入点
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        guard prices.count > 0 else {
            return 0
        }
        
        var ans = 0
        var buyIt = prices[0]
        for i in 1 ..< prices.count {
            if buyIt < prices[i] {
                ans += prices[i] - buyIt
            }
            buyIt = prices[i]
        }
        
        return ans
        
    }
}

let s = Solution()
s.maxProfit([])

