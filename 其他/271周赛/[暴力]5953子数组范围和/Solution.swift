/*
 5953. 子数组范围和
 https://leetcode-cn.com/problems/sum-of-subarray-ranges/
 
 根据数据范围，可使用暴力 O(n^2)
 */
class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        
        let n = nums.count
        var ans = 0
        for i in 0..<n {
            var minv = nums[i], maxv = nums[i]
            for j in i..<n {
                minv = min(minv, nums[j])
                maxv = max(maxv, nums[j])
                ans += maxv - minv
            }
        }
        return ans
        
    }
}
