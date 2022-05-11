/*
449. 序列化和反序列化二叉搜索树
https://leetcode.cn/problems/serialize-and-deserialize-bst/
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var re = ""
        backTraverse(root: root, str: &re)
        return re
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var nodeStrs = data.split(separator: "!")
        return build(queue: &nodeStrs)
    }
    
    private func backTraverse(root: TreeNode?,str:inout String){
        if root == nil { str += "#!" }
        else {
            backTraverse(root: root?.left, str: &str)
            backTraverse(root: root?.right, str: &str)
            str += "\(root!.val)!"
        }
    }
    
    private func build(queue:inout[String.SubSequence])->TreeNode? {
        let last = queue.removeLast()
        if last == "#" { return nil }
        let node = TreeNode(Int(last)!)
        node.right = build(queue: &queue)
        node.left = build(queue: &queue)
        return node
    }
}



/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/
