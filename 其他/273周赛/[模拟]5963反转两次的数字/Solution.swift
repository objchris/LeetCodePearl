/*
 5963. 反转两次的数字
 https://leetcode-cn.com/problems/a-number-after-a-double-reversal/
 */
class Solution {
    func isSameAfterReversals(_ num: Int) -> Bool {
        let n = Int(String("\(num)".reversed()))!
        return Int(String("\(n)".reversed())) == num
    }
}
