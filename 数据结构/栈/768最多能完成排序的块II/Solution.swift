/*
768. 最多能完成排序的块 II
https://leetcode.cn/problems/max-chunks-to-make-sorted-ii/
*/
class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var stack = [Int]()
        for num in arr {
            if stack.isEmpty || num >= stack.last! {
                stack.append(num)
            } else {
                let mx = stack.removeLast()
                while !stack.isEmpty && stack.last! > num {
                    stack.removeLast()
                }
                stack.append(mx)
            }
        }
        return stack.count
    }
}
