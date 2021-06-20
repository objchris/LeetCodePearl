// 单向链表
// 1600. 皇位继承顺序
// https://leetcode-cn.com/problems/throne-inheritance/

/* 1.
// 用Array实现多叉树，超时
struct Node {
    var name: String
    var live = 1        // 0 for death, 1 for live
    var children = [Node]()
}

class ThroneInheritance {
    
    var kingdom: Node

    init(_ kingName: String) {
        // 根节点
        kingdom = Node(name: kingName)
    }
    
    func birth(_ parentName: String, _ childName: String) {
        // 往树中添加节点
        birth(node: &kingdom, name: parentName, childName: childName)
    }
    
    // 递归添加
    func birth(node: inout Node, name: String, childName: String) -> Int {
        if (node.name == name) {
            node.children.append(Node(name: childName))
            return 1
        }
        for i in 0..<node.children.count {
            if birth(node: &node.children[i], name: name, childName: childName) == 1 {
                return 1
            }
        }
        return 0
    }
    
    func death(_ name: String) {
        // 将树中的某个节点设置为death
        death(node: &kingdom, name: name)
    }
    
    // 递归设置
    func death(node: inout Node, name: String) -> Int {
        if node.name == name {
            node.live = 0
            return 1
        }
        for i in 0..<node.children.count {
            if death(node: &node.children[i], name: name) == 1 {
                return 1
            }
        }
        return 0
    }
    
    func getInheritanceOrder() -> [String] {
        // 将树前序输出
        var ans = [String]()
        getOrder(node: kingdom, order: &ans)
        return ans
    }
    
    func getOrder(node: Node, order: inout [String]) {
        if node.live != 0 {
            order.append(node.name)
        }
        for child in node.children {
            getOrder(node: child, order: &order)
        }
    }
}
*/

/* 2.
 * 每个节点内均持有一个数组，birth 和 getInheritanceOrder 性能受影响
// 用 Dictionary 实现
import Foundation

class ThroneInheritance {
    
    var nodes = [String: [String]]()
    var kingName = ""
    var deathList = Set<String>()

    init(_ kingName: String) {
        self.kingName = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        if nodes[parentName] == nil {
            nodes[parentName] = [String]()
        }
        nodes[parentName]?.append(childName)
    }
    
    func death(_ name: String) {
        deathList.insert(name)
    }
    
    func getInheritanceOrder() -> [String] {
        var ans = [String]()
        func getOrder(name: String, order: inout [String]) {
            if !deathList.contains(name) {
                order.append(name)
            }
            for child in nodes[name] ?? [] {
                getOrder(name: child, order: &order)
            }
        }
        getOrder(name: kingName, order: &ans)
        return ans
    }

}
 */

// 3.
// 将 2. 中的数组去掉，使用单链
// 意外的是，差不了多少...?
class Node {
    var name: String
    var isDeath = false
    var next: Node?
    var last: Node?
    
    init(_ name: String) {
        self.name = name
    }
}

class ThroneInheritance {
    
    var nodes = [String: Node]()
    var kingName = ""

    init(_ kingName: String) {
        let node = Node(kingName)
        nodes[kingName] = node
        self.kingName = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        let childNode = Node(childName)
        var temp = nodes[parentName]
        while temp?.last != nil {
            temp = temp!.last
        }
        childNode.next = temp?.next
        temp?.next = childNode
        nodes[parentName]?.last = childNode
        nodes[childName] = childNode
    }
    
    func death(_ name: String) {
        nodes[name]?.isDeath = true
    }
    
    func getInheritanceOrder() -> [String] {
        var ans = [String]()
        var node = nodes[self.kingName]
        while node != nil {
            if !node!.isDeath {
                ans.append(node!.name)
            }
            node = node?.next
        }
        return ans
    }
    
}

