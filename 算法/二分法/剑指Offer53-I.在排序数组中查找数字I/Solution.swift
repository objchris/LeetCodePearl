/*
 [二分法]剑指 Offer 53 - I. 在排序数组中查找数字 I
 https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
 
 同 34.求区间 ，仅返回值不同
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        guard nums.count > 0 else {
            return 0
        }
        
        let n = nums.count
        var l = 0, r = n - 1
        while l < r {
            let m = (l + r) >> 1
            if nums[m] >= target {
                r = m
            } else {
                l = m + 1
            }
        }
        
        if nums[r] != target {
            return 0
        } else {
            let low = r
            l = 0
            r = n - 1
            while l < r {
                let m = (l + r + 1) >> 1
                if nums[m] <= target {
                    l = m
                } else {
                    r = m - 1
                }
            }
            return r - low + 1
        }
    }
}

let s = Solution()
s.search([1,2,3,4,4,4,4,4,4,4,4], 1)

