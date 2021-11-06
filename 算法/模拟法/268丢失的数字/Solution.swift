/*
268. 丢失的数字
https://leetcode-cn.com/problems/missing-number/

时间复杂度：O(n)
空间复杂度：O(1)
*/
class Solution {
    // 原地Hash，将数字放在其应该在的位置
    func missingNumber1(_ nums: [Int]) -> Int {
        var nums = nums
        let count = nums.count
        var i = 0
        while i < count {
            while i != nums[i] && nums[i] < count {
                nums.swapAt(i, nums[i])
            }
            i += 1
        }
        for i in nums.indices {
            if i != nums[i] {
                return i
            }
        }
        return count
    }
    
    // 求差法
    func missingNumber2(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let n = nums.count
        return n * (n + 1) / 2 - sum
    }
    
    // 异或法：找缺失数，找唯一出现的数
    func missingNumber3(_ nums: [Int]) -> Int {
        var ans = 0
        for i in nums {
            ans ^= i
        }
        for i in 0...nums.count {
            ans ^= i
        }
        return ans
    }
}
