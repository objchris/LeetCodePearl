/*
 [BFS]671. 二叉树中第二小的节点
 https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree/
 
 广度优先搜索
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
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        var queue = [TreeNode]()
        queue.append(root)
        
        var ans = -1
        let rootVal = root.val
        while queue.count > 0 {
            let node = queue.removeFirst()
            if node.val != rootVal {
                ans = (ans == -1) ? node.val : min(ans, node.val)
            }
            if let left = node.left {
                if ans == -1 || (ans != -1 && left.val < ans) {
                    queue.append(left)
                }
            }
            if let right = node.right {
                if ans == -1 || (ans != -1 && right.val < ans) {
                    queue.append(right)
                }
            }
        }
        return ans

    }
}
