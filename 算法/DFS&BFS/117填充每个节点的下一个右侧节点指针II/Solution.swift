/*
117. 填充每个节点的下一个右侧节点指针 II
https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node-ii/
*/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func handle(_ last: inout Node?, _ p: inout Node?, _ nextStart: inout Node?) {
        if last != nil {
            last!.next = p
        }
        if nextStart == nil {
            nextStart = p
        }
        last = p
    }

    func connect(_ root: Node?) -> Node? {
        if root == nil { return nil }
        var start = root 
        while start != nil {
            var last: Node? = nil, nextStart: Node? = nil
            var p = start
            while p != nil {
                if p!.left != nil {
                    handle(&last, &(p!.left), &nextStart)
                }
                if p!.right != nil {
                    handle(&last, &(p!.right), &nextStart)
                }
                p = p!.next
            }
            start = nextStart
        }
        return root 
    }
}
