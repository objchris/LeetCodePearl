/*
 1646. 获取生成数组中的最大值
 https://leetcode-cn.com/problems/get-maximum-in-generated-array/
 */
class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        var nums = [Int](repeating: 0, count: 101)
        nums[1] = 1
        var ans = 0
        for i in 0 ... n {
            if i % 2 == 0 {
                nums[i] = nums[i / 2]
            } else {
                nums[i] = nums[i / 2] + nums[i / 2 + 1]
            }
            ans = max(ans, nums[i])
        }
        return ans
    }
}
