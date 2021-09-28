/*
 437. 路径总和 III
 https://leetcode-cn.com/problems/path-sum-iii/
 
 DFS + DFS
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
    var ans = 0
    var t = 0

    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        t = targetSum
        dfs1(root)
        return ans
    }

    func dfs1(_ node: TreeNode?) {
        guard let node = node else { return }
        dfs2(node, node.val)
        dfs1(node.left)
        dfs1(node.right)
    }

    func dfs2(_ node: TreeNode, _ val: Int) {
        if val == t { ans += 1 }
        if let left = node.left { dfs2(left, val + left.val) }
        if let right = node.right { dfs2(right, val + right.val) }
    }
}
