/*
 237. 删除链表中的节点
 https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let node = node else { return }
        node.val = node.next!.val
        node.next = node.next!.next
    }
}
