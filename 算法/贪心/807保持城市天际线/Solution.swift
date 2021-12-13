/*
807. 保持城市天际线
https://leetcode-cn.com/problems/max-increase-to-keep-city-skyline/

先求出每一行和每一列的最大值，保证每一位都是最优解，即可得到最终结果
*/
class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var rows = [Int](repeating: 0, count: n)
        var cols = [Int](repeating: 0, count: n)
        for i in 0..<n {
            for j in 0..<n {
                rows[i] = max(rows[i], grid[i][j])
                cols[j] = max(cols[j], grid[i][j])
            }
        }
        var ans = 0
        for i in 0..<n {
            for j in 0..<n {
                ans += min(rows[i], cols[j]) - grid[i][j]
            }
        }
        return ans
    }
}
