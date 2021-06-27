/*
 [BFS]909.蛇梯棋
 求最短路径，BFS
 */
class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {

        var path = [Int]()
        var reverse = false
        for i in board.indices.reversed() {
            if reverse {
                for j in board[i].indices.reversed() {
                    path.append(board[i][j])
                }
            } else {
                for j in board[i].indices {
                    path.append(board[i][j])
                }
            }
            reverse = !reverse
        }
        if path.last != -1 {
            return -1
        }
        
        func getNextState(_ s: Int) -> [Int] {
            var ret = [Int]()
            for i in 1...6 {
                if s + i < path.count {
                    ret.append(path[s+i] == -1 ? s+i : path[s+i] - 1)
                }
            }
            return ret
        }
        
        var steps = 0
        var queue = [Int]()
        var pass = Set<Int>()
        queue.append(0)
        pass.insert(0)
        while !queue.isEmpty {
            let size = queue.count
            steps += 1
            for _ in 0..<size {
                let state = queue.removeFirst()
                for s in getNextState(state) {
                    if !queue.contains(s) && !pass.contains(s) {
                        if s == path.count - 1 {
                            return steps
                        }
                        queue.append(s)
                        pass.insert(s)
                    }
                }
            }
        }
        
        return -1
    }
}

let s = Solution()
s.snakesAndLadders([[1,1,-1],[1,1,1],[-1,1,1]]

)

