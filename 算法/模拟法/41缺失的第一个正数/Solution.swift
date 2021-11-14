/*
41. 缺失的第一个正数
https://leetcode-cn.com/problems/first-missing-positive/

1、先不考虑空间复杂度的情况，尝试解决问题：
开拓一个长度为 length 的新数组 `newNums` ，遍历 `nums` ，
将其中在 `[1, length]` 区间内的值按照对应的下标填到新数组中，
然后再遍历新数组，若有 `newNums[i] != i + 1` , 则 `i + 1` 就是答案，否则，`length + 1` 就是答案。

2、考虑 `O(1)` 的情况，直接在 `nums` 数组中做到第一步要做的事情
*/
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        for i in 0..<n {
            while nums[i] <= n && nums[i] > 0 && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        for i in 0..<n {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
}
