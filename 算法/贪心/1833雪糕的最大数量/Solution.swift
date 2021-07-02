/*
 [贪心]1833雪糕的最大数量
 https://leetcode-cn.com/problems/maximum-ice-cream-bars/
 */
class Solution {
    /*
     转换为01背包为题
     d[i][j]: 前i个物品总花费为j,能获得的最大数量
     d[i][j] = d[i-1][j]                (i 不选)
             = 1 + d[i][j - costs[i]]   (i选）
     
     d[i][j] = max(d[i-1][j], d[i][j - costs[i]] + 1)
     
     * 对于本题的数据来说，会导致TimeLimited
     1 <= n <= 10^5, 1 <= coins <= 10^8
     时间复杂度 O(n*m)
     */
    func maxIceCream_TimeLimited(_ costs: [Int], _ coins: Int) -> Int {
        
        var d = [Int](repeating: 0, count: coins + 1)
    
        for i in 0..<costs.count {
            if costs[i] > coins {
                continue
            }
            for j in (costs[i]...coins).reversed() {
                d[j] = max(d[j], d[j - costs[i]] + 1)
            }
        }
        
        return d[coins]
    }
    
    // 排序+贪心
    // 时间复杂度 O(n*logn)，取决于排序算法的时间复杂度
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let sortedCosts = costs.sorted()
        var c = coins
        var ans = 0
        
        for i in sortedCosts {
            if c >= i {
                c -= i
                ans += 1
            } else {
                break
            }
        }
        return ans
    }

}

let s = Solution()
s.maxIceCream([10,6,8,7,7,8], 5)
