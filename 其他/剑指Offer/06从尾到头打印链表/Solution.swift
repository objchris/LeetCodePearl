/*
 06. 从尾到头打印链表
 https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
 */
class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var node = head
        var ans = [Int]()
        while node != nil {
            ans = [node!.val] + ans
            node = node!.next
        }
        return ans
    }
}
