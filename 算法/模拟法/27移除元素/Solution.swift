/*
27. 移除元素
https://leetcode-cn.com/problems/remove-element/

双指针解决问题
*/
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var l = 0, r = 0
        while r < nums.count {
            if nums[r] != val {
                nums[l] = nums[r]
                l += 1
            }
            r += 1
        }
        return l
    }
}
