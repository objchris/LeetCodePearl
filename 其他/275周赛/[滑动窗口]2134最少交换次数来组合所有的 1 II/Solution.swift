/*
 2134. 最少交换次数来组合所有的 1 II
 https://leetcode-cn.com/problems/minimum-swaps-to-group-all-1s-together-ii/
 */
class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        let n = nums.count
        // 计算 1 的数量
        let cnt = nums.reduce(0, +)
        if cnt == 0 {
            return 0
        }
        var cur = 0
        for i in 0..<cnt {
            // 计算前 cnt 个数字中 0 的数量
            cur += (1 - nums[i])
        }
        var ans = cur
        // 开始滑动窗口
        for i in 1..<n {
            // 如果滑出窗口的数字为0，则 cur - 1
            if nums[i - 1] == 0 { cur -= 1 }
            // 如果滑入窗口的数字为1，则 cur + 1
            if nums[(i + cnt - 1) % n] == 0 { cur += 1 }
            // 取 0的总数 的最小值，就是需要转移的最少步数
            ans = min(ans, cur)
        }
        return ans
    }
}
