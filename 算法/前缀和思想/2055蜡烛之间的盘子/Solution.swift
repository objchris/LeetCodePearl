/*
2055. 蜡烛之间的盘子
https://leetcode-cn.com/problems/plates-between-candles/
*/
class Solution {
    func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
        let n = s.count
        let arr = Array(s)
        var preSum = [Int](repeating: 0, count: n)
        var sum = 0
        for i in 0..<n {
            if arr[i] == "*" { sum += 1 }
            preSum[i] = sum
        }

        var left = [Int](repeating: 0, count: n)
        var l = -1
        for i in 0..<n {
            if arr[i] == "|" { l = i }
            left[i] = l
        }

        var right = [Int](repeating: 0, count: n)
        var r = -1
        for i in (0..<n).reversed() {
            if arr[i] == "|" { r = i }
            right[i] = r
        }

        var ans = [Int](repeating: 0, count: queries.count)
        for i in queries.indices {
            let query = queries[i]
            let x = right[query[0]], y = left[query[1]]
            if x == -1 || y == -1 || x >= y {
                ans[i] = 0
            } else {
                ans[i] = preSum[y] - preSum[x]
            }
        }
        return ans

    }
}
