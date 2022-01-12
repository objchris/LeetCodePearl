/*
1036. 逃离大迷宫
https://leetcode-cn.com/problems/escape-a-large-maze/
*/
public struct Queue<T> {
    fileprivate var arr = [T?]()
    fileprivate var head = 0

    public var isEmpty: Bool {
        return count == 0
    }

    public var count: Int {
        arr.count - head
    }

    public mutating func enqueue(_ element: T) {
        arr.append(element)
    }

    public mutating func dequeue() -> T? {
        guard head < arr.count, let element = arr[head] else { return nil }
        arr[head] = nil
        head += 1
        let percentage = Double(head)/Double(arr.count)
        if arr.count > 10000 && percentage > 0.5 {
            arr.removeFirst(head)
            head = 0
        }
        return element
    }
}

class Solution {

    let EDGE = Int(1e6)
    var MAX = Int(1e5)
    var bs = Set<String>()
    let dir = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
        for b in blocked { bs.insert("\(b[0])_\(b[1])") }
        let n = blocked.count
        MAX = n * (n - 1) / 2
        return check(source, target) && check(target, source)
    }

    func check(_ a: [Int], _ b: [Int]) -> Bool {
        var vis = Set<String>()
        var queue = Queue<[Int]>()
        queue.enqueue(a)
        vis.insert("\(a[0])_\(a[1])")
        while !queue.isEmpty && vis.count <= MAX {
            let t = queue.dequeue()!
            let (x, y) = (t[0], t[1])
            if x == b[0] && y == b[1] { return true }
            for d in dir {
                let (nx, ny) = (d[0] + x, d[1] + y)
                if nx < 0 || nx >= EDGE || ny < 0 || ny >= EDGE { continue }
                if bs.contains("\(nx)_\(ny)") { continue }
                if vis.contains("\(nx)_\(ny)") { continue }
                queue.enqueue([nx, ny])
                vis.insert("\(nx)_\(ny)")
            }
        }
        return vis.count > MAX
    }

}
