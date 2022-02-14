/*
540. 有序数组中的单一元素
https://leetcode-cn.com/problems/single-element-in-a-sorted-array/
*/
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count
        var l = 0, r = n - 1
        while l < r {
            let mid = (l + r) >> 1
            if mid % 2 == 0 {
                if mid < n - 1 && nums[mid] != nums[mid + 1] {
                    r = mid
                } else {
                    l = mid + 1
                }
            } else {
                if mid > 0 && nums[mid] != nums[mid - 1] {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
        }
        return nums[l]
    }
}
