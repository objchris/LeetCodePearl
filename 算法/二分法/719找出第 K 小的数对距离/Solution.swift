/*
719. 找出第 K 小的数对距离
https://leetcode.cn/problems/find-k-th-smallest-pair-distance/
*/
class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var l = 0, r = Int(1e6)
        while l < r {
            let m = (l + r) >> 1
            if check(nums, m) >= k {
                r = m
            } else {
                l = m + 1
            }
        }
        return r
    }

    func check(_ nums: [Int], _ x: Int) -> Int {
        let n = nums.count
        var ans = 0
        var j = 1
        for i in 0..<n {
            while j < n && nums[j] - nums[i] <= x {
                j += 1
            }
            ans += j - i - 1
        } 
        return ans
    }
}
