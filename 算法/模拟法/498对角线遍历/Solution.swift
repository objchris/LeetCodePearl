/*
498. 对角线遍历
https://leetcode.cn/problems/diagonal-traverse/
*/
class Solution {

    enum Direction {
        case up, down
    }

    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count, n = mat[0].count
        guard m > 1 else { return mat[0] }
        var ans = [Int]()
        var i = 0, j = 0, dir = Direction.up, count = 0
        while count != m * n {
            ans.append(mat[i][j])
            count += 1
            switch dir {
                case .up:
                    if i == 0 || j == n - 1 {
                        dir = .down
                        if j < n - 1 {
                            j += 1
                        } else {
                            i += 1
                        }
                    } else {
                        i -= 1
                        j += 1
                    }
                case .down:
                    if j == 0 || i == m - 1 {
                        dir = .up
                        if i < m - 1 {
                            i += 1
                        } else {
                            j += 1
                        }
                    } else {
                        i += 1
                        j -= 1
                    }
            }
        }
        return ans 
    }

}

