/*
 453. 最小操作次数使数组元素相等
 https://leetcode-cn.com/problems/minimum-moves-to-equal-array-elements/
 */
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var v = nums.min()!
        var ans = 0
        for n in nums {
            ans += n - v
        }
        return ans
    }
}
