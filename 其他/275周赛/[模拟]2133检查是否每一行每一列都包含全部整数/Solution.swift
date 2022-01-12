/*
 2133. 检查是否每一行每一列都包含全部整数
 https://leetcode-cn.com/problems/check-if-every-row-and-column-contains-all-numbers/
 
 */
class Solution {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        let n = matrix.count
        var temp = [Int](repeating: 0, count: n)
        for i in 0..<n {
            for j in 0..<n {
                guard matrix[i][j] > 0, matrix[i][j] <= n else { return false }
                temp[matrix[i][j] - 1] += 1
                if temp[matrix[i][j] - 1] != 1 { return false }
            }
            temp = [Int](repeating: 0, count: n)
        }
        for j in 0..<n {
            for i in 0..<n {
                guard matrix[i][j] > 0, matrix[i][j] <= n else { return false }
                temp[matrix[i][j] - 1] = 1
                if temp[matrix[i][j] - 1] != 1 { return false }
            }
            temp = [Int](repeating: 0, count: n)
        }
        return true
    }
}
