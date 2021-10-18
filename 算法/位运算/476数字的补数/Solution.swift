/*
 476. 数字的补数
 https://leetcode-cn.com/problems/number-complement/
 */

class Solution {
    // O(log(num))
    func findComplement(_ num: Int) -> Int {
        var i = 1
        while i <= num { i *= 2 }
        return num ^ (i - 1)
    }
    
    // O(1)的方式求得从最高位1的位置开始，到最低位都是1的数
    func findComplement_O1(_ num: Int) -> Int {
        var i = num
        i |= (i >> 1)
        i |= (i >> 2)
        i |= (i >> 4)
        i |= (i >> 8)
        i |= (i >> 16)
        return num ^ i
    }
}
