// 877. Stone Game
// 关联 486
// 动态规划 DP
class Solution {
    
    // Wrong answer
    // [3,2,10,4] expect true, but return false
    func stoneGame_Wrong(_ piles: [Int]) -> Bool {
        var result = Array(repeating: 0, count: 2)
        var left = 0
        var right = piles.count - 1
        var counter = 0
        while left < right {
            if piles[left] > piles[right] {
                result[counter % 2] += piles[left]
                left += 1
            } else {
                result[counter % 2] += piles[right]
                right -= 1
            }
            counter += 1
        }
        return result[0] > result[1]
        
    }
 
    
    func stoneGame_Correct(_ piles: [Int]) -> Bool {
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
