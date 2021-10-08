/*
 187. 重复的DNA序列
 https://leetcode-cn.com/problems/repeated-dna-sequences/
 
 哈希表存储
 */
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let arr = Array(s)
        guard arr.count > 10 else { return [] }
        var map = [String: Int]()
        for i in 0...arr.count - 10 {
            map[String(arr[i..<i+10]), default: 0] += 1
        }
        var ans = [String]()
        for (k, v) in map {
            if v >= 2 {
                ans.append(k)
            }
        }
        return ans
    }
}
