/*
890. 查找和替换模式
https://leetcode.cn/problems/find-and-replace-pattern/
*/
class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var ans = [String]()
        for w in words {
            if p(w, pattern) { 
                ans.append(w)
            }
        }
        return ans
    }

    func p(_ word: String, _ pattern: String) -> Bool {
        let arr1 = Array(word), arr2 = Array(pattern)
        var map = [Character: Character]()
        for i in arr1.indices {
            guard let c = map[arr2[i]] else { 
                map[arr2[i]] = arr1[i]
                continue 
            }
            if c != arr1[i] {
                return false
            }
        }
        return Set(map.values).count == map.keys.count
    }
}
