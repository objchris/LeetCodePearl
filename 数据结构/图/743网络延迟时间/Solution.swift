/*
 743. 网络延迟时间
 https://leetcode-cn.com/problems/network-delay-time/
 */
class Solution {

    let N = 110
    let M = 6010
    let MAX = 0x3f3f3f3f

    var n: Int!
    var k: Int!
    var graph: [[Int]]
    var dist: [Int]
    var vis: [Bool]

    init() {
        graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        dist = [Int](repeating: MAX, count: N)
        vis = [Bool](repeating: false, count: N)
    }

    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        self.n = n
        self.k = k
        // 初始化
        for i in 1...n {
            for j in 1...n {
                graph[i][j] = (i == j) ? 0 : MAX
                graph[j][i] = (i == j) ? 0 : MAX
            }
        }

        for t in times {
            let a = t[0], b = t[1], w = t[2]
            graph[a][b] = w
        }

        dijkstra(k)

        var ans = 0
        for i in 1...n {
            ans = max(ans, dist[i])
        }
        return ans == MAX ? -1 : ans
    }

    func dijkstra(_ start: Int) {
        dist[start] = 0
        for _ in 1...n { 
            // 每次都会遍历一个点，所以共需要遍历 n 次
            var t = -1
            for i in 1...n where !vis[i] { 
                // 每次找「未遍历过」且「最短距离最小」的点
                if t == -1 || dist[i] < dist[t] { t = i }
            }
            vis[t] = true
            for i in 1...n { // 用点 t 的「最小距离」更新其他点
                dist[i] = min(dist[i], dist[t] + graph[t][i])
            }
        }
    }
}
