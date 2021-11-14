/*
 789. 逃脱阻碍者
 https://leetcode-cn.com/problems/escape-the-ghosts/
 
 相信科学之曼哈顿距离
 */
class Solution {
    func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
        let count = abs(target[0]) + abs(target[1])
        for g in ghosts {
            let c = abs(g[0] - target[0]) + abs(g[1] - target[1])
            if c <= count {
                return false
            }
        }
        return true
    }
}
