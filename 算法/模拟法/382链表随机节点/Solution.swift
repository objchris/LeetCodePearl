/*
382. 链表随机节点
https://leetcode-cn.com/problems/linked-list-random-node/

蓄水池抽样
*/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {

    var head: ListNode? = nil

    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var node = head, i = 0
        var ans = node?.val ?? 0
        while node != nil {
            let random = Int.random(in: 0...i)
            if random == 0 { ans = node!.val }
            node = node!.next
            i += 1
        }
        return ans
    }
    
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */
