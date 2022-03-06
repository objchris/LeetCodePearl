/*
2100. 适合打劫银行的日子
https://leetcode-cn.com/problems/find-good-days-to-rob-the-bank/
*/
class Solution {
    func goodDaysToRobBank(_ security: [Int], _ time: Int) -> [Int] {
        let n = security.count
        var g = [Int](repeating: 0, count: n)
        for i in 1..<n {
            if security[i] == security[i - 1] { continue }
            g[i] = security[i] > security[i - 1] ? 1 : -1
        }
        var a = [Int](repeating: 0, count: n + 1)
        var b = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            a[i] = a[i - 1] + (g[i - 1] == 1 ? 1 : 0)
            b[i] = b[i - 1] + (g[i - 1] == -1 ? 1 : 0)
        }
        var ans = [Int]()
        var i = time 
        while i < n - time {
            let c1 = a[i + 1] - a[i + 1 - time], c2 = b[i + 1 + time] - b [i + 1]
            if c1 == 0 && c2 == 0 { ans.append(i) }
            i += 1
        }
        return ans
    }
}
