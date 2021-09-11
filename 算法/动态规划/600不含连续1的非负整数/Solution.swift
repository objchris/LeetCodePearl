/*
 600. 不含连续1的非负整数
 https://leetcode-cn.com/problems/non-negative-integers-without-consecutive-ones/
 
 这是一道典型的「数位 DP」题。
 对于「数位 DP」题，都存在「询问 [a, b]（a 和 b 均为正整数，且 a < b）区间内符合条件的数值个数为多少」的一般形式，通常我们需要实现一个查询 [0, x] 有多少合法数值的函数 int dp(int x)，然后应用「容斥原理」求解出 [a, b] 的个数：dp(b) - dp(a - 1)。

 作者：AC_OIer
 链接：https://leetcode-cn.com/problems/non-negative-integers-without-consecutive-ones/solution/gong-shui-san-xie-jing-dian-shu-wei-dp-y-mh92/
 */

/* TLE
class Solution {
    func findIntegers(_ n: Int) -> Int {
        var ans = 0
        for i in 0...n {
            var isOne = false
            var hasDoubleOne = false
            var t = i
            while t != 0 {
                hasDoubleOne = isOne && (t % 2 != 0)
                if hasDoubleOne {
                    break
                }
                isOne = t % 2 != 0
                t >>= 1
            }
            if !hasDoubleOne {
                ans += 1
            }
        }
        return ans
    }
}
 */

class Solution {
    
    let dp: [[Int]] = {
        let N = 50
        var f = [[Int]](repeating: [0,0], count: N)
        f[1][0] = 1
        f[1][1] = 2
        for i in 1..<N-1 {
            f[i+1][0] = f[i][1]
            f[i+1][1] = f[i][0] + f[i][1]
        }
        return f
    }()
    
    func bitCount(of n: Int) -> Int {
        for i in (0...31).reversed() {
            if ((n >> i) & 1) == 1 {
                return i
            }
        }
        return 0
    }
    
    func findIntegers(_ n: Int) -> Int {
        let count = bitCount(of: n)
        var ans = 0
        var prev = 0
        for i in (0...count).reversed() {
            let cur = (n >> i) & 1
            if cur == 1 {
                ans += dp[i+1][0]
            }
            if prev == 1 && cur == 1 {
                break
            }
            prev = cur
            if i == 0 {
                ans += 1
            }
        }
        return ans
    }
    
}
