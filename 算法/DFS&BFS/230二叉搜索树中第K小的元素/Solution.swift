/*
 230. 二叉搜索树中第K小的元素
 https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst/
 
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var node = root
        var k = k
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.removeLast()
            k -= 1
            if k == 0 {
                break
            }
            node = node!.right
        }
        return node!.val
    }

}
