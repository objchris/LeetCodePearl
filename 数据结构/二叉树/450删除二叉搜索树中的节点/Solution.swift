/*
450. 删除二叉搜索树中的节点
https://leetcode.cn/problems/delete-node-in-a-bst/
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
    
    enum Side {
        case left
        case right
    }
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var ne = TreeNode()
        ne.right = root
        dfs(ne, ne.right, .right, key)
        return ne.right
    }
    
    func dfs(_ prev: TreeNode, _ node: TreeNode?, _ from: Side, _ key: Int) {
        guard let node = node else { return }
        if node.val == key {
            var next: TreeNode? = nil
            if node.left != nil {
                var temp = node.left
                while temp?.right != nil {
                    temp = temp?.right
                }
                temp?.right = node.right
                next = node.left
            } else {
                next = node.right
            }
            if from == .left {
                prev.left = next
            } else {
                prev.right = next
            }
        } else if node.val > key {
            dfs(node, node.left, .left, key)
        } else {
            dfs(node, node.right, .right, key)
        }
    }

}
