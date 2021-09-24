/*
 430. 扁平化多级双向链表
 https://leetcode-cn.com/problems/flatten-a-multilevel-doubly-linked-list/
 */
class Solution {
    func flatten(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        var node: Node? = head
        while node != nil {
            if node?.child != nil {
                let next = node?.next
                // 获取子链表
                let temp = flatten(node?.child)
                // 修改头
                temp?.prev = node
                node?.next = temp
                node?.child = nil
                while node?.next != nil {
                    node = node?.next
                }
                // 修改尾
                next?.prev = node
                node?.next = next
            }
            node = node?.next
        }
        return head
    }
}
