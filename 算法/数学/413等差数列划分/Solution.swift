/*
 413. 等差数列划分
 https://leetcode-cn.com/problems/arithmetic-slices/
 
 分析等差数列[1,2,3,4,5]
 [1,2,3] 为 1 个等差子数列
 
 当遍历到 4 ，[1,2,3,4]可组成的子数列有：
 1. [1,2,3]
 2. [2,3,4]
 3. [1,2,3,4]
 比 [1,2,3] 多了2个组合： [2,3,4] 和 [1,2,3,4]
 
 再遍历到 5
 有子序列：
 1. [1,2,3]
 2. [2,3,4]
 3. [1,2,3,4]
 4. [3,4,5]
 5. [2,3,4,5]
 6. [1,2,3,4,5]
 比 [1,2,3,4] 多了3个组合： [3,4,5] 、 [2,3,4,5] 和 [1,2,3,4,5]
 可以发现一个规律：
 若遍历到的数字和之前的到的子数列等差，那这个数能扩展的结果值是 「 子数列.count - 2 」
 
 */
class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {

        let MAX_DIFF = 2001
        var diff = MAX_DIFF
        var ans = 0
        var count = 1
        for i in 1 ..< nums.count {

            if diff == MAX_DIFF {
                diff = nums[i] - nums[i - 1]
                count = 2
                continue
            }
            if diff == nums[i] - nums[i - 1] {
                count += 1
            } else {
                diff = nums[i] - nums[i - 1]
                count = 2
                continue
            }
            if count >= 3 {
                ans += (count - 2)
            }

        }
        return ans

    }
}
