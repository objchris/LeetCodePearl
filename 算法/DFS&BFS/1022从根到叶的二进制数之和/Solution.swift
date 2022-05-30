/*
1022. 从根到叶的二进制数之和
https://leetcode.cn/problems/sum-of-root-to-leaf-binary-numbers/
*/
class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var ans = 0
        dfs(root, 0, &ans)
        return ans
    }

    func dfs(_ node: TreeNode?, _ cur: Int, _ ans: inout Int) {
        guard let node = node else { return }
        let ne = (cur << 1) | node.val
        if node.left == nil && node.right == nil {
            ans += ne
        }
        dfs(node.left, ne, &ans)
        dfs(node.right, ne, &ans)
    }
}
