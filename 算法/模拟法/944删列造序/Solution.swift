/*
944. 删列造序
https://leetcode.cn/problems/delete-columns-to-make-sorted/
*/
class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let chars = strs.map{ Array($0) }
        let m = chars.count, n = chars[0].count
        var ans = 0
        for j in 0..<n {
            for i in 1..<m {
                if chars[i][j] < chars[i - 1][j] {
                    ans += 1
                    break
                }
            }
        }
        return ans
    }
}
