/*
 30. 包含min函数的栈
 https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/
 
 // 用另一个栈存储最小的数
 */
class MinStack {

    var stack = [Int]()
    var minStack = [Int]()  // 用于保存最小数的栈

    init() {

    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            if minStack.last! >= x {
                minStack.append(x)
            }
        }
    }
    
    func pop() {
        let num = stack.removeLast()
        if let n = minStack.last, num == n {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func min() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */
