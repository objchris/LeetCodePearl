/*
 5862. 使数组连续的最少操作数
 https://leetcode-cn.com/problems/minimum-number-of-operations-to-make-array-continuous/
 
 1. 去重
 2. 排序
 3. 滑动窗口求最大的不需要修改的范围
 */
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var unique = Array(Set(nums)).sorted()
        var cur = 0, r = 0
        let an = unique.count
        for l in 0 ..< an {
            while r + 1 < an && unique[r + 1] - unique[l] <= n - 1 {
                r += 1
            }
            cur = max(cur, r - l + 1)
        }
        return n - cur
    }
}
