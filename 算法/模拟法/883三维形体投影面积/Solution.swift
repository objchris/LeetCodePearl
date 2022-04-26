/*
883. 三维形体投影面积
https://leetcode-cn.com/problems/projection-area-of-3d-shapes/
*/
class Solution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        let x = grid.reduce(0, { ret, item in 
        	ret + (item.max() ?? 0)
        })
        let n = grid.count
        var y = 0, maxY = Int.min
       	for i in 0..<n {
       		for j in 0..<n {
       			maxY = max(maxY, grid[j][i])
       		}
       		y += maxY
       		maxY = Int.min
       	}
        let z = grid.reduce(0, { ret, item in 
        	ret + item.filter{ $0 != 0 }.count
        })
        return x + y + z
    }
}
