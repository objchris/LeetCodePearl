/*
2049. 统计最高分的节点数目
https://leetcode-cn.com/problems/count-nodes-with-the-highest-score/
*/
class Solution {
    let N = 100010
    let M: Int
    var he: [Int]
    var e: [Int]
    var ne: [Int]
    var f: [Int]
    var idx = 0

    init() {
        M = N * 2
        he = [Int](repeating: -1, count: N)
        e = [Int](repeating: 0, count: M)
        ne = [Int](repeating: 0, count: M)
        f = [Int](repeating: 0, count: N)
    }

    func add(_ a: Int, _ b: Int) {
        e[idx] = b
        ne[idx] = he[a]
        he[a] = idx
        idx += 1
    }

    func dfs(_ u: Int) -> Int {
        var ans = 1
        var i = he[u]
        while i != -1 {
            ans += dfs(e[i])
            i = ne[i]
        }
        f[u] = ans
        return ans 
    }

    func countHighestScoreNodes(_ parents: [Int]) -> Int {
        let n = parents.count
        for i in 1..<n {
            add(parents[i], i)
        }
        dfs(0)
        var max = 0
        var ans = 0
        for x in 0..<n {
            var cur = 1
            var i = he[x]
            while i != -1 {
                cur *= f[e[i]]
                i = ne[i]
            }
            if x != 0 { cur *= (n - f[x]) }
            if cur > max {
                max = cur
                ans = 1
            } else if cur == max {
                ans += 1
            }
        }
        return ans
    }
}
