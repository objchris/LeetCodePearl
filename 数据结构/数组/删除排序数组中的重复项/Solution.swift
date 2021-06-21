/*
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素只出现一次，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2gy9m/
 
 本题有个 O(1) 的空间复杂度限制，因此不能开辟新的空间，例如使用 Set ，因此使用一个变量 index ，标记重复的，可被替换的位置。同时，替换了多少次即为最终返回的答案。
 
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var index = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}

var nums = [0,0,1,1,1,2,2,3,3,4,4,4,4,4,4,4,5,5,6,7,8,9,9,9,9,9,9,10,10,10,11,12,12,12,13,13,13]
let s = Solution()
let len = s.removeDuplicates(&nums)
for i in 0 ..< len {
    print(nums[i])
}
