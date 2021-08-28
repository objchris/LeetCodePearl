/*
 516. 最长回文子序列
 https://leetcode-cn.com/problems/longest-palindromic-subsequence/
 
 状态：dp[i][j] 表示从i到j的最长回文子序列长度
 初始化：dp[x][x] = 1
 转移方程：
 dp[i][j] = dp[i + 1][j - 1] + 2 (s[i] == s[j])
          = max(dp[i + 1][j], dp[i][j - 1])   (s[i] != s[j])
 结果
 return dp[0][s.count - 1]
 */
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        
        let arr = Array(s)
        let n = s.length;
        var dp = [[Int]](repeating:[Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            dp[i][i] = 1
        }
        for i in (0..<n).reversed() {
            if i + 1 >= n {
                continue
            }
            for j in i+1 ..< n {
                if arr[i] == arr[j] {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[0][n - 1]

    }
}
