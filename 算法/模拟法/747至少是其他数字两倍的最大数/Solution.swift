/*
747. 至少是其他数字两倍的最大数
https://leetcode-cn.com/problems/largest-number-at-least-twice-of-others/

简单模拟题，维护一个最大值，当出现更大的值时比较是否为其2倍，遇到更小的值比较是否为其2倍
*/
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var ans = -1, m = 0
        for (i, v) in nums.enumerated() {
            if v > m {
                if v >= 2 * m { ans = i }
                else { ans = -1 }
                m = v
            } else if v < m {
                if m < 2 * v { ans = -1 }
            } 
        }
        return ans
    }
}
