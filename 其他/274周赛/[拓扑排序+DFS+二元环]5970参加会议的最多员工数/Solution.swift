/*
 5970. 参加会议的最多员工数
 https://leetcode-cn.com/problems/maximum-employees-to-be-invited-to-a-meeting/
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
        var queue = [Int]()
        for i in favorite.indices {
            if ext[i] != 0 { continue }
            queue.append(i)
            dep[i] = 1
            isRing[i] = false
        }
        while !queue.isEmpty {
            let t = queue.removeFirst()
            ext[favorite[t]] -= 1
            if (ext[favorite[t]] == 0) {
                dep[favorite[t]] = dep[t] + 1
                isRing[favorite[t]] = false
                queue.append(favorite[t])
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
