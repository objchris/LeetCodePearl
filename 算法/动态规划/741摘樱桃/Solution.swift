/*
741. 摘樱桃
https://leetcode.cn/problems/cherry-pickup/
*/
class Solution {

    let N = 55

    func cherryPickup(_ g: [[Int]]) -> Int {
        let n = g.count
        guard n > 1 else { return g[0][0] == 1 ? 1 : 0 }
        var f = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.min, count: N), count: N), count: 2 * N)
        f[2][1][1] = g[0][0]
        for k in 3...2*n {
            for i1 in 1...n {
                for i2 in 1...n {
                    let j1 = k - i1, j2 = k - i2
                    if j1 <= 0 || j1 > n || j2 <= 0 || j2 > n { continue }
                    let A = g[i1 - 1][j1 - 1], B = g[i2 - 1][j2 - 1]
                    if A == -1 || B == -1 { continue }
                    let a = f[k - 1][i1 - 1][i2], b = f[k - 1][i1 - 1][i2 - 1], c = f[k - 1][i1][i2 - 1], d = f[k - 1][i1][i2]
                    var t = max(max(a, b), max(c, d)) + A
                    if i1 != i2 { t += B }
                    f[k][i1][i2] = t
                }
            }
        }
        return f[2 * n][n][n] <= 0 ? 0 : f[2 * n][n][n]
    }

}
