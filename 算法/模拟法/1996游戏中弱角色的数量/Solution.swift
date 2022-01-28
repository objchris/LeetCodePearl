/*
1996. 游戏中弱角色的数量
https://leetcode-cn.com/problems/the-number-of-weak-characters-in-the-game/submissions/
*/
class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let props = properties.sorted { l, r in 
            l[0] == r[0] ? l[1] < r[1] : r[0] < l[0]
        }
        var maxDef = 0
        var ans = 0
        for p in props {
            if p[1] < maxDef { ans += 1 }
            else { maxDef = p[1] }
        }
        return ans
    }
}
