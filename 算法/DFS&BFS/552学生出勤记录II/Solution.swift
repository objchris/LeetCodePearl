/*
 552. 学生出勤记录 II
 https://leetcode-cn.com/problems/student-attendance-record-ii/
 */
class Solution {
    // 记忆化搜索：DFS
    func checkRecord(_ n: Int) -> Int {
        let mod:Int = Int(1e9) + 7
        var cache = [[[Int]]](repeating: [[Int]](repeating:[Int](repeating: 0, count: 3), count: 2), count: n + 1)
        
        for i in 0...n {
            for j in 0..<2 {
                for k in 0..<3 {
                    cache[i][j][k] = -1
                }
            }
        }

        func dfs(_ left: Int, _ acnt: Int, _ lcnt: Int) -> Int {
            if acnt >= 2 { return 0 }
            if lcnt >= 3 { return 0 }
            if left == 0 { return 1 }
            // 若发现搜索过，则返回已得到的值
            if cache[left][acnt][lcnt] != -1 { return cache[left][acnt][lcnt] }
            var ans = 0
            ans = dfs(left - 1, acnt + 1, 0) % mod // A
            ans = (ans + dfs(left - 1, acnt, lcnt + 1)) % mod // L
            ans = (ans + dfs(left - 1, acnt, 0)) % mod
            cache[left][acnt][lcnt] = ans
            return ans
        }

        return dfs(n, 0, 0)
    }
}
