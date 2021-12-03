/*
1005. K 次取反后最大化的数组和
https://leetcode-cn.com/problems/maximize-sum-of-array-after-k-negations/

1. 排序
2. 将负数变成正数，同时 k - 1
3. 求和 sum，和数组的最小值 minValue
4. 如果 k 不为 0，且 k 为奇数，用 sum - 2 * minValue
*/
class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var sorted = nums.sorted()
        var k = k
        for i in sorted.indices {
            if sorted[i] > 0 || k <= 0 {
                break
            }
            sorted[i] *= -1
            k -= 1
        }
        var ans = 0
        var minValue = Int.max
        for n in sorted {
            ans += n
            minValue = min(minValue, n)
        }
        if k > 0 && k % 2 == 1 {
            ans -= (minValue * 2)
        }
        return ans
    }
}
