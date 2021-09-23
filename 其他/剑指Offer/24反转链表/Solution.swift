/*
 剑指 Offer 24. 反转链表
 https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var next = head
        var prev: ListNode? = nil
        var ans: ListNode? = nil
        while next != nil {
            let temp = next?.next
            ans = next
            ans?.next = prev
            prev = ans
            next = temp
        }
        return ans
    }
}
