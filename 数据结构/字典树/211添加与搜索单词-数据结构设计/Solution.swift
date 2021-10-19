/*
 211. 添加与搜索单词 - 数据结构设计
 https://leetcode-cn.com/problems/design-add-and-search-words-data-structure/
 */
class WordDictionary {

    class Trie {
        var isWord: Bool = false
        var children = [Character: Trie]()

        func addWord(_ word: String) {
            var node = self
            for c in word {
                if node.children[c] == nil {
                    node.children[c] = Trie()
                }
                node = node.children[c]!
            }
            node.isWord = true
        }

        func search(_ word: String) -> Bool {
            let pre = searchPrefix(word)
            return pre != nil && pre!.isWord
        }

        func searchPrefix(_ word: String) -> Trie? {
            var node = self
            for c in word {
                if node.children[c] == nil {
                    return nil
                }
                node = node.children[c]!
            }
            return node
        }
    }

    var trie = Trie()

    init() {

    }
    
    func addWord(_ word: String) {
        trie.addWord(word)
    }
    
    func search(_ word: String) -> Bool {
        let chars = Array(word)
        return dfs(chars, 0, trie)
    }

    func dfs(_ chars: [Character], _ index: Int, _ trie: Trie) -> Bool {
        if index == chars.count {
            return trie.isWord
        }
        let char = chars[index]
        if char == "." {
            for (_, v) in trie.children {
                if dfs(chars, index + 1, v) {
                    return true
                }
            }
        } else {
            if let t = trie.children[char], dfs(chars, index + 1, t) {
                return true
            }
        }
        return false
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
