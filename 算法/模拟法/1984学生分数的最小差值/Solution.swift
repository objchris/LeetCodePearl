/*
1984. 学生分数的最小差值
https://leetcode-cn.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
*/
class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        let nums = nums.sorted()
        let n = nums.count
        var ans = Int.max
        for i in 0...n-k {
            ans = min(ans, nums[i+k-1] - nums[i])
        }
        return ans
    }
}
