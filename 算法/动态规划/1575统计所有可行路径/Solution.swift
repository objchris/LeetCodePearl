/*
 1575. 统计所有可行路径
 https://leetcode-cn.com/problems/count-all-possible-routes/
 */
// 记忆化 DFS
class Solution {
    let mod = Int(1e9 + 7)
    // cache[i][fuel] 代表从位置 i 出发，当前剩余的油量为 fuel 的前提下，到达目标位置的「路径数量」
    var cache: [[Int]]!

    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        let n = locations.count
        cache = [[Int]](repeating: [Int](repeating: -1, count: fuel + 1), count: n)
        return dfs(locations, start, finish, fuel)
    }

    func dfs(_ locations: [Int], _ cur: Int, _ finish: Int, _ fuel: Int) -> Int {
        if cache[cur][fuel] != -1 {
            return cache[cur][fuel]
        }

        let n = locations.count
        let need = abs(locations[cur] - locations[finish])
        if need > fuel {
            cache[cur][fuel] = 0
            return 0
        }

        // 计算油量为 fuel，从位置 u 到 end 的路径数量
        // 由于每个点都可以经过多次，如果 u = end，那么本身就算一条路径
        var sum = cur == finish ? 1 : 0
        for i in 0..<n where i != cur {
            let need = abs(locations[i] - locations[cur])
            if fuel >= need {
                sum += dfs(locations, i, finish, fuel - need)
                sum %= mod
            }
        }
        cache[cur][fuel] = sum
        return sum
    }
}

// 从记忆化 DFS 转换为 DP
/*
 重点关注下我们的 DFS 方法签名设计：
 ```
 func dfs(_ locations: [Int], _ cur: Int, _ finish: Int, _ fuel: Int) -> Int
 ```
 利用 DFS 的方法签名与主逻辑，就写出了「动态规划」解法。
 总结一下这个过程：
 1. 从 DFS 方法签名出发。分析哪些入参是可变的，将其作为 DP 数组的维度；将返回值作为 DP 数组的存储值。
 2. 从 DFS 的主逻辑可以抽象中单个状态的计算方法。
 其中第一点对应了「动态规划」的「状态定义」，第二点对应了「动态规划」的「状态方程转移」。

 作者：宫水三叶
 链接：https://leetcode-cn.com/leetbook/read/path-problems-in-dynamic-programming/r8n0h2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class Solution2 {
    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        let mod = Int(1e9 + 7)
        let n = locations.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: fuel + 1), count: n)

        for i in 0...fuel {
            dp[finish][i] = 1
        }

        for cur in 0...fuel {
            for i in 0..<n {
                for k in 0..<n where k != i {
                    let need = abs(locations[i] - locations[k])
                    if cur >= need {
                        dp[i][cur] += dp[k][cur - need]
                        dp[i][cur] %= mod
                    }
                }
            }
        }
        return dp[start][fuel]
    }
}
