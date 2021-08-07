/*
 457. 环形数组是否存在循环
 https://leetcode-cn.com/problems/circular-array-loop/
 
 */
class Solution {
    // O(n), O(n)
    func circularArrayLoop(_ nums: [Int]) -> Bool {

        let n = nums.count
        var loop = [Int: Int]() // visited indices : next indices
        var start = 0
        var i = 0
        while true {
            if loop[i] != nil {
                // 回到可能为循环的起始点
                start = i
                break
            }
            let next = (i + nums[i] + n) % n
            loop[i] = next
            i = next
        }

        var count = 1
        var pos = nums[start] > 0
        var cur = (start + nums[start] + n) % n
        while cur != start {
            if (nums[cur] > 0) != pos {
                return false
            }
            count += 1
            cur = (cur + nums[cur] + n) % n
        }
        return count > 1

    }
}
