/*
 1. 两数之和
 https://leetcode-cn.com/problems/two-sum/
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var map = [Int: Int]()
        for i in nums.indices {
            if let j = map[target - nums[i]] {
                return [i, j]
            }
            map[nums[i]] = i
        }
        return []

    }
}
