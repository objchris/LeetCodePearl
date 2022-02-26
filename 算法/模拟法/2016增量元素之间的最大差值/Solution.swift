/*
2016. 增量元素之间的最大差值
https://leetcode-cn.com/problems/maximum-difference-between-increasing-elements/
*/
class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var minV = Int.max
        var maxV = Int.min
        var ans = -1
        for n in nums {
            if n < minV {
                minV = n
                maxV = n
            } else if n > maxV {
                maxV = n
                ans = max(ans, maxV - minV)
            }
        }
        return ans
    }
}
