/*
面试题 17.11. 单词距离
https://leetcode.cn/problems/find-closest-lcci/
*/
class Solution {
    func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var ans = Int.max
        var idx = -1, cur = ""
        for i in words.indices {
            if words[i] == word1 || words[i] == word2 {
                if idx != -1 && words[i] != cur {
                    ans = min(ans, i - idx)
                }
                idx = i
                cur = words[i]
            }
        }
        return ans
    }
}
