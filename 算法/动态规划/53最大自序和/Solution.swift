/*
 [DP] 53. 最大子序和
 https://leetcode-cn.com/problems/maximum-subarray/
 
 1、使用前缀和思想，O(n^2)
 2、动态规划，O(n)
 */
class Solution {
    
    // 前缀和思想
    // O(n^2) 不符合题目要求 O(n)
    func maxSubArray_(_ nums: [Int]) -> Int {
        let n = nums.count
        var arr = Array(repeating: 0, count: n + 1)
        for i in nums.indices {
            arr[i + 1] = arr[i] + nums[i]
        }
        var ans = nums[0]
        for i in arr.indices {
            for j in 0..<i {
                ans = max(ans, arr[i] - arr[j])
            }
        }
        return ans
        
    }
    
    // DP
    func maxSubArray(_ nums: [Int]) -> Int {
        // dp[i]: 以第i个数结尾的连续子数组的最大和
        // var dp = Array(repeating: 0, count: nums.count)
        // dp[0] = nums[0]
        
        var dp = 0, ans = nums[0]
        for i in 0..<nums.count {
            dp = max(dp + nums[i], nums[i])
            ans = max(ans, dp)
        }
        
        return ans
    }
}

let s = Solution()
s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) // 6

