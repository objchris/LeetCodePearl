/*
429. N 叉树的层序遍历
https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
*/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
      guard let root = root else {
        return []
      }
      var queue = [Node]()
      queue.append(root)
      var ret = [[Int]]()
      while !queue.isEmpty {
        let size = queue.count
        var tempArray = [Int]()
        for _ in 0..<size {
          let node = queue.removeFirst()
          tempArray.append(node.val)
          for children in node.children {
            queue.append(children)
          }
        }
        ret.append(tempArray)
      }
      return ret  
    }
}
