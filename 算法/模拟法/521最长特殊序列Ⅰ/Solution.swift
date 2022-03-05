/*
521. 最长特殊序列 Ⅰ
https://leetcode-cn.com/problems/longest-uncommon-subsequence-i/
*/
class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        return a == b ? -1 : max(a.count, b.count)
    }
}
