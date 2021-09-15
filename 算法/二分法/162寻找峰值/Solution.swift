/*
 162. 寻找峰值
 https://leetcode-cn.com/problems/find-peak-element/
 */
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return 0
        }
        if nums[0] > nums[1] {
            return 0
        }
        if nums[n-1] > nums[n-2] {
            return n - 1
        }
        var l = 1, r = nums.count - 2
        while l <= r {
            let mid = (l + r) >> 1
            if nums[mid] > nums[mid-1] && nums[mid] > nums[mid+1] {
                return mid
            }
            if nums[mid] < nums[mid-1] {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return 0
    }
}
