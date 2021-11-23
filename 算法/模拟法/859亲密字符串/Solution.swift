/*
 859. 亲密字符串
 https://leetcode-cn.com/problems/buddy-strings/
 
 满足条件的结果为以下两种之一：
 1. 两个字符串仅有两位不同
 2. 两个字符串完全相同，且其中有某个字符数量 >= 2
 */
class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        var arr1 = Array(s)
        var arr2 = Array(goal)
        guard arr1.count == arr2.count else { return false }
        var ch1 = [Int](repeating: 0, count: 26)
        var ch2 = [Int](repeating: 0, count: 26)
        let baseAscii = Character("a").asciiValue!
        var diff = 0
        for i in arr1.indices {
            let asc1 = Int(arr1[i].asciiValue! - baseAscii)
            let asc2 = Int(arr2[i].asciiValue! - baseAscii)
            ch1[asc1] += 1
            ch2[asc2] += 1
            if asc1 != asc2 {
                diff += 1
            }
        }
        var ok = false
        for i in 0..<26 {
            if ch1[i] != ch2[i] { return false }
            if ch1[i] > 1 { ok = true }
        }
        return diff == 2 || (diff == 0 && ok)
    }
}
