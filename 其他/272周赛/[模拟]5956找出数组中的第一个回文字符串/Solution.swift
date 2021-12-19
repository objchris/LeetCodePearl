/*
 5956. 找出数组中的第一个回文字符串
 https://leetcode-cn.com/problems/find-first-palindromic-string-in-the-array/
 */
class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        for w in words {
            if String(w.reversed()) == w { return w }
        }
        return ""
    }
}
