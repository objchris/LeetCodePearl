/*
 剑指 Offer 22. 链表中倒数第k个节点

 模拟 双指针
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
    // 遍历两次
    func getKthFromEnd_2(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node!.next
        }
        var ans = head
        while count > k {
            ans = ans!.next
            count -= 1
        }
        return ans
    }
    
    // 双指针
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var fast: ListNode? = head
        for _ in 0 ..< k {
            fast = fast?.next
        }
        
        var slow: ListNode? = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}
