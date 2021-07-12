/**
 275. H 指数 II
 https://leetcode-cn.com/problems/h-index-ii/
 */
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var l = 0, r = n - 1
        while l < r {
            let m = (l + r) >> 1
            if citations[m] >= n - m {
                r = m
            } else {
                l = m + 1
            }
        }
        return citations[r] >= n - r ? n - r : 0
    }
}
