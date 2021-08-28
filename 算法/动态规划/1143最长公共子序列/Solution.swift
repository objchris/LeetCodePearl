/*
 1143. 最长公共子序列
 https://leetcode-cn.com/problems/longest-common-subsequence/
 
 状态: dp[i][j] 第i个字符到第j个字符的最长公共子序列长度
 初始化： 0
 转移方程：dp[i][j] = dp[i - 1][j - 1] + 1  (text1[i] == text2[j])
                  = max(dp[i - 1][j], dp[i][j - 1]) (text1[i] != text2[j])
 结果：dp[text1.length - 1][text2.length - 1]
 */
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
         
        let left = Array(text1), right = Array(text2)
        let leftN = left.count, rightN = right.count
        guard leftN > 0 && rightN > 0 else {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: rightN + 1), count: leftN + 1)
        for i in 1...leftN {
            for j in 1...rightN {
                if left[i - 1] == right[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[leftN][rightN]
    }
}
