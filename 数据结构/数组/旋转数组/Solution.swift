import Foundation

class Solution {
    // 空间复杂度O(n)
    func rotate(_ nums: inout [Int], _ k: Int) {
        let shift = k % nums.count
        nums = Array(nums[(nums.count - shift)...(nums.count - 1)] + nums[0...(nums.count - shift - 1)])
    }
    
    // 空间复杂度O(1)
    func rotate1(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        var i = 0, target = nums[i]
        for _ in 1 ... count {
            i = (i + k) % count
            let temp = nums[i]
            nums[i] = target
            target = temp
        }
    }
}



var nums = [1,2,3,4,5,6,7]
let s = Solution()
s.rotate1(&nums, 2)
nums
