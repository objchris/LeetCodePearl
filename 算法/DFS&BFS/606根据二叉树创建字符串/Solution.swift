/*
606. 根据二叉树创建字符串
https://leetcode-cn.com/problems/construct-string-from-binary-tree/
*/
class Solution {
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        var ans = ""
        dfs(root, &ans)
        return ans
    }

    func dfs(_ node: TreeNode, _ ans: inout String) {
        ans += "\(node.val)"
        var hasLeft = false
        if let left = node.left {
            ans += "("
            dfs(left, &ans)
            ans += ")"
            hasLeft = true
        } 
        if let right = node.right {
            if !hasLeft { ans += "()" }
            ans += "("
            dfs(right, &ans)
            ans += ")"
        }
    }
}
