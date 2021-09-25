/*
 583. 两个字符串的删除操作
 https://leetcode-cn.com/problems/delete-operation-for-two-strings/
 */
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        let m = arr1.count
        let n = arr2.count
        // m * n
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var maxLength = 0
        for i in 1...m {
            for j in 1...n {
                if arr1[i - 1] == arr2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
                maxLength = max(maxLength, dp[i][j])
            }
        }
        var ans = 0
        ans += m - maxLength
        ans += n - maxLength
        return ans
    }
}
