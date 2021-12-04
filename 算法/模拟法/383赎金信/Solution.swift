/*
383. 赎金信
https://leetcode-cn.com/problems/ransom-note/
*/
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var cnt = [Int](repeating: 0, count: 26)
        let ascii = Character("a").asciiValue!
        for c in magazine { cnt[Int(c.asciiValue! - ascii)] += 1 }
        for c in ransomNote {
            let idx = Int(c.asciiValue! - ascii)
            cnt[idx] -= 1
            if cnt[idx] < 0 { return false }
        }
        return true
    }
}
