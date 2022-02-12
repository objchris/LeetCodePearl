/*
1020. 飞地的数量
https://leetcode-cn.com/problems/number-of-enclaves/
*/
class Solution {

    func numEnclaves(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count, n = grid[0].count
        var vis = [[Bool]](repeating:[Bool](repeating:false, count:n), count: m)
        var queue = [[Int]]()
        for i in grid.indices {
            for j in grid[i].indices {
                if grid[i][j] == 1 { 
                    if i == 0 || i == m - 1 || j == 0 || j == n - 1 {
                        if grid[i][j] == 0 { continue }
                        vis[i][j] = true
                        queue.append([i, j])
                    }
                }
            }
        }
        let dirs = [[1,0], [-1, 0], [0, 1], [0, -1]]
        while !queue.isEmpty {
            let loc = queue.removeFirst()
            let x = loc[0], y = loc[1]
            for di in dirs {
                let nx = x + di[0], ny = y + di[1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
                if grid[nx][ny] != 1 { continue }
                if vis[nx][ny] { continue }
                vis[nx][ny] = true
                queue.append([nx, ny])
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n { 
                if grid[i][j] == 1 && !vis[i][j] { ans += 1}
            }
        }
        return ans
    }

}
