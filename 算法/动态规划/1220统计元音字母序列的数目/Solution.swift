/*
1220. 统计元音字母序列的数目
https://leetcode-cn.com/problems/count-vowels-permutation/
*/
class Solution {

    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 1 else { return 5 }
        let mod = Int(1e9 + 7)
        var ans = 0
        var dp = [Int](repeating: 1, count: 5)
        var ndp = [Int](repeating: 0, count: 5)
        for i in 2...n {
            ndp[0] = (dp[1] + dp[2] + dp[4]) % mod
            ndp[1] = (dp[0] + dp[2]) % mod
            ndp[2] = (dp[1] + dp[3]) % mod
            ndp[3] = dp[2]
            ndp[4] = (dp[2] + dp[3]) % mod
            dp = ndp
        }
        ans = dp.reduce(0) { r, i in 
            (r + i) % mod
        }
        return ans
    }

}
