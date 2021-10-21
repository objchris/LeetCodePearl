/*
 66. 加一
 https://leetcode-cn.com/problems/plus-one/
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        while i >= 0 {
            digits[i] = digits[i] == 9 ? 0 : digits[i] + 1
            if digits[i] != 0 {
                break
            }
            i -= 1
        }
        if digits[0] == 0 {
            digits.insert(1, at: 0)
        }
        return digits
    }
}
