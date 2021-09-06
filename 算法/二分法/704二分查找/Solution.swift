/*
 704. 二分查找
 https://leetcode-cn.com/problems/binary-search/
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) >> 1
            if nums[mid] == target {
                return mid
            }
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
