/*
717. 1比特与2比特字符
https://leetcode-cn.com/problems/1-bit-and-2-bit-characters/
*/
class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var i = 0
        let n = bits.count
        while i < n - 1 {
            if (bits[i] == 0) { i += 1 }
            else { i += 2 }
        }
        return i == n - 1
    }
}
