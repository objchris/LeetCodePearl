/*
 5874. 分割数组的最多方案数
 https://leetcode-cn.com/problems/maximum-number-of-ways-to-partition-an-array/
 */
class Solution {
    func waysToPartition(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var sums = [Int](repeating: 0, count: n + 1)
        var mapL = [Int: Int](), mapR = [Int: Int]()
        var ans = 0

        for i in 1...n {
            sums[i] = sums[i - 1] + nums[i - 1]
            if i != n {
                mapR[sums[i], default: 0] += 1
            }
        }
        if sums[n] % 2 == 0 {
            // 能整除，才能符合 sums[n] - sums[i] = sums[i] 的条件
            ans = mapR[sums[n] / 2, default: 0]
        }
        for i in 0..<n {
            let dif = k - nums[i]
            if (sums[n] + dif) % 2 == 0 {
                ans = max(ans, mapL[(sums[n] + dif) / 2, default: 0] + mapR[(sums[n] - dif) / 2, default : 0])
            }
            mapL[sums[i + 1], default: 0] += 1
            mapR[sums[i + 1], default: 0] -= 1
        }

        return ans
    }
}
