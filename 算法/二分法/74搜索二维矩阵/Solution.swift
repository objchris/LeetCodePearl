/*
 74. 搜索二维矩阵
 https://leetcode-cn.com/problems/search-a-2d-matrix/
 
 0 1 2 3
 4 5 6 7
 8 9 10 11
 
 m = 3
 n = 4
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        guard matrix.count > 0, matrix.first!.count > 0 else {
            return false
        }
        let m = matrix.count
        let n = matrix.first!.count
        
        var l = 0, r = m * n - 1
        while l < r {
            let mid = (l + r) >> 1
            if matrix[mid/n][mid%n] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return matrix[r/n][r%n] == target
        
    }
}

