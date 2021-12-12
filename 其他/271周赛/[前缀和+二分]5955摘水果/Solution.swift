/*
 5955. 摘水果
 https://leetcode-cn.com/problems/maximum-fruits-harvested-after-at-most-k-steps/
 
 1. 使用前缀和可以得出某个区间的总水果数量
 2. 使用二分法可快速查询总步数小于 k 的区间
 
 O(nlogn)
 */
class Solution {
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        let n = fruits.count
        func solve(_ l: Int, _ r: Int) -> Int {
            // 从 startPos 开始走完 [l,r] 这个区间所需要的最小步数
            var ret = 0
            if startPos >= fruits[r][0] {
                ret = startPos - fruits[l][0]
            } else if startPos <= fruits[l][0] {
                ret = fruits[r][0] - startPos
            } else {
                ret = fruits[r][0] - fruits[l][0] + min(startPos - fruits[l][0], fruits[r][0] - startPos)
            }
            return ret
        }
        // 前缀和
        var pre = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { pre[i + 1] = pre[i] + fruits[i][1] }
        var ans = 0
        // 遍历所有位置，以该位置为起点
        for i in 0..<n {
            // 二分求区间
            var l = i - 1, r = n - 1
            while l != r {
                let mid = (l + r + 1) >> 1
                let cur = solve(i, mid)
                if cur > k {
                    r = mid - 1
                } else {
                    l = mid
                }
            }
            let cur = pre[r + 1] - pre[i]
            ans = max(ans, cur)
        }
        return ans
    }
}

