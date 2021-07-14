/**
 [二分法]1818. 绝对差值和
 https://leetcode-cn.com/problems/minimum-absolute-sum-difference/
 
 连续计算差值，用二分法求是否有使得差值更小的方案，存放在 m 中，最后 sum - m 即是答案
 */

class Solution {
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {

        let n = nums1.count
        let mod = Int(1e9 + 7)
        let sorted = nums1.sorted()
        var sum = 0, m = 0
        for i in nums1.indices {
            let a = nums1[i], b = nums2[i]
            if a == b {
                continue
            }
            let x = abs(a - b)
            sum += x
            var l = 0, r = n - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if sorted[mid] <= b {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            var nd = abs(sorted[r] - b)
            // 此处需要再判断 r + 1，是因为二分最后得到的结果 sorted[r] 总是比 b 小的，
            // 可能存在 sorted[r + 1] > b > sorted[r]
            // sorted[r + 1] - b < b - sorted[r]
            if r + 1 < n {
                nd = min(nd, abs(sorted[r + 1] - b))
            }
            if nd < x {
                m = max(m, x - nd)
            }
        }
        return (sum - m) % mod
        
    }
}

