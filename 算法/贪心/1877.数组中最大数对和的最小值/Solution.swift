/*
 1877. 数组中最大数对和的最小值
 https://leetcode-cn.com/problems/minimize-maximum-pair-sum-in-array/
 */
class Solution {
    func minPairSum(_ nums: [Int]) -> Int {

        let sorted = nums.sorted()
        var l = 0, r = sorted.count - 1
        var ans = 0
        while l < r {
            ans = max(ans, sorted[l] + sorted[r])
            l += 1
            r -= 1
        }
        return ans
        
    }
}

