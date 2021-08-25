/*
 797. 所有可能的路径
 https://leetcode-cn.com/problems/all-paths-from-source-to-target/
 */
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {

        var map = [Int: [[Int]]]()
        let n = graph.count - 1

        func dfs(_ node: Int) -> [[Int]] {
            if graph[node].count == 0 || node == n {
                return [[node]]
            }
            if map[node] != nil {
                return map[node]!
            }
            var ret = [[Int]]()
            for n in graph[node] {
                for path in dfs(n) {
                    ret.append([node] + path)
                    map[node, default: [[Int]]()].append([node] + path)
                }
            }
            return ret
        }
        
        return dfs(0).filter{$0.first == 0 && $0.last == n}

    }
}
