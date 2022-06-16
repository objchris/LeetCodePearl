/*
532. 数组中的 k-diff 数对
https://leetcode.cn/problems/k-diff-pairs-in-an-array/
*/
class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var ans = 0, j = -1
        for i in nums.indices {
            if i > 0 && nums[i] == nums[i - 1] { continue }
            if j <= i { j = i + 1 }
            while j < nums.count {
                let diff = nums[j] - nums[i]
                if diff == k {
                    ans += 1
                    break
                } else if diff < k {
                    j += 1
                } else {
                    break
                }
            }
        }
        return ans
    }
}
