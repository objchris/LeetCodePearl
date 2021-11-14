/*
 26. 删除有序数组中的重复项
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var left = 1, right = 1
        while right < nums.count {
            if nums[right] != nums[right - 1] {
                nums[left] = nums[right]
                left += 1
            }
            right += 1
        }
        return left
    }
}
