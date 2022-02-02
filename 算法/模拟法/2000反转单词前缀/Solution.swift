/*
2000. 反转单词前缀
https://leetcode-cn.com/problems/reverse-prefix-of-word/
*/
class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var arr = Array(word)
        var idx = 0
        for i in arr.indices {
            if arr[i] == ch {
                idx = i
                break
            }
        }
        var l = 0, r = idx 
        while l <= r {
            arr.swapAt(l, r)
            l += 1
            r -= 1
        }
        return arr.map{ String($0) }.joined(separator: "")
    }
}
