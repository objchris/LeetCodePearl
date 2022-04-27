/*
417. 太平洋大西洋水流问题
https://leetcode-cn.com/problems/pacific-atlantic-water-flow/

从四周往中间DFS
*/
class Solution {
  
    let dirs = [(-1,0),(1,0),(0,-1),(0,1)]
    var heights:[[Int]]!

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
      self.heights = heights
    
      let rows = heights.count
      let cols = heights[0].count
    
      //! 表示某一坐标可以流向太平洋
      var pacific = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
      //! 表示某一坐标可以流向大西洋
      var atlantic = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)

      //! 太平洋的方向（左边界）
      for i in 0..<rows {
        dfs(i, 0, &pacific)
      }
      //! 太平洋的方向 (上边界)
      for j in 1..<cols {
        dfs(0, j, &pacific)
      }
      //! 大西洋的方向 (右边界)
      for i in 0..<rows {
        dfs(i, cols - 1, &atlantic)
      }
      //！ 大西洋的方向 (下边界)
      for j in 0..<cols-1 {
        dfs(rows - 1, j, &atlantic)
      }

      var result = [[Int]]()
    
      for i in 0..<rows {
        for j in 0..<cols {
          //！ 能同时留下 太平洋 和 大西洋
          if pacific[i][j] && atlantic[i][j] {
            result.append([i,j])
          }
        }
      }
    
      return result
  
    }
  
    func dfs(_ row:Int, _ col:Int, _ ocean: inout [[Bool]]) {
      if ocean[row][col] {
        return
      }
      ocean[row][col] = true
      for dir in dirs {
        let newRow = row + dir.0, newCol = col + dir.1
        if newRow >= 0 
          && newRow < ocean.count 
          && newCol >= 0
          && newCol < ocean[row].count 
          && heights[newRow][newCol] >= heights[row][col] {
            dfs(newRow, newCol, &ocean)
        }
      }
    }
}
