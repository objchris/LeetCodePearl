/*
 559. N 叉树的最大深度
 https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/
 
 简单的DFS遍历
 */
class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var m = 0
        for child in root.children {
            m = max(m, maxDepth(child))
        }
        return 1 + m
    }
}
