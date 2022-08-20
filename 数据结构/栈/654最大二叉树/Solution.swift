/*
654. 最大二叉树
https://leetcode.cn/problems/maximum-binary-tree/
*/
class Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        let idx = indexOfMaxValueInArray(nums)
        let ans = TreeNode(nums[idx])
        ans.left = constructMaximumBinaryTree(Array(nums[0..<idx]))
        ans.right = constructMaximumBinaryTree(Array(nums[idx+1..<nums.count]))
        return ans
    }

    func indexOfMaxValueInArray(_ nums: [Int]) -> Int {
        var idx = 0, mx = Int.min
        for i in nums.indices {
            if nums[i] > mx {
                idx = i
                mx = nums[i]
            }
        }
        return idx
    }
}
