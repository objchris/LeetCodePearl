/*
 743. 网络延迟时间
 https://leetcode-cn.com/problems/network-delay-time/
 */
class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        // 准备工作
        var graph = [[[Int]]](repeating: [], count: n)
        for e in times { graph[e[0] - 1].append([e[1] - 1, e[2]]) }
        var dist = [Int](repeating: Int.max, count: n)
        dist[k - 1] = 0
        var seen = [Bool](repeating: false, count: n)
        // Dijkstra算法
        while true {
            // 每次扩展一个距离最短的点
            var index = -1
            var length = Int.max
            for e in dist.enumerated() {
                if !seen[e.offset] && dist[e.offset] < length {
                    length = dist[e.offset]
                    index = e.offset
                }
            }
            // 更新与其相邻点的距离
            if index != -1 {
                seen[index] = true
                for e in graph[index] ?? [] {
                    dist[e[0]] = min(dist[e[0]], dist[index] + e[1])
                }
            } else {
                break
            }
        }
        // 返回
        let ans = dist.max()!
        return ans == Int.max ? -1 : ans
    }
}
