/*
 [贪心]1846. 减小和重新排列数组后的最大元素
 https://leetcode-cn.com/problems/maximum-element-after-decreasing-and-rearranging/
 
 */
class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        
        var sorted = arr.sorted()
        sorted[0] = 1
        for i in 1..<sorted.count {
            if sorted[i] - sorted[i - 1] > 1 {
                sorted[i] = sorted[i - 1] + 1
            }
        }
        return sorted.last!
        
    }
}

let s = Solution()
s.maximumElementAfterDecrementingAndRearranging([0, 1,1 ,2,3,5,6,6,7])
