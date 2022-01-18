/*
539. 最小时间差
https://leetcode-cn.com/problems/minimum-time-difference/

排序后计算两两之间的最小值
*/
class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        let sorted = timePoints.map { point -> Int in
            let components = point.split(separator: ":") 
            return Int(components[0])! * 60 + Int(components[1])!
        }.sorted(by: <)
        let n = sorted.count
        var ans = Int.max
        for i in 1..<n {
            ans = min(ans, sorted[i] - sorted[i - 1])
        }
        ans = min(ans, 24 * 60 - sorted[n - 1] + sorted[0])
        return ans
    }
}
