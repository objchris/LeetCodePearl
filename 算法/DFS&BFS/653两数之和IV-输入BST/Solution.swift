/*
653. 两数之和 IV - 输入 BST
https://leetcode-cn.com/problems/two-sum-iv-input-is-a-bst/
*/
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var arr = [Int]()
        dfs(root, &arr)
        let count = arr.count
        var l = 0, r = count - 1
        while l < r {
            if arr[l] + arr[r] == k { return true }
            else if arr[l] + arr[r] > k { r -= 1 }
            else { l += 1 }  
        }
        return false
    }

    func dfs(_ node: TreeNode?, _ arr: inout [Int]) {
        guard let node = node else { return }
        dfs(node.left, &arr)
        arr.append(node.val)
        dfs(node.right, &arr)
    }
}
