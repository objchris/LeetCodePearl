/*
730. 统计不同回文子序列
https://leetcode.cn/problems/count-different-palindromic-subsequences/
*/
class Solution {
    let MOD = Int(1e9 + 7)
    let A = Character("a").asciiValue!

    func countPalindromicSubsequences(_ s: String) -> Int {
        let cs = Array(s)
        let n = cs.count 
        var f = [[Int]](repeating:[Int](repeating: 0, count: n), count: n)
        var L = [Int](repeating: -1, count: 4)
        for i in (0..<n).reversed() {
            L[Int(cs[i].asciiValue! - A)] = i
            var R = [Int](repeating: -1, count: 4)
            for j in i..<n {
                R[Int(cs[j].asciiValue! - A)] = j
                for k in 0..<4 {
                    if L[k] == -1 || R[k] == -1 { continue }
                    let l = L[k], r = R[k]
                    if l == r { f[i][j] = (f[i][j] + 1) % MOD } // only k 
                    else if l == r - 1 { f[i][j] = (f[i][j] + 2) % MOD } // k & kk
                    else {
                        f[i][j] = (f[i][j] + f[l + 1][r - 1] + 2) % MOD 
                    }
                }
            }
        }
        return f[0][n - 1]
    }
}

