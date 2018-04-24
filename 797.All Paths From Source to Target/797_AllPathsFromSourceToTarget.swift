// 我的解法🐌
class MySolution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        // 拿到最大的节点
        let max = graph.count - 1
        // 对结果进行过滤：路径中需要同时包含节点0和节点max
        return findPath(0, graph).filter({ $0.contains(0) && $0.contains(max)})
    }
    
    func findPath(_ index: Int, _ graph:[[Int]]) -> [[Int]] {
        // 如果该节点不可到达其他节点，则返回[]
        if graph[index].count == 0 {
            return [[index]]
        }
        // 创建路径数组
        var ans = [[Int]]()
        // 获取节点可达路径的另一个节点
        for node in graph[index] {
            // 递归调用，
            // 然后在得到的结果中，把当前节点的值插入到第0个节点的位置。
            findPath(node, graph).map({ (path) -> [Int] in
                var temp = Array.init(path)
                temp.insert(index, at: 0)
                ans.append(temp)
                return path
            })
        }
        return ans
    }
}

// 快速解法🕊
class OtherSolution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let array = graph[0]
        // 只创建一个结果数组
        var result = [[Int]]()
        pathSourceTarget(graph,array,&result,[0])
        return result
    }
    
    // inout参数
    func pathSourceTarget(_ graph: [[Int]] ,_ target:[Int],_ result:inout [[Int]],_ array:[Int]) {
        for i in 0 ..< target.count {
            var newArray = array
            newArray.append(target[i])
            if target[i] == graph.count-1 {
                // 当节点是最后一个节点，才将路径添加到结果中
                // 这就比我的解法少了最后一步过滤操作，耗时更少。
                result.append(newArray)
            }
            else {
                // 当节点不是最后一个时，递归遍历。
               pathSourceTarget(graph,graph[target[i]],&result,newArray)
            }
        }
    }
}
