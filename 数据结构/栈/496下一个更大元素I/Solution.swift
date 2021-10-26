/*
 496. 下一个更大元素 I
 https://leetcode-cn.com/problems/next-greater-element-i/
 */
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var map = [Int: Int]()
        var ans = [Int]()
        for n in nums2 {
            while !stack.isEmpty && n > stack.last!  {
                var k = stack.removeLast()
                map[k] = n
            }
            stack.append(n)
        }
        for n in nums1 {
            ans.append(map[n, default: -1])
        }
        return ans
    }
}
