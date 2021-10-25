/*
 240. 搜索二维矩阵 II
 https://leetcode-cn.com/problems/search-a-2d-matrix-ii/
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var i = 0
        var j = matrix[i].count - 1
        while i < matrix.count && j >= 0 {
            if matrix[i][j] == target {
                return true
            } else if matrix[i][j] > target {
                j -= 1
            } else {
                i += 1
            }
        }
        return false
    }
}
