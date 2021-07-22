/*
 138. 复制带随机指针的链表
 https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 */
class Solution {
    var map = [Node: Node]()
    func copyRandomList(_ head: Node?) -> Node? {
        
        guard let head = head else {
            return nil
        }
        if (map[head] != nil) {
            return map[head]
        }
        let newNode = Node(head.val)
        map[head] = newNode
        newNode.next = copyRandomList(head.next)
        newNode.random = copyRandomList(head.random)
        return newNode
        
    }
}

