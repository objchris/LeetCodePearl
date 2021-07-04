/*
 [计数]645错误的集合
 https://leetcode-cn.com/problems/set-mismatch/
 
 一次循环计数，另一次循环统计
 时间复杂度O(n)
 空间复杂度O(n)
 */
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var ans = [Int](repeating: 0, count: 2)
        var arr = [Int](repeating: 0, count: 10001)
        for i in nums.indices {
            arr[nums[i]] += 1
        }
        for i in 1...nums.count {
            if arr[i] == 0 {
                ans[1] = i
            }
            if arr[i] > 1 {
                ans[0] = i
            }
        }
        return ans
    }
}

let s = Solution()
s.findErrorNums([1,2,2,4])

