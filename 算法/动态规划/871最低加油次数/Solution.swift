/*
871. 最低加油次数
https://leetcode.cn/problems/minimum-number-of-refueling-stops/
*/
class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        let n = stations.count
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = startFuel
        for i in 0..<n {
            for j in (0...i).reversed() {
                if dp[j] >= stations[i][0] {
                    dp[j + 1] = max(dp[j + 1], dp[j] + stations[i][1])
                }
            }
        }
        for i in 0...n {
            if dp[i] >= target {
                return i
            }
        }
        return -1
    }
}
