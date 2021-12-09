/*
794. 有效的井字游戏
https://leetcode-cn.com/problems/valid-tic-tac-toe-state/

分类讨论可能失败的情况：
1. O 的数目比 X 大，或 X 的数目比 O 大超过 1
2. X 胜利的情况下，O 的数目和 X 一样多
3. O 胜利的情况下，X 的数目不和 O 一样多
4. X 和 O 同时胜利
*/
class Solution {
    func validTicTacToe(_ board: [String]) -> Bool {
        var matrix = board.map { Array($0) }
        var x = 0, o = 0
        for i in matrix.indices {
            for j in matrix[i].indices {
                if matrix[i][j] == "X" { x += 1 }
                else if matrix[i][j] == "O" { o += 1}
            }
        }
        var a = check(matrix, "X"), b = check(matrix, "O")
        if o > x || x - o > 1 { return false }
        if a && o >= x { return false }
        if b && x != o { return false }
        if a && b { return false }
        return true
    }

    func check(_ matrix: [[Character]], _ char: Character) -> Bool {
        for i in matrix.indices {
            if matrix[i][0] == char && matrix[i][1] == char && matrix[i][2] == char { return true }
            if matrix[0][i] == char && matrix[1][i] == char && matrix[2][i] == char { return true }
        }
        var a = true, b = true
        for i in matrix.indices {
            for j in matrix[i].indices {
                if i == j {
                    a = a && (matrix[i][j] == char)
                }
                if i + j == 2 {
                    b = b && (matrix[i][j] == char)
                }
            }
        }
        return a || b
    }
}
