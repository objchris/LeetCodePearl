/*
1345. 跳跃游戏 IV
https://leetcode-cn.com/problems/jump-game-iv/
*/
class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let N = arr.count
        if N <= 1 { return 0 }

        // 先记录输入中的元素与对应出现的索引位置集合。
        var valToIndicesMap = [Int: [Int]]()
        for i in stride(from: N-1, through: 0, by: -1) {
            // 忽略连续重复的，不会影响结果。例如测试用例 27 / 32。
            if i - 1 >= 0 && i+1 < N, arr[i - 1] == arr[i] && arr[i] == arr[i + 1] {
                continue
            }
            valToIndicesMap[arr[i], default: [Int]()].append(i)
        }

        // jumps[i] 到达索引 i 需要的最少步数
        var jumps = Array(repeating: -1, count: N)
        jumps[0] = 0 // 第一个元素

        // 当前能访问到的索引位置
        var idxQueue = [0]
        // BFS
        while idxQueue.isEmpty == false {
            let curIdx = idxQueue.removeFirst()
            let step = jumps[curIdx]
            // 到达末尾了，返回对应步数
            if curIdx == N - 1 { return step }

            // 否则，将前后相邻的索引 以及 与当前元素值相同的元素索引 加入队列
            if curIdx - 1 > 0, jumps[curIdx - 1] == -1 {
                idxQueue.append(curIdx - 1)
                jumps[curIdx - 1] = 1 + step
            }
            if curIdx + 1 < N, jumps[curIdx + 1] == -1 {
                idxQueue.append(curIdx + 1)
                jumps[curIdx + 1] = 1 + step
            }
            let curVal = arr[curIdx]
            if let sameValIndices = valToIndicesMap[curVal] {
                for idx in sameValIndices {
                    if jumps[idx] == -1 { // 跳过已经访问了的（已经访问了的肯定需要的步数少）
                        idxQueue.append(idx)
                        jumps[idx] = 1 + step
                    }
                }
                // 移除当前元素值对应索引集合（每一个元素值的各索引只需要加入一次队列）
                valToIndicesMap.removeValue(forKey: curVal)
            }
        }
        // 无法到达最后一个位置
        return -1
    }
}
