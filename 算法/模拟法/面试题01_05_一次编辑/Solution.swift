/*
面试题 01.05. 一次编辑
https://leetcode.cn/problems/one-away-lcci/
*/
class Solution {
    func oneEditAway(_ first: String, _ second: String) -> Bool {
        let m = first.count, n = second.count
        guard abs(m - n) <= 1 else { return false }
        if m > n {
            return oneEditAway(second, first)
        }
        let a1 = Array(first), a2 = Array(second)
        var i = 0, j = 0, cnt = 0
        while i < m && j < n && cnt <= 1 {
            if a1[i] == a2[j] {
                i += 1 
                j += 1
            } else {
                if m == n {
                    cnt += 1
                    i += 1
                    j += 1
                } else {
                    cnt += 1
                    j += 1
                }
            }
        }
        return cnt <= 1  
    }
}
