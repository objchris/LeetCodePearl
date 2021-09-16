/*
 208. 实现 Trie (前缀树)
 https://leetcode-cn.com/problems/implement-trie-prefix-tree/
 
 */
class Trie {

    var isWord = false
    var children = [Character: Trie]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = self
        for c in word {
            if node.children[c] == nil {
                node.children[c] = Trie()
            }
            node = node.children[c]!
        }
        node.isWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let prefix = searchPrefix(word)
        return prefix != nil && prefix!.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }

    private func searchPrefix(_ prefix: String) -> Trie? {
        var node = self
        for c in prefix {
            if node.children[c] == nil {
                return nil
            }
            node = node.children[c]!
        }
        return node
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
