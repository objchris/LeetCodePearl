/*
 5859. 差的绝对值为 K 的数对数目
 https://leetcode-cn.com/problems/count-number-of-pairs-with-absolute-difference-k/
 */
class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if abs(nums[i] - nums[j]) == k {
                    ans += 1
                }
            }
        }
        return ans
    }
}
