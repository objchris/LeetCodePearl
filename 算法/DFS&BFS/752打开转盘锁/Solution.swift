// BFS (求最短路线一般使用BFS)
/*
 具体地，我们在一开始将 (0000, 0) 加入队列，并使用该队列进行广度优先搜索。在搜索的过程中，设当前搜索到的数字为 status，旋转的次数为 step，我们可以枚举 status 通过一次旋转得到的数字。设其中的某个数字为 next_status，如果其没有被搜索过，我们就将 (next_status,step+1) 加入队列。如果搜索到了 target，我们就返回其对应的旋转次数。

 为了避免搜索到死亡数字，我们可以使用哈希表存储 deadends 中的所有元素，这样在搜索的过程中，我们可以均摊 O(1) 地判断一个数字是否为死亡数字。同时，我们还需要一个哈希表存储所有搜索到的状态，避免重复搜索。
 */
class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        
        guard !deadends.contains("0000") else {
            return -1
        }
        
        guard target != "0000" else {
            return 0
        }
        
        var queue: [String] = ["0000"]  //初始化队列 存储待分析的***
        var visited: Set = ["0000"]   //初始化队列 储存访问过的***
        let deadends: Set = Set(deadends)
        var steps: Int = 0  //拨轮的旋转次数
        
        while !queue.isEmpty {
            steps += 1
            for _ in queue {
                
                let curr: String = queue.removeFirst()  //当前拨轮状态
                for (index, char) in curr.enumerated() {
                    let currNumber: Int = Int(String(char))! //当前要拨动的***上的数字
                    let startIndex = curr.index(curr.startIndex, offsetBy: index)   //要拨动的数字反映在字符串中的范围
                    let endIndex = startIndex
                    //向上拨
                    let upNumber: String = String((currNumber + 1) % 10)    //拨动后当前***的新数字
                    var upString: String = curr
                    upString.replaceSubrange(startIndex...endIndex, with: upNumber) //向上拨后的新***
                    if upString == target { //如果新***可以解锁，则返回当前旋转次数
                        return steps
                    } else if !deadends.contains(upString) && !visited.contains(upString) {    //如果不能解锁，则在确认当前***不是死亡数字后加入队列
                        queue.append(upString)
                        visited.insert(upString)
                    }
                    
                    //向下拨
                    let downNumber: String = String((currNumber - 1 >= 0 ? currNumber - 1 : 9 ))
                    var downString: String = curr
                    downString.replaceSubrange(startIndex...endIndex, with: downNumber)
                    if downString == target {
                        return steps
                    } else if !deadends.contains(downString) && !visited.contains(downString) {
                        queue.append(downString)
                        visited.insert(downString)
                    }
                }
            }
            
        }
        
        return -1
    }
}

// TODO: 双向BFS

