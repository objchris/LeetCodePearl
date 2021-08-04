/*
 [双指针]611. 有效三角形的个数
 https://leetcode-cn.com/problems/valid-triangle-number/
 */
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        var nums = nums
        nums.sort()
        var res = 0
        for i in (2 ..< nums.count).reversed() {
            var l = 0, r = i - 1
            while l < r {
                if nums[l] + nums[r] > nums[i] {
                    res += r - l
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        return res
    }
}
