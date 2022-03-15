/*
432. 全 O(1) 的数据结构
https://leetcode-cn.com/problems/all-oone-data-structure/
*/
class Node {
    var prev: Node?
    var next: Node?
    var keys = Set<String>()
    var count = 0

    convenience init() {
        self.init("", 0)
    }

    init(_ key: String, _ count: Int) {
        self.keys.insert(key)
        self.count = count
    }

    func insert(_ node: Node) -> Node {
        node.prev = self
        node.next = self.next
        node.prev?.next = node
        node.next?.prev = node
        return node
    }

    func remove() {
        self.prev?.next = self.next
        self.next?.prev = self.prev
    }

}

class AllOne {

    var root: Node
    var nodes: [String: Node]

    init() {
        root = Node()
        root.prev = root
        root.next = root
        nodes = [String: Node]()
    }
    
    func inc(_ key: String) {
        if nodes[key] != nil {
            let cur = nodes[key]!
            let next = cur.next!
            if next === root || next.count > cur.count + 1 {
                let new = cur.insert(Node(key, cur.count + 1))
                nodes[key] = new
            } else {
                next.keys.insert(key)
                nodes[key] = next
            }
            cur.keys.remove(key)
            if cur.keys.isEmpty {
                cur.remove()
            }
        } else {
            if root.next! === root || root.next!.count > 1 {
                let new = root.insert(Node(key, 1))
                nodes[key] = new
            } else {
                root.next!.keys.insert(key)
                nodes[key] = root.next
            }
        }
    }
    
    func dec(_ key: String) {
        let cur = nodes[key]!
        if cur.count == 1 {
            nodes.removeValue(forKey: key)
        } else {
            let prev = cur.prev!
            if prev === root || prev.count < cur.count - 1 {
                let new = prev.insert(Node(key, cur.count - 1))
                nodes[key] = new
            } else {
                prev.keys.insert(key)
                nodes[key] = prev
            }
        }
        cur.keys.remove(key)
        if cur.keys.isEmpty {
            cur.remove()
        }
    }
    
    func getMaxKey() -> String {
        return root.prev!.keys.first ?? ""
    }
    
    func getMinKey() -> String {
        return root.next!.keys.first ?? ""
    }
}
