/*
689. 三个无重叠子数组的最大和
https://leetcode-cn.com/problems/maximum-sum-of-3-non-overlapping-subarrays/

前缀和 + 序列DP

1、定义：dp[i][j] 为考虑前 i 个数，凑成无重叠子数组数量为 j 个时的最大值。
2、转换方程：
    dp[i][j] = dp[i - 1][j] ，不选择 nums[i] 的情况
    dp[i][j] = dp[i - k][j - 1] ， 选择 nums[i] 的情况，因为题目要求子数组不能重叠
    max 取二者中的大值
3、dp[n - 1][3] 即为最大和
4、进行反向回溯，即可求得结果

使用前缀和可以快速运算出子数组的和
*/
class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var nums = Array(nums.reversed())
        var sums = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            // 前缀和
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        // dp[i][j]: 定义 dp[i][j] 为考虑前 i 个数，凑成无重叠子数组数量为 j 个时的最大值。
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n + 10)
        for i in k...n {
            for j in 1..<4 {
                dp[i][j] = max(dp[i - 1][j], dp[i - k][j - 1] + sums[i] - sums[i - k])
            }
        }
        // 求得最大值后进行回溯
        // 若 dp[i - 1][j] == dp[i - k][j - 1] + sums[i] - sums[i - k]， 
        // 即 dp[i - 1][j] 是由 dp[i - k][j - 1] + sums[i] - sums[i - k] 转换而来， i - k 就是其中一个结果值
        // 但这样求得的结果是字典序最大的结果，因此需要在一开始对 nums 进行反序，最大的下标反过来就是最小的下标
        var ans = [Int]()
        var i = n, j = 3, index = 0
        while j > 0 {
            if dp[i - 1][j] > dp[i - k][j - 1] + sums[i] - sums[i - k] {
                i -= 1
            } else {
                ans.append(n - i)
                i -= k
                j -= 1
            }
        }
        return ans
    }
}
