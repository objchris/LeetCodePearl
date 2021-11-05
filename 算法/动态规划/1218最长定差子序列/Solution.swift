/*
1218. 最长定差子序列
https://leetcode-cn.com/problems/longest-arithmetic-subsequence-of-given-difference/
*/
class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var ans = 0
        var map = [Int: Int]()
        for n in arr {
            map[n] = map[n - difference, default: 0] + 1
            ans = max(ans, map[n]!)
        }
        return ans
    }
}
