/*
2104. 子数组范围和
https://leetcode-cn.com/problems/sum-of-subarray-ranges/
*/
class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = 0
        for i in 0..<n {
            var minV = nums[i], maxV = nums[i]
            for j in i..<n {
                minV = min(minV, nums[j])
                maxV = max(maxV, nums[j])
                ans += maxV - minV
            }
        }
        return ans
    }
}
