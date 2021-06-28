/*
 [BFS]815. 公交路线
 
 此题目依旧使用BFS来求最短路径，但数据量较大，容易TimeLimited，需要牺牲空间换取时间
 */
class Solution {
    // TimeLimited
    // 本题数据量巨大，使用单向的BFS会造成超时
    func numBusesToDestination_TimeLimited(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target {
            return 0
        }

        // 这个循环可以使用 Dictionary 保存起来，省去每次都要遍历
        func getNextState(_ stationNumber: Int) -> [Int] {
            var ret = [Int]()
            for i in routes.indices {
                if routes[i].contains(stationNumber) {
                    ret.append(i)
                }
            }
            return ret
        }
        let beginIndices = getNextState(source)
        for index in beginIndices {
            if routes[index].contains(target) {
                return 1
            }
        }
        
        var steps = 0
        // save route index
        var queue = [Int]()
        var visit = Set(beginIndices)
        queue.append(contentsOf: beginIndices)
        
        while !queue.isEmpty {
            let size = queue.count
            steps += 1
            for _ in 0..<size {
                let st = queue.removeFirst()
                for j in routes[st] {
                    for next in getNextState(j) {
                        if !queue.contains(next) && !visit.contains(next) {
                            if routes[next].contains(target) {
                                return steps
                            }
                            queue.append(next)
                            visit.insert(next)
                        }
                    }
                }
            }
        }
        return -1
    }
    
    // Ac
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target {
            return 0
        }
        
        // save route index
        var queue = [Int]()
        var dist = [Int: Int]() // 进入当前路线的距离
        var map = [Int: Set<Int>]() // 记录车站可进入的路线
        
        for i in routes.indices {
            for station in routes[i] {
                if station == source {
                    queue.append(i)
                    dist[i] = 1
                }
                if map[station] == nil {
                    map[station] = Set<Int>()
                }
                map[station]?.insert(i)
            }
        }
        
        while !queue.isEmpty {
            let routeIndex = queue.removeFirst()
            let steps = dist[routeIndex]
            
            for stataion in routes[routeIndex] {
                if stataion == target {
                    return steps!
                }
                
                let lines = map[stataion]
                if lines == nil || lines?.count == 0 {
                    continue
                }
                
                for nr in lines! {
                    if !dist.keys.contains(nr) {
                        dist[nr] = steps! + 1
                        queue.append(nr)
                    }
                }
            }
        }
        return -1
    }
    
    // 双向BFS
    
    
}

