/*
 5872. 连接后等于目标字符串的字符串对
 https://leetcode-cn.com/problems/number-of-pairs-of-strings-with-concatenation-equal-to-target/
 */
class Solution {
    func numOfPairs(_ nums: [String], _ target: String) -> Int {
        var ans = 0
        for i in nums.indices {
            for j in nums.indices where i != j {
                if nums[i] + nums[j] == target {
                    ans += 1
                }
            }
        }
        return ans
    }
}
