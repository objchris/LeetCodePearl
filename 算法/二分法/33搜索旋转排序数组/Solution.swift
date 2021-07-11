/*
 [二分法]33. 搜索旋转排序数组
 
 先找到旋转的下标，然后判断target在旋转位置的左侧还是右侧，然后再进行一次二分查找
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        let n = nums.count
        if n == 0 {
            return -1
        }
        if n == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        var l = 0, r = n - 1
        while l < r {
            let m = l + r + 1 >> 1
            if nums[m] >= nums[0] {
                l = m
            } else {
                r = m - 1
            }
        }
        
        if target >= nums[0] {
            l = 0
        } else {
            l = l + 1
            r = n - 1
        }
        while l < r {
            let m = l + r >> 1
            if nums[m] >= target {
                r = m
            } else {
                l = m + 1
            }
        }
        return nums[r] == target ? r : -1
        
    }
}

let s = Solution()
s.search([4,5,6,7,0,1,2], 0)
