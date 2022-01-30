/*
884. 两句话中的不常见单词
https://leetcode-cn.com/problems/uncommon-words-from-two-sentences/

哈希表保存
*/
class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var arr1 = s1.split(separator: " ").map { String($0) }
        var arr2 = s2.split(separator: " ").map { String($0) }
        var map = [String: Int]()
        for w in arr1 {
            map[w, default: 0] += 1
        }
        for w in arr2 {
            map[w, default: 0] += 1
        }
        var ans = [String]()
        for (k, v) in map {
            if v == 1 {
                ans.append(k)
            }
        }
        return ans
    }
}
