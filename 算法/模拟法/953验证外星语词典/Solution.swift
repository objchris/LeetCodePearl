/*
953. 验证外星语词典
https://leetcode.cn/problems/verifying-an-alien-dictionary/
*/
class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let map = order.reduce(into:[:]){ $0[$1] = $0.count }
        func isSorted(_ lhs: String, _ rhs: String) -> Bool {
            let a1 = Array(lhs), a2 = Array(rhs)
            let c1 = a1.count, c2 = a2.count
            var i = 0, j = 0
            while i < c1 && j < c2 {
                if map[a1[i]]! > map[a2[j]]! { return false }
                if map[a1[i]]! < map[a2[j]]! { return true }
                i += 1
                j += 1
            }
            return i == c1
        }
        for i in 0..<words.count - 1 {
            if !isSorted(words[i], words[i + 1]) { return false }
        }
        return true
    }
}
