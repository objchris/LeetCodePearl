/*
 1480. 一维数组的动态和
 https://leetcode-cn.com/problems/running-sum-of-1d-array/
 */
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        let n = nums.count
        var sums = [Int](repeating: 0, count: n)
        sums[0] = nums[0]
        for i in 1..<n {
            sums[i] = sums[i - 1] + nums[i]
        }
        return sums
    }
}
