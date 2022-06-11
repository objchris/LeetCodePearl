/*
926. 将字符串翻转到单调递增
https://leetcode.cn/problems/flip-string-to-monotone-increasing/
*/
class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        let arr = Array(s), n = arr.count
        guard n > 1 else { return 0 }
        var dp0 = 0, dp1 = 0
        for i in 0..<n {
            let c = arr[i]
            var dp0N = dp0, dp1N = min(dp0, dp1)
            if c == "1" {
                dp0N += 1
            } else {
                dp1N += 1
            }
            dp0 = dp0N
            dp1 = dp1N
        }
        return min(dp0, dp1)
    }
}
