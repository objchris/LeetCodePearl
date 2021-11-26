/*
700. 二叉搜索树中的搜索
https://leetcode-cn.com/problems/search-in-a-binary-search-tree/

二叉搜索树的特点是：
1. 以节点的左节点为根节点的树，所有的值都比当前的值小
1. 以节点的右节点为根节点的树，所有的值都比当前的值大

*/
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == val { return root }
        else if root.val < val { return searchBST(root.right, val) }
        else { return searchBST(root.left, val) }
    }
}
