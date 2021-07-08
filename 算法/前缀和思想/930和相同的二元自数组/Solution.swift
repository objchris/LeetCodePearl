/*
 [前缀和]930和相同的二元子数组
 https://leetcode-cn.com/problems/binary-subarrays-with-sum/
 */
class Solution {
    // 前缀和思想
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        let count = nums.count
        var arr = [Int](repeating: 0, count: count + 1)
        for i in 0..<count {
            arr[i+1] = arr[i] + nums[i]
        }
        var map = [Int: Int]()
        map[0] = 1
        var ans = 0
        for i in 1...count {
            let r = arr[i], l = r - goal
            ans += map[l] ?? 0
            map[r, default: 0] += 1
        }
        return ans
    }
}

