/*
 [拓扑排序]802. 找到最终的安全状态
 https://leetcode-cn.com/problems/find-eventual-safe-states/
 
 环路 -> 拓扑排序
 拓扑排序的思想，并证明一下我们算法的有效性：
 （1）将所有入度为 0 的点（原图中出度为 0 的点，也就是终点，最简单的安全点）加入队列。
 （2）每次循环访问位于队头的节点（安全点）；
 （3）遍历以该节点为起点的所有有向边，将其从图中去掉，也即将将该点指向的所有点的入度减一。
 （4）若某被指向点入度变为 0（意味着指向这个点的点均曾经被加入过队列，说明均为安全点），则将此点入队
 （5）重复步骤（2）、（3）、（4）直至队空。
 */

class Solution {
    // 暴力求解：TLE
    func eventualSafeNodes_TLE(_ graph: [[Int]]) -> [Int] {
        
        var cycles = Set<Int>()
        func dfs(_ node: Int, _ passed: Set<Int>) {
            if passed.contains(node) {
                cycles = cycles.union(passed)
                return
            }
            var passed = passed
            passed.insert(node)
            for i in graph[node] {
                dfs(i, passed)
            }
        }

        for i in graph.indices {
            if (!cycles.contains(i)) {
                dfs(i, Set<Int>())
            }
        }
        
        var ans = [Int]()
        for i in graph.indices {
            if !cycles.contains(i) {
                ans.append(i)
            }
        }
        return ans

    }
    
    // 反向图加拓扑排序
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var newGraph = [[Int]]()
        var inDeg = [Int](repeating: 0, count: n)
        
        for i in graph.indices {
            newGraph.append([Int]())
        }
        for i in graph.indices {
            for j in graph[i].indices {
                newGraph[graph[i][j]].append(i)
            }
            // 反向图中点 i 的入度就是正向图中点 i 的出度
            inDeg[i] = graph[i].count
        }
        
        var queue = [Int]()
        // 首先将入度为 0 的点存入队列
        for i in inDeg.indices {
            if inDeg[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let nodes = newGraph[cur]
            for n in nodes {
                inDeg[n] -= 1
                if inDeg[n] == 0 {
                    queue.append(n)
                }
            }
        }
        
        // 最终入度（原图中出度）为 0 的所有点均为安全点
        var ans = [Int]()
        for i in inDeg.indices {
            if inDeg[i] == 0 {
                ans.append(i)
            }
        }
        return ans
    }
}

