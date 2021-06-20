// 877. Stone Game
// https://leetcode-cn.com/problems/stone-game/
// 关联 486
// 动态规划 DP

/*
 piles[i]: 石头重量
 dp[i][j]: 第 i 到 j 堆石头能赢对手的最大值，dp[i][i] = piles[i]
 dp[i][j] = max(piles[i] - dp[i + 1][j], piles[j] - dp[i][j-1])，其中
    1. piles[i] - dp[i + 1][j]表示：选第i块石头 - 对手从剩下的石头堆中能赢自己的石头最大值
    2. piles[j] - dp[i][j-1]同理

 */

class Solution {
 
    func stoneGame(_ piles: [Int]) -> Bool {
        var dp = Array(repeating: Array(repeating: 0, count: piles.count), count: piles.count)
        for i in 0..<piles.count {
            dp[i][i] = piles[i]
        }
        for i in (0...piles.count - 2).reversed() {
            for j in (i + 1)..<piles.count {
                dp[i][j] = max(piles[i] - dp[i+1][j], piles[j] - dp[i][j-1])
            }
        }
        return dp[0][piles.count - 1] > 0
    }
    
    // 一元数组优化
    func stoneGame_Better(_ piles: [Int]) -> Bool {
        var dp = [Int](repeating: 0, count: piles.count)
        for i in 0..<piles.count {
            dp[i] = piles[i]
        }
        for i in (0...piles.count-2).reversed() {
            for j in i+1..<piles.count{
                dp[j] = max(piles[i] - dp[j], piles[j] - dp[j-1])
            }
        }
        return dp[piles.count-1] > 0
    }
    
//    无脑解
//    基于数学理论，先手都能赢
    func stoneGame_(_ piles: [Int]) -> Bool {
        return true
    }
    
}
