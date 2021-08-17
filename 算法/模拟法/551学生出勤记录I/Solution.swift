/*
 551. 学生出勤记录 I
 https://leetcode-cn.com/problems/student-attendance-record-i/
 */
class Solution {
    func checkRecord(_ s: String) -> Bool {
        var A = 0
        var L = 0
        for c in s {
            if String(c) == "L" {
                L += 1
                if L >= 3 {
                    return false
                }
                continue
            }
            L = 0
            if String(c) == "A" {
                A += 1
                if A >= 2{
                    return false
                }
            }
        }
        return true
    }
}
