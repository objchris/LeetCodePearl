/*
 441. 排列硬币
 https://leetcode-cn.com/problems/arranging-coins/
 
 题意可转换为等差数列求和：即满足前 k 行所需要的硬币数为 k * (k + 1) / 2 个，
 用这个和与 n 比较，即可求出最大 k 值。因此用二分区间搜索可解
 */
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var l = 1, r = n
        while l < r {
            let mid = (l + r + 1) >> 1
            if mid * (mid + 1) <= n * 2 {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
}
