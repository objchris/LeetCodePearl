/*
 160. 相交链表
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 
 此题要求判断两个节点是否为同一个节点，因此 while 循环中使用 !==
 如何判断两条链表是否有相交：
 
 考虑构建两个节点指针 A​ , B 分别指向两链表头节点 headA , headB ，做如下操作：

 1、指针 A 先遍历完链表 headA ，再开始遍历链表 headB
 2、指针 B 先遍历完链表 headB ，再开始遍历链表 headA

 两个指针会在某一个节点重合或同时为 nil（两条链表无交集，最终指针去到另一条链表的终点），返回该节点或 nil

 本题的解答中很多爱情见解，哈哈哈哈，受不了
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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

        var pa = headA, pb = headB
        while pa !== pb {
            pa = (pa != nil) ? pa?.next : headB
            pb = (pb != nil) ? pb?.next : headA
        }
        return pa
        
    }
}

