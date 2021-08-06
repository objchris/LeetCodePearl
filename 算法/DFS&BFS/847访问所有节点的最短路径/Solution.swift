/*
 [BFS]847. 访问所有节点的最短路径
 https://leetcode-cn.com/problems/shortest-path-visiting-all-nodes/
 
 使用广度优先遍历，加上状态压缩
 何为状态压缩：
 状态压缩也即用一个变量来表示当前状态，比较常用的方式是利用一个 n 位 k 进制数 mask 表示当前 n 个节点的所处的 k 个不同状态。对于本题而言，某个节点只需要记录是否遍历过，所以利用二进制即可，由于本题数据范围 n ≤ 12，所以不会超过 Int 型范围。
 
 一些状态压缩的基本操作如下：
 （1）访问第 i 个点的状态：`state=(1 << i) & mask`
 （2）更改第 i 个点状态为1 ：`mask = mask | (1 << i)`

 */
class Solution {

    func shortestPathLength(_ graph: [[Int]]) -> Int {

        let n = graph.count
        var queue = [[Int]]()   // [[index, mask, dist]]
        // 本题允许重复访问某一个节点，但对于状态相同的同一个节点，没有再次访问的必要
        // 用 vis 来记录这种情况: vis[n][1<<n] = true/false
        var vis = [[Bool]](repeating: [Bool](repeating: false, count: (1 << n)), count: n)

        // 首先，将所有的点加入队列
        for node in graph.indices {
            queue.append([node, (1 << node), 0])
            vis[node][1 << node] = true
        }

        // BFS
        while !queue.isEmpty {
            let t = queue.removeFirst()
            // mask = 2^n - 1，表示遍历完所有点
            if t[1] == (1 << n) - 1 {
                return t[2]
            }

            for next in graph[t[0]] {
                let nextMask = (t[1] | (1 << next))
                if (!vis[next][nextMask]) {
                    queue.append([next, nextMask, t[2] + 1])
                    vis[next][nextMask] = true
                }
            }

        }

        return -1

    }
}
