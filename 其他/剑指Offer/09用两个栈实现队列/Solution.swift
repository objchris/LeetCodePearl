/*
 09. 用两个栈实现队列
 https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
 */
class CQueue {

    var store = [Int]()
    var delete = [Int]()

    init() {

    }
    
    func appendTail(_ value: Int) {
        store.append(value)
    }
    
    func deleteHead() -> Int {
        if delete.count == 0 && store.count == 0 {
            return -1
        }
        if delete.count == 0 {
            let count = store.count
            for i in 1...count {
                delete.append(store.removeLast())
            }
        }
        return delete.removeLast()
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
