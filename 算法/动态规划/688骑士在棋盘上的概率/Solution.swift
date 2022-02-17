/*
688. 骑士在棋盘上的概率
https://leetcode-cn.com/problems/knight-probability-in-chessboard/
*/
class Solution {

    let dirs = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]

    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        guard k > 0 else { return 1 }
        var f = [[[Double]]](repeating:[[Double]](repeating:[Double](repeating: 0, count: k + 1), count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                f[i][j][0] = 1
            }
        }
        for p in 1...k {
            for i in 0..<n {
                for j in 0..<n {
                    for dir in dirs {
                        let nx = i + dir[0], ny = j + dir[1]
                        if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
                        f[i][j][p] += f[nx][ny][p - 1] / 8
                    }
                }
            }
        }
        return f[row][column][k]
    }

}
