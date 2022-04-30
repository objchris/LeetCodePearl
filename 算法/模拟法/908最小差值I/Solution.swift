/*
908. 最小差值 I
https://leetcode-cn.com/problems/smallest-range-i/
*/
class Solution {
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        var minV = Int.max, maxV = Int.min
        for n in nums {
            minV = min(minV, n)
            maxV = max(maxV, n)
        }
        return (maxV - minV - 2 * k) > 0 ? (maxV - minV - 2 * k) : 0
    }       
}
