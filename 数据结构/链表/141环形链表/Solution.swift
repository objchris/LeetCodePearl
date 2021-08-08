/*
 141. 环形链表
 https://leetcode-cn.com/problems/linked-list-cycle/
 
 要求得链表中是否有环，有两种方法：
 1. 使用hash表记录经过的点，若重复访问到，则证明有环，时间复杂度和空间复杂度都是O(n)
 2. Floyd判圈算法（龟兔赛跑算法）：定义两个指针，一快一满。慢指针每次只移动一步，而快指针每次移动两步。
    初始时，慢指针在位置 head，而快指针在位置head.next。
    这样一来，如果在移动的过程中，快指针反过来追上慢指针，就说明该链表为环形链表。时间复杂度为O(n)，空间复杂度为O(1)
 
 Floyd判圈算法还能计算环的长度：当两个指针相遇时，让快指针不动，慢指针继续移动，直到两个指针再次相遇，即可得到长度
 如何确定环的起点：假设相遇点是A，在链表起点处添加一个慢指针，与在A点的慢指针一起移动，当两个慢指针相遇时，即为链表的起点。
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var low = head
        var fast = head?.next
        
        while low != nil && fast != nil {
            low = low!.next
            fast = fast!.next?.next

            if (low === fast) {
                return true
            }
        }
        return false

    }
}
