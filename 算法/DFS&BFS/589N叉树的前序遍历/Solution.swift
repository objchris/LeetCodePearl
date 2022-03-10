/*
589. N 叉树的前序遍历
https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
*/
// 递归
class Solution1 {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
    	var ans = [Int]()
        dfs(root, &ans)
        return ans
    }

    func dfs(_ node: Node, _ ans: inout [Int]) {
        ans.append(node.val)
        for child in node.children { dfs(child, &ans) }
    }
}

// 迭代
class Solution2 {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
    	var ans = [Int]()
        var stack = [Node]()
        stack.append(root)
        while !stack.isEmpty {
            let last = stack.removeLast()
            ans.append(last.val)
            for i in last.children.indices.reversed() {
                stack.append(last.children[i])
            }
        }
        return ans
    }
}
