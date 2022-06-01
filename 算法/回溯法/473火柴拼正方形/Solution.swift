/*
473. 火柴拼正方形
https://leetcode.cn/problems/matchsticks-to-square/
*/
class Solution {
    var side: Int!
    var cache: [Int]!
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        guard sum % 4 == 0 else { return false }
        side = sum / 4
        let n = matchsticks.count
        cache = [Int](repeating: -1, count: 1 << n)
        cache[(1 << n) - 1] = 1
        return dfs(0, 0, matchsticks)
    }
    
    func dfs(_ state: Int, _ cur: Int, _ matchsticks: [Int]) -> Bool {
        if cache[state] != -1 {
            return cache[state] != 0
        }
        let n = matchsticks.count
        var temp = 0
        for i in 0..<n {
            if (state >> i) & 1 == 0 && cur + matchsticks[i] <= side {
                let ne = (cur + matchsticks[i]) % side // 取余是为了保证当前边完成了，可以进入下一条边
                if dfs(state | (1 << i), ne, matchsticks) {
                    temp = 1
                    break
                }
            }
        }
        cache[state] = temp
        return cache[state] != 0
    }
}
