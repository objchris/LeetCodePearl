/*
 [前中后序遍历]297.二叉树的序列化与反序列化
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        func dfs(_ node: TreeNode?) -> String {
            guard let n = node else {
                return "n,"
            }
            var ret = ""
            ret += "\(n.val),"
            ret += dfs(n.left)
            ret += dfs(n.right)
            return ret
        }
        return String(dfs(root).dropLast())
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let nums = data.split(separator: ",")
        var index = 0
        func dfs() -> TreeNode? {
            guard index < nums.count, nums[index] != "n" else {
                return nil
            }
            let node = TreeNode(Int(nums[index])!)
            index += 1
            node.left = dfs()
            index += 1
            node.right = dfs()
            return node
        }
        return dfs()
    }
}

let t = TreeNode(1)
t.left = TreeNode(2)

let t1 = TreeNode(3)
t1.left = TreeNode(4)
t1.right = TreeNode(5)
 
t.right = t1
 
let c = Codec()
let s = c.serialize(t)
c.deserialize("1,2,n,n,3,4,n,n,5,n,n")
