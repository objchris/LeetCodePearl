/*
462. 最少移动次数使数组元素相等 II
https://leetcode.cn/problems/minimum-moves-to-equal-array-elements-ii/
*/
class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let target = nums[nums.count / 2]
        var ans = 0
        for n in nums {
            ans += abs(n - target)
        }
        return ans
    }
}
