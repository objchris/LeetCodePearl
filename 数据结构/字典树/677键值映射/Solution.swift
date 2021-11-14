/*
677. 键值映射
https://leetcode-cn.com/problems/map-sum-pairs/
*/
class MapSum {

    class Trie {
        var children = [Character: Trie]()
        var val = 0

        func insert(_ word: String, _ val: Int) {
            var node = self
            var arr = Array(word)
            for c in arr {
                if node.children[c] == nil {
                    node.children[c] = Trie()
                }
                node = node.children[c]!
            }
            node.val = val
        }
    }
    // 使用前缀树保存 Key ，求和时使用 dfs 进行树的遍历
    var trie = Trie()

    init() {

    }
    
    func insert(_ key: String, _ val: Int) {
        trie.insert(key, val)
    }
    
    func sum(_ prefix: String) -> Int {
        let arr = Array(prefix)
        var ans = 0
        var node: Trie? = trie
        for c in arr {
            node = node?.children[c]
        }
        if node != nil {
            ans += dfs(node!)
        }
        return ans
    }

    func dfs(_ node: Trie) -> Int {
        var ans = node.val
        for (k, v) in node.children {
            ans += dfs(v)
        }
        return ans
    }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */
