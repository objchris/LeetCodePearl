/*
648. 单词替换
https://leetcode.cn/problems/replace-words/
https://leetcode.cn/problems/replace-words/solution/qian-zhui-shu-by-objchris-ee1e/
*/
class Solution {

    class Trie {
        var children = [Character: Trie]()
        var isRoot = false

        func add(_ word: String) {
            var t = self
            for c in word {
                if t.children[c] == nil {
                    t.children[c] = Trie()
                }
                t = t.children[c]!
            }
            t.isRoot = true
        }

        func query(_ word: String) -> String {
            var t = self
            var ans = [Character]()
            for c in word {
                if t.children[c] == nil { return word }
                ans.append(c)
                if t.children[c]!.isRoot == true {
                    return String(ans)
                }
                t = t.children[c]!
            }
            return word
        }
    }

    let root = Trie()

    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        for d in dictionary {
            root.add(d)
        }
        var words = sentence.split(separator: " ").map{ String($0) }
        for i in words.indices {
            words[i] = root.query(words[i])
        }
        return words.joined(separator: " ")
    }

}
