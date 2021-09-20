/*
 300. 最长递增子序列
 https://leetcode-cn.com/problems/longest-increasing-subsequence/
 */

// DP
// @see https://alchemist-al.com/algorithms/longest-increasing-subsequence
class Solution {
    // O(n^2)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating:1, count: n)

        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }

        var ans = 0
        for i in dp.indices {
            ans = max(ans, dp[i])
        }
        return ans
    }
}

// 贪心 + 二分法
// 维护一个上升序列
class Solution2 {
    // O(nlogn)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var tail = [nums[0]]
        
        for num in nums {
            if num > tail.last! {
                tail.append(num)
                continue
            }
            
            var l = 0, r = tail.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if tail[mid] > num {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            tail[r] = num
        }
        
        return tail.count
    }
}
