/*
590. N 叉树的后序遍历
https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/

我的题解：https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/solution/by-objchris-bpf9/
*/
// 递归解
class Solution1 {
    func postorder(_ root: Node?) -> [Int] {
    	guard let root = root else { return [] }
        var ans = [Int]()
        dfs(root, &ans)
        return ans
    }

    func dfs(_ node: Node, _ ans: inout [Int]) {
        for child in node.children {
            dfs(child, &ans)
        }
        ans.append(node.val)
    }
}

// 迭代解法1
extension Node: Hashable {
    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }

    public static func == (_ lhs: Node, _ rhs: Node) -> Bool {
        return lhs === rhs
    }
}
class Solution2 {
    func postorder(_ root: Node?) -> [Int] {
    	guard let root = root else { return [] }
        var ans = [Int]()
        var stack = [Node]()
        var vis = [Node: Bool]()
        stack.append(root)
        while !stack.isEmpty {
            var last = stack.last!
            if vis[last, default: false] {
                stack.removeLast()
                ans.append(last.val)
                continue
            }
            vis[last] = true
            for child in last.children.reversed() {
                stack.append(child)
            }
        }
        return ans
    }
}

// 迭代解法2
class Solution2 {
    func postorder(_ root: Node?) -> [Int] {
    	guard let root = root else { return [] }
        var ans = [Int]()
        var stack = [Node]()
        stack.append(root)
        while !stack.isEmpty {
            var last = stack.removeLast()
            ans.append(last.val)
            for child in last.children {
                stack.append(child)
            }
        }
        return ans.reversed()
    }
}
