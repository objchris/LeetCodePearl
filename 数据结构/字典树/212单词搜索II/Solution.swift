/*
 212. 单词搜索 II
 https://leetcode-cn.com/problems/word-search-ii/
 */

/* 使用 DFS 遍历整个 board 。 TLE
class Solution {
    var boards: [[Character]]! = nil
    var ans = Set<String>()

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        boards = board
        var map = [Character:[[Int]]]()
        for i in board.indices {
            for j in board[i].indices {
                map[board[i][j], default:Array()].append([i , j])
            }
        }
        var visited = Set<String>()
        for word in words {
            if let firstCharacter = word.first, let startPos = map[firstCharacter] {
                for pos in startPos {
                    if ans.contains(word) {
                        break
                    }
                    dfs(pos, &visited, 0, word)
                }
            }
        }
        return Array(ans)
    }

    func nextPositions(_ current: [Int], _ visited: Set<String>) -> [[Int]] {
        let i = current[0]
        let j = current[1]
        var ret = [[Int]]()
        if i - 1 >= 0 && !visited.contains("\(i-1)_\(j)") {
            ret.append([i-1, j])
        }
        if i + 1 < boards.count && !visited.contains("\(i+1)_\(j)") {
            ret.append([i+1, j])
        }
        if j - 1 >= 0 && !visited.contains("\(i)_\(j-1)") {
            ret.append([i, j-1])
        }
        if j + 1 < boards[0].count && !visited.contains("\(i)_\(j+1)") {
            ret.append([i, j+1])
        }
        return ret
    }

    func dfs(_ current: [Int], _ visited: inout Set<String>, _ index: Int, _ word: String) {
        if index+1 >= word.count {
            ans.insert(word)
            return
        }
        let wordArr = Array(word)
        visited.insert("\(current[0])_\(current[1])")
        let next = nextPositions(current, visited)
        for p in next {
            if (boards[p[0]][p[1]] == wordArr[index + 1]) {
                dfs(p, &visited, index + 1, word)
            }
        }
        visited.remove("\(current[0])_\(current[1])")
    }
}
*/

// 使用前缀树
class Solution {
    let dirs = [[1,0], [-1, 0], [0, 1], [0, -1]]

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        var `board` = board
        var ans = Set<String>()
        for i in board.indices {
            for j in board[0].indices {
                dfs(&board, trie, i, j, &ans)
            }
        }
        return Array(ans)
    }

    func dfs(_ board: inout [[Character]], _ now: Trie, _ i: Int, _ j: Int, _ ans: inout Set<String>) {
        if now.children[board[i][j]] == nil {
            return
        }

        let ch = board[i][j]
        var next = now.children[board[i][j]]!
        if next.word != "" {
            ans.insert(next.word)
        }

        board[i][j] = "#"
        for dir in dirs {
            let i1 = i + dir[0], j1 = j + dir[1]
            if i1 >= 0 && i1 < board.count && j1 >= 0 && j1 < board[0].count {
                dfs(&board, next, i1, j1, &ans)
            }
        }
        board[i][j] = ch

    }
}

class Trie {
    
    var word: String = ""
    var children = [Character: Trie]()

    func insert(_ word: String) {
        var node = self
        for c in word {
            if node.children[c] == nil {
                node.children[c] = Trie()
            }
            node = node.children[c]!
        }
        node.word = word
    }

}
