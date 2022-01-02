/*
 5970. 参加会议的最多员工数
 https://leetcode-cn.com/problems/maximum-employees-to-be-invited-to-a-meeting/
 */

// 自定义队列，若使用 Array 做队列时，removeFirst()的时间复杂度是 O(n) ，放在本题会超时
// @see https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue
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

/*
 @see https://leetcode-cn.com/problems/maximum-employees-to-be-invited-to-a-meeting/solution/si-lu-fen-xi-tuo-bu-pai-xu-dfs-ji-suan-h-irhr/
 作者：daydayUppp
 
 分析题目：
 人员 A 和人员 B，当且仅当 A 在 B 身边时，A 才会出席。因为我们可以构造 B -> A 的一条有向边来表示。
 B 的出度表示 有多少个人喜欢 B，如下的 ext
 每个结点有且仅有一条边
 不存在环中环的情况
 
 那么我们分析什么情况是 合法 的情况 :

 当出席的人 , 刚好在图中表示为一个环时 , 比如 A->B->C->D->E->(A) , 此时是成立的
 或者 当有 二元环 二元环定义 : A->B 且 B->A 即 A,B 可以相互依赖 的时候 : P0 <- P1 <- P2 <- ... <- A - B -> Q0 -> Q1 -> ... 此时也是满足的 , 且每一种 二元环 的情况 都可以放在一起 :
 如果 A B 和 C D 都是二元环 那么下面这种情况也是满足要求的
 ...<- A - B -> ... , ...<- C - D -> ... , (...)
 
 那么我们需要计算 :

 每一个 点 是否在环上 (拓扑排序可以解决)
 某一个点是否是 二元环 用 favorite[favorite[i]] == i 来判断即可
 从某一个点 出发 往后的 非环最长链 (同样在拓扑排序的过程中可以解决)
 每一个环的大小 (深搜可以解决)

 */
class Solution {

    func maximumInvitations(_ favorite: [Int]) -> Int {
        let n = favorite.count
        var g = [[Int]](repeating: [Int](), count: n)   // 表示喜欢 i 的有哪些
        var ext = [Int](repeating: 0, count: n)         // 表示有多少人喜欢 i （ i 的出度）
        var dep = [Int](repeating: 0, count: n)         // i 的不在环上的最长链长度
        var isRing = [Bool](repeating: true, count: n)  // i 在不在环上
        var vis = [Bool](repeating: false, count: n)    // dfs 时是否已遍历过
        // 存图
        for (i, v) in favorite.enumerated() {
            g[v].append(i)
            ext[v] += 1
        }
        // 拓扑排序
        var queue = Queue<Int>()
        for i in favorite.indices {
            if ext[i] != 0 { continue }
            queue.enqueue(i)
            dep[i] = 1
            isRing[i] = false
        }
        while !queue.isEmpty {
            let t = queue.dequeue()!
            ext[favorite[t]] -= 1
            if (ext[favorite[t]] == 0) {
                // 非环最长链的长度为 t 的非环最长链长度 + t
                dep[favorite[t]] = dep[t] + 1
                // 标志为非环
                isRing[favorite[t]] = false
                queue.enqueue(favorite[t])
            } else {
                dep[favorite[t]] = dep[t]
            }
        }
        // dfs求环长度
        func dfs(_ i: Int) -> Int {
            var res = 1
            for p in g[i] {
                if !vis[p] && isRing[p] {
                    vis[p] = true
                    res += dfs(p)
                }
            }
            return res
        }
        // 求最大环长度
        var ans = 0
        for i in favorite.indices {
            if !vis[i] && isRing[i] {
                vis[i] = true
                ans = max(ans, dfs(i))
            }
        }

        // 求二元环的长度
        var o = 0
        for i in favorite.indices {
            if favorite[favorite[i]] == i {
                o += dep[i] + dep[favorite[i]] + 2 // 2 是 i 和 favorite[i]
            }
        }
        ans = max(ans, o / 2)
        return ans
    }
    
}
