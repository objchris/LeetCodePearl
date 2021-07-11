/*
 35. 搜索插入位置
 https://leetcode-cn.com/problems/search-insert-position/
 直接使用二分法进行搜索
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        if target > nums.last! {
            return nums.count
        }
        
        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = (l + r) >> 1
            if nums[m] >= target {
                r = m
            } else {
                l = m + 1
            }
        }
        return r
        
    }
}

let s = Solution()
s.searchInsert([1,3,5,6], 5)
