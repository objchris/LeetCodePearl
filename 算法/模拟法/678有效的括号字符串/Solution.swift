/*
 678. 有效的括号字符串
 https://leetcode-cn.com/problems/valid-parenthesis-string/
 */
class Solution {
    func checkValidString(_ s: String) -> Bool {
        var arr = Array(s)
        var left = [Int](), star = [Int]()
        for i in 0..<arr.count {
            if arr[i] == "(" { left.append(i) }
            if arr[i] == "*" { star.append(i) }
            if arr[i] == ")" {
                if left.count == 0 {
                    if star.count == 0 {
                        return false
                    }
                    star.removeLast()
                } else {
                    left.removeLast()
                }
            }
        }
        if left.count > star.count {
            return false
        }
        while left.count > 0 && star.count > 0 {
            if left.removeLast() > star.removeLast() {
                return false
            }
        }
        return true
    }
}
