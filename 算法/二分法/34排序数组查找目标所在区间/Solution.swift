/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 
 参看三叶大佬解析：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/solution/gong-shui-san-xie-kao-cha-dui-er-fen-de-86bk0/
 
 至于 mid 值的计算，有两种方式：
 1. `mid = (left + right) / 2`
 2. `mid = (left + right + 1) / 2`
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        var ans = [-1, -1]
        guard nums.count > 0 else {
            return ans
        }
        
        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = (l + r) / 2
            if nums[m] >= target {
                r = m
            } else {
                l = m + 1
            }
        }
        
        if nums[l] != target {
            return ans
        } else {
            ans[0] = l
            l = 0
            r = nums.count - 1
            while l < r {
                let m = (l + r + 1) / 2
                if nums[m] <= target {
                    l = m
                } else {
                    r = m - 1
                }
            }
            ans[1] = l
        }
        
        return ans
    }
}

