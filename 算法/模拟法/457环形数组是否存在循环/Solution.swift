/*
 457. 环形数组是否存在循环
 https://leetcode-cn.com/problems/circular-array-loop/
 
 */
class Solution {

    func circularArrayLoop(_ nums: [Int]) -> Bool {

        var `nums` = nums
        for i in nums.indices where nums[i] != 0 {
            var slow = i
            var fast = next(nums, i)

            while nums[slow] * nums[fast] > 0 && nums[slow] * nums[next(nums, fast)] > 0 {
                if slow == fast {
                    // 判断是否在同一个位置上成环
                    if slow != next(nums, slow) {
                        return true
                    }
                    break
                }
                slow = next(nums, slow)
                fast = next(nums, next(nums, fast))
            }

            var add = i
            while nums[add] * nums[next(nums, add)] > 0 {
                let temp = add
                add = next(nums, add)
                nums[temp] = 0
            }

        }
        return false

    }

    func next(_ nums: [Int], _ cur: Int) -> Int {
        let n = nums.count
        //  cur + nums[cur] + n 可能为负数，负数取余为负，会数组下标越界
        // 因此 (cur + nums[cur]) 先取余，再加 n 可保证为正
        return ((cur + nums[cur]) % n + n) % n
    }

}

let s = Solution()
s.circularArrayLoop([2,-1,1,2,2])

