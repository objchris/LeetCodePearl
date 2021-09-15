/*
 524. 通过删除字母匹配到字典里最长单词
 https://leetcode-cn.com/problems/longest-word-in-dictionary-through-deleting/submissions/
 */
class Solution {
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        var ans = ""
        for word in dictionary {
            if word.length >= ans.length && check(s, word) {
                if word.length > ans.length {
                    ans = word
                } else {
                    ans = compare(word, ans)
                }
            }
        }
        return ans
    }

    func check(_ s: String, _ word: String) -> Bool {
        let sArr = Array(s)
        let wordArr = Array(word)
        var i = 0, j = 0
        while i < sArr.count && j < wordArr.count {
            if sArr[i] == wordArr[j] {
                j += 1
            }
            if j >= wordArr.count {
                return true
            }
            i += 1
        }
        return false
    }

    func compare(_ l: String, _ r: String) -> String {
        let lArr = Array(l)
        let rArr = Array(r)
        for i in lArr.indices {
            if lArr[i].asciiValue! == rArr[i].asciiValue! {
                continue
            }
            if lArr[i].asciiValue! < rArr[i].asciiValue! {
                return l
            } else {
                return r
            }
        }
        return l
    }
}
