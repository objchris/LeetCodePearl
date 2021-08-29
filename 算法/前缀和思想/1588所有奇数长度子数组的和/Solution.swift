/*
 1588. 所有奇数长度子数组的和
 https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/
 */
class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        // 前缀和
        let n = arr.count
        var sums = [Int](repeating: 0, count: n + 1)
        var ans = 0
        for i in 1...n {
            sums[i] = sums[i - 1] + arr[i - 1]
        }
        for i in 0..<n {
            for j in (i+1)...n {
                if (j - i) % 2 != 0 {
                    ans += sums[j] - sums[i]
                }
            }
        }
        return ans
    }
}
