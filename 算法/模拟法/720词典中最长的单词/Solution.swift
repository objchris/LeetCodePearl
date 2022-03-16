/*
720. 词典中最长的单词
https://leetcode-cn.com/problems/longest-word-in-dictionary/
*/
class Solution {
    func longestWord(_ words: [String]) -> String {
        let words = words.sorted { a, b in
            if a.count != b.count { return a.count < b.count }
            else { return a > b }
        }
        var set = Set<String>()
        var ans = ""
        set.insert(ans)
        for w in words {
            if set.contains(String(w.dropLast())) {
                set.insert(w)
                ans = w
            }
        }
        return ans
    }
}
