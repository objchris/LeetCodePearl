/*
472. 连接词
https://leetcode-cn.com/problems/concatenated-words/

前缀树 + DFS
*/
class Solution {
    
    class Trie {
        var children = [Character: Trie]()
        var isWord = false
    }

    let trie = Trie()

    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        let words = words.sorted { $0.count < $1.count }
        var ans = [String]()
        for word in words {
            if word.count == 0 { continue }
            let arr = Array(word)
            if dfs(arr, 0) {
                ans.append(word)
            } else {
                insert(arr)
            }
        }
        return ans
    }

    func dfs(_ arr:[Character], _ idx: Int) -> Bool {
        if idx == arr.count { return true }
        var node = trie
        for i in idx..<arr.count {
            let c = arr[i]
            if node.children[c] == nil { return false }
            node = node.children[c]!
            if node.isWord {
                if dfs(arr, i + 1) {
                    return true
                }
            }
        }
        return false
    }
    
    func insert(_ arr: [Character]) {
        var node = trie
        for c in arr {
            if node.children[c] == nil {
                node.children[c] = Trie()
            }
            node = node.children[c]!
        }
        node.isWord = true
    }

}
