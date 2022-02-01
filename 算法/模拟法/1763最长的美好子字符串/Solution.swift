/*
1763. 最长的美好子字符串
https://leetcode-cn.com/problems/longest-nice-substring/
*/
class Solution {
    let a = Character("a").asciiValue!
    let z = Character("z").asciiValue!
    let A = Character("A").asciiValue!

    func longestNiceSubstring(_ s: String) -> String {
        let arr = Array(s), n = arr.count
        var idx = -1, len = 0
        for i in 0..<n {
            var t1 = 0, t2 = 0
            for j in i..<n {
                let c = arr[j], ascii = c.asciiValue!
                if ascii >= a && ascii <= z {
                    t1 |= (1 << Int(ascii - a))
                } else {
                    t2 |= (1 << Int(ascii - A))
                }
                if t1 == t2 && j - i + 1 > len {
                    idx = i
                    len = j - i + 1
                }
            }
        }
        return idx == -1 ? "" : String(arr[idx..<(idx + len)])
    }
}

