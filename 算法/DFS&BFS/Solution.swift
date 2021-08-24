/*
 787. K 站中转内最便宜的航班
 https://leetcode-cn.com/problems/cheapest-flights-within-k-stops/
 */
class Solution {
    
    // TLE
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        // 存图
        var graph = [Int: [[Int]]]()
        for flight in flights {
            let from = flight[0]
            let to = flight[1]
            let price = flight[2]
            graph[from, default: [[Int]]()].append([to, price])
        }
        
        var ans = 1000001
        func dfs(_ path: Int, _ to: Int, _ cost: Int) {
            if to == dst {
                ans = min(ans, cost)
            }
            if path > k {
                return
            }
            if let neighbors = graph[to] {
                for nei in neighbors {
                    let to = nei[0]
                    let price = nei[1]
                    dfs(path + 1, to, cost + price)
                }
            }
        }
        dfs(0, src, 0)
        return ans == 1000001 ? -1 : ans
        
    }

}

