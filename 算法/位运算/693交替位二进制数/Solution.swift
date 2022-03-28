/*
693. 交替位二进制数
https://leetcode-cn.com/problems/binary-number-with-alternating-bits/
*/
class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        let x = n ^ (n >> 1)
        return (x & (x + 1)) == 0
    }
}
