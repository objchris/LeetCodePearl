/*
1609. 奇偶树
https://leetcode-cn.com/problems/even-odd-tree/

BFS 模拟
*/
class Solution {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var odd = false
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let n = queue.count
            var cur = odd ? Int.max : Int.min
            for _ in 0..<n {
                let node = queue.removeFirst()
                if odd {
                    if node.val % 2 != 0 || cur <= node.val { return false }
                } else {
                    if node.val % 2 == 0 || cur >= node.val { return false }
                }
                cur = node.val
                if node.left != nil { queue.append(node.left!) }
                if node.right != nil { queue.append(node.right!) }
            }
            odd = !odd
        }
        return true
    }
}
