/*
 [DP]446. 等差数列划分 II - 子序列
 https://leetcode-cn.com/problems/arithmetic-slices-ii-subsequence/
 */

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {

        // dp[i]{d: cnt}
        let n = nums.count
        var dp = [[Int: Int]]()
        for i in nums.indices {
            var dic = [Int: Int]()
            for j in 0 ..< i {
                let d = nums[i] - nums[j]
                let prev = dp[j]
                var cnt = dic[d, default: 0]
                cnt += prev[d, default: 0]
                cnt += 1
                dic[d] = cnt
            }
            dp.append(dic)
        }

        var ans = 0
        for i in dp.indices {
            let dic = dp[i]
            for (_ , v) in dic {
                ans += v
            }
        }
        let cnt = n * (n - 1) / 2
        return ans - cnt
    }
}

let s = Solution()
s.numberOfArithmeticSlices([2,4,6,8,10])

