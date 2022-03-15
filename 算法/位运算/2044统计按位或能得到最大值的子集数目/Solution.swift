/*
2044. 统计按位或能得到最大值的子集数目
https://leetcode-cn.com/problems/count-number-of-maximum-bitwise-or-subsets/
*/
// 状压 + 枚举
class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let n = nums.count, mask = 1 << n
        var maxV = 0, ans = 0
        for s in 0..<mask {
            var cur = 0
            for i in 0..<n {
                if ((s >> i) & 1) == 1 { cur |= nums[i] }
            }
            if cur > maxV {
                maxV = cur
                ans = 1
            } else if cur == maxV {
                ans += 1
            }
        }
        return ans
    }
}

