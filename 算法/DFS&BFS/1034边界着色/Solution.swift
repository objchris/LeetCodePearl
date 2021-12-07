/*
1034. 边界着色
https://leetcode-cn.com/problems/coloring-a-border/

1. 在 row,col 处开始 BFS 搜索
2. 当前位置的四个方位的某一个位置越界或颜色与当前位置的颜色不一致时，可判定为边界
3. 将结果矩阵中的边界置为 -1，同时将记录矩阵中遍历过的节点置为 -1
4. 遍历结果矩阵，将 -1 的值设置为 color
*/
class Solution {

    let diffs = [[-1, 0], [1, 0], [0, -1], [0, 1]]

    func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
        
        var ans = grid  // 结果矩阵
        var grid = grid // 记录矩阵，记录节点的遍历情况
        let tr = grid.count, tc = grid[0].count
        var queue = [[Int]]()
        queue.append([row, col])
        // BFS
        while !queue.isEmpty {
            let item = queue.removeFirst()
            var isEdge = false
            // 遍历当前节点的相邻节点
            for next in diffs.map{ [$0[0] + item[0], $0[1] + item[1]] } {
                let r = next[0], c = next[1]
                if r < 0 || r >= tr || c < 0 || c >= tc {
                    // 越界，为边界
                    isEdge = true
                    continue
                }
                if grid[r][c] == -1 { continue } // 已遍历过，忽略
                if ans[r][c] != ans[item[0]][item[1]] {
                    // 颜色不一致，为边界
                    isEdge = true
                    continue
                } 
                // BFS 入队
                queue.append([r, c]) 
            }
            grid[item[0]][item[1]] = -1    // 设置为遍历过
            if isEdge {
                ans[item[0]][item[1]] = -1 // 设置为边界点，这里直接设为 color 可能会导致 BFS 内部的判断出现问题
            }
        }
        for i in 0..<tr {
            for j in 0..<tc {
                ans[i][j] = ans[i][j] == -1 ? color : ans[i][j] // 将 -1 换成 color 值
            }
        }
        return ans

    }
}
