/*
 35. 复杂链表的复制
 https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/
 */
class Solution {
    var map = [Node: Node]()
    func copyRandomList (_ n: Node?) -> Node? {
        guard let n = n else { return nil }
        if map[n] != nil { return map[n] }
        var newNode = Node(n.val)
        map[n] = newNode
        newNode.next = copyRandomList(n.next)
        newNode.random = copyRandomList(n.random)
        return newNode
    }
}
