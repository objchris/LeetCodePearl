/*
 [双指针]581. 最短无序连续子数组
 https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray/
 
 1. 先求左右两个递增区间
 2. 对中间区域的数进行遍历，不断调整左右两个区间
 3. 左右两个区间的距离就是答案
 */
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {

        let MIN = -100005, MAX = 100005
        let n = nums.count
        var i = 0, j = nums.count - 1
        while i < j && nums[i] <= nums[i + 1] { i += 1 }
        while i < j && nums[j] >= nums[j - 1] { j -= 1 }

        let l = i, r = j
        var minN = nums[i], maxN = nums[j]
        for t in l...r {
            if nums[t] < minN {
                while i >= 0 && nums[i] > nums[t] { i -= 1 }
                minN = (i >= 0 ? nums[i] : MIN)
            }
            if nums[t] > maxN {
                while j < n && nums[j] < nums[t] { j += 1 }
                maxN = (j < n ? nums[j] : MAX)
            }
        }
        return i == j ? 0 : (j - 1) - (i + 1) + 1

    }
}
