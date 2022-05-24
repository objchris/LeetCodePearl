/*
965. 单值二叉树
https://leetcode.cn/problems/univalued-binary-tree/
*/
class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return root.val == (root.left != nil ? root.left!.val : root.val) &&
               root.val == (root.right != nil ? root.right!.val : root.val) &&
               isUnivalTree(root.left) &&
               isUnivalTree(root.right)
    }
}
