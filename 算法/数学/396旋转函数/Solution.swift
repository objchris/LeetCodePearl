/*
396. 旋转函数
https://leetcode-cn.com/problems/rotate-function/
*/
class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        var sum = nums.reduce(0, +)
        var f = 0
        for i in nums.indices {
            f += i * nums[i]
        }
        var ans = Int.min
        for i in 0..<nums.count {
            ans = max(ans, f)
            f = f - sum + nums[i] * nums.count
        }
        return ans
    }
}
