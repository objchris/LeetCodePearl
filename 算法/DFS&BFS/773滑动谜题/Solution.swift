/* [BFS]773滑动谜题
 在一个 2 x 3 的板上（board）有 5 块砖瓦，用数字 1~5 来表示, 以及一块空缺用 0 来表示.
 一次移动定义为选择 0 与一个相邻的数字（上下左右）进行交换.
 最终当板 board 的结果是 [[1,2,3],[4,5,0]] 谜板被解开。
 给出一个谜板的初始状态，返回最少可以通过多少次移动解开谜板，如果不能解开谜板，则返回 -1 。

 求最短路径，BFS
 1. 做好准备数据
 2. 建立queue来存储目标，选好泛型，比较固定
 3. 建立visit来记录已经访问过的节点，一般用set，随题而变，比较随缘
 4. 将初值都填好
 5. 队列非空开始循环，将队列中的元素依次取出来，找到每个元素可到达的节点，判断是否在visit中（是否访问过），没访问过进入队列，同时进入visit，标记为已访问，判断是否到达终止条件

 */

class Solution {
    
    private let marks:[[Int]] = [[1, 3], [0, 2, 4], [1, 5], [0, 4], [1, 3, 5], [2, 4]]
    
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        
        var start = ""
        for i in board.indices {
            for j in board[i].indices {
                start += "\(board[i][j])"
            }
        }
        var steps = 0
        var queue = [String]()
        var visit = Set<String>()
        queue.append(start)
        visit.insert(start)
        if visit.contains("123450") {
            return 0
        }
        
        while !queue.isEmpty {
            steps += 1
            let size = queue.count
            for _ in 0..<size {
                let state = queue.removeFirst()
                for next in getNextState(state) {
                    if !queue.contains(next) && !visit.contains(next) {
                        if next == "123450" {
                            return steps
                        }
                        queue.append(next)
                        visit.insert(next)
                    }
                }
            }
        }
        
        return -1
        
    }
    
    private func getNextState(_ s: String) -> [String] {
        var index = 0
        for (i, char) in s.enumerated() {
            if (char == "0") {
                index = i
                break
            }
        }
        
        func swap(str: String, left: Int, right: Int) -> String {
            var charArray = str.map({$0})
            charArray.swapAt(left, right)
            return String(charArray)
        }
        
        var res = [String]()
        for i in marks[index].indices {
            res.append(swap(str: s, left: index, right: marks[index][i]))
        }
        return res
    }
}


let s = Solution()
s.slidingPuzzle([[4,1,2],[5,0,3]])

