/*
1332. 删除回文子序列
https://leetcode-cn.com/problems/remove-palindromic-subsequences/
*/
class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        return String(s.reversed()) == s ? 1 : 2
    }
}
