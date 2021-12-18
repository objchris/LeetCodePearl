/*
419. 甲板上的战舰
https://leetcode-cn.com/problems/battleships-in-a-board/

实则求在 board 上有多少个连通分量
*/
class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var ans = 0
        for i in board.indices {
            for j in board[i].indices {
                if i > 0 && board[i - 1][j] == "X" { continue }
                if j > 0 && board[i][j - 1] == "X" { continue }
                if board[i][j] == "X" { ans += 1}
            }
        }
        return ans
    }
}
