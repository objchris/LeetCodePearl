/*
 36. 有效的数独
 https://leetcode-cn.com/problems/valid-sudoku/
 
 模拟遍历解题
 */
class Solution {
    
    var dis = [[1,1],[1,4],[1,7],[4,1],[4,4],[4,7],[7,1],[7,4],[7,7]]
    var dir = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,0],[0,1],[1,-1],[1,0],[1,1]]
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in board.indices {
            var tester = 0
            for j in board[i].indices {
                let c = board[i][j]
                if c == "." {
                    continue
                }
                let n = c.asciiValue! - Character("0").asciiValue!
                if (tester | (1 << n)) == tester {
                    return false
                }
                tester |= (1 << n)
            }
        }

        for i in board[0].indices {
            var tester = 0
            for j in board.indices {
                let c = board[j][i]
                if c == "." {
                    continue
                }
                let n = c.asciiValue! - Character("0").asciiValue!
                if (tester | (1 << n)) == tester {
                    return false
                }
                tester |= (1 << n)
            }
        }
        
        for i in dis.indices {
            var tester = 0
            for j in dir.indices {
                let i1 = dis[i][0]+dir[j][0], j1 = dis[i][1]+dir[j][1]
                let c = board[i1][j1]
                if c == "." {
                    continue
                }
                let n = c.asciiValue! - Character("0").asciiValue!
                if (tester | (1 << n)) == tester {
                    return false
                }
                tester |= (1 << n)
            }
        }
        
        return true
    }
}
