/*
 576. 出界的路径数
 https://leetcode-cn.com/problems/out-of-boundary-paths/
 */
// DFS
class Solution {
    var m: Int!
    var n: Int!
    let mod = Int(1e9 + 7)
    var maxMove: Int!
    var cache: [[Int]]!
    let dirs = [(-1, 0), (0, -1), (1, 0), (0, 1)]

    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        self.m = m
        self.n = n
        self.maxMove = maxMove
        // cache 表示在位置 i 且剩下 j 步时的最大路径数
        cache = [[Int]](repeating: [Int](repeating: -1, count: maxMove + 1), count: m * n)
        return dfs(0, startRow, startColumn)
    }

    func dfs(_ move: Int, _ row: Int, _ col: Int) -> Int {
        if row < 0 || row >= m || col < 0 || col >= n {
            return 1
        }
        if cache[index(row, col)][move] != -1 {
            return cache[index(row, col)][move]
        }
        if move >= maxMove {
            cache[index(row, col)][move] = 0
            return 0
        }
        var sum = 0
        for dir in dirs {
            let r = row + dir.0
            let c = col + dir.1
            sum += dfs(move + 1, r, c)
            sum %= mod
        }
        cache[index(row, col)][move] = sum
        return sum
    }
    func index(_ row: Int, _ col: Int) -> Int {
        return row * n + col
    }
}
