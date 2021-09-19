/*
 5861. 出租车的最大盈利
 https://leetcode-cn.com/problems/maximum-earnings-from-taxi/
 
 1. 将终点为 i 的所有路线存起来
 2. DP 取最大值
 */
class Solution {
    func maxTaxiEarnings(_ n: Int, _ rides: [[Int]]) -> Int {
        // 存路线
        var g = [[(Int,Int)]](repeating: [(Int,Int)](), count: n)
        for r in rides {
            let a = r[0] - 1
            let b = r[1] - 1
            g[b].append((a, b - a + r[2]))
        }
        // 取值
        var f = [Int](repeating: 0, count: n)
        for i in 1..<n {
            f[i] = max(f[i], f[i-1])
            for r in g[i] {
                f[i] = max(f[i], f[r.0] + r.1)
            }
        }
        return f[n-1]
    }
}
