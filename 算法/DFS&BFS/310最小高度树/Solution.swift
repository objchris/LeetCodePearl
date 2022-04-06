/*
310. 最小高度树
https://leetcode-cn.com/problems/minimum-height-trees/
*/
class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        var degree = [Int](repeating: 0, count: n)
        var map = [[Int]](repeating: [Int](), count: n)
        for e in edges {
            degree[e[0]] += 1
            degree[e[1]] += 1
            map[e[0]].append(e[1])
            map[e[1]].append(e[0])
        }
        var queue = [Int]()
        for i in 0..<n where degree[i] == 1 { queue.append(i) }
        var ans = [Int]()
        while !queue.isEmpty {
            ans = [Int]()
            let n = queue.count
            for i in 0..<n {
                let cur = queue.removeFirst()
                ans.append(cur)
                let neighbors = map[cur]
                for nei in neighbors {
                    degree[nei] -= 1
                    if degree[nei] == 1 { queue.append(nei) }
                }
            }
        }
        return ans
    }
}
