/*
2039. 网络空闲的时刻
https://leetcode-cn.com/problems/the-time-when-the-network-becomes-idle/
*/
let N = 100010
let M = N * 2
let INF = 0x3f3f3f3f

public struct Queue<T> {
    fileprivate var arr = [T?]()
    fileprivate var head = 0

    public var isEmpty: Bool {
        count == 0
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
        if arr.count > 100000 && percentage > 0.8 { // 这个判断实际上不会被调用到，数值改得太小，也容易 TLE（ Array 真是太辛苦了。）
            arr.removeFirst(head)
            head = 0
        }
        return element
    }
}

class Solution {

    var he: [Int]!
    var e : [Int]!
    var ne: [Int]!
    var dist: [Int]!

    var idx = 0

    func add(_ a: Int, _ b: Int) {
        e[idx] = b
        ne[idx] = he[a]
        he[a] = idx
        idx += 1
    }

    func networkBecomesIdle(_ edges: [[Int]], _ patience: [Int]) -> Int {
        he = [Int](repeating: -1, count: N)
        e  = [Int](repeating: 0, count: M)
        ne = [Int](repeating: 0, count: M)
        dist = [Int](repeating: INF, count: N)

        let n = patience.count
        for e in edges {
            add(e[0], e[1])
            add(e[1], e[0])
        }

        var d = Queue<Int>()
        d.enqueue(0)
        dist[0] = 0
        while !d.isEmpty {
            let t = d.dequeue()!
            var i = he[t]
            while i != -1 {
                let j = e[i]
                i = ne[i]
                if dist[j] != INF { continue }
                dist[j] = dist[t] + 1
                d.enqueue(j)
            }
        }

        var ans = 0
        for i in 1..<n {
            let di = dist[i] * 2, t = patience[i]
            let cur = di <= t ? di : (di - 1) / t * t + di
            if cur > ans { ans = cur }
        }
        return ans + 1
    }

}
