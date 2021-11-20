/*
563. 二叉树的坡度
https://leetcode-cn.com/problems/binary-tree-tilt/
*/
class Solution {
    func findTilt(_ root: TreeNode?) -> Int {
        var ans = 0
        dfs(root, &ans)
        return ans
    }

    func dfs(_ root: TreeNode?, _ ans: inout Int) {
        guard let root = root else { return }
        dfs(root.left, &ans)
        dfs(root.right, &ans)
        ans += abs((root.left?.val ?? 0) - (root.right?.val ?? 0))
        root.val += root.left?.val ?? 0
        root.val += root.right?.val ?? 0
    }
}
