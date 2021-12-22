/*
686. 重复叠加字符串匹配
https://leetcode-cn.com/problems/repeated-string-match/

1. 判断 a 和 b 中包含的字符是否相同，若 b 中拥有 a 中没有的字符，则无论 a 重复多少次，b 都不可能是 a 的子串
2. 假设 b 比 a 长，a 至少需要重复 b/a 次，才有可能让 b 成为其子串，在这个前提下，有三种情况满足题意：
  (1). a 直接包含 b，如 a = "abc", b = "abcabc"
  (2). a 再重复 1 次后包含 b，如 a = "abc", b = "abcabca"，即前或后需要重复一次
  (3). a 再重复 2 次后包含 b，如 a = "abc", b = "cabcabca"，前后各重复一次
3. 若第 2 点无法满足，无论 a 再重复多少次，都无法包含 b
*/
class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        let arr = Array(a), brr = Array(b)
        var counter = [Int](repeating: 0, count: 26)
        let baseAscii = Character("a").asciiValue!
        for c in arr {
            counter[Int(c.asciiValue! - baseAscii)] = 1
        }
        for c in brr {
            if counter[Int(c.asciiValue! - baseAscii)] == 0 { return -1 }
        }
        let repeatingCount = b.count / a.count
        var str = ""
        for i in 0..<repeatingCount {
            str += a
        }
        for i in 0...2 {
            if str.contains(b) {
                return repeatingCount + i
            }
            str += a
        }
        return -1
    }
}
