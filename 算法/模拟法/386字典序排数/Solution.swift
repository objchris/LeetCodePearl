/*
386. 字典序排数
https://leetcode-cn.com/problems/lexicographical-numbers/
*/
class Solution {
    var ans = [Int]()

    func lexicalOrder(_ n: Int) -> [Int] {
        for i in 1...9 { dfs(i, n) }
        return ans
    }

    func dfs(_ cur: Int, _ limit: Int) {
        if cur > limit { return }
        ans.append(cur)
        for i in 0...9 {
            dfs(cur * 10 + i, limit)
        }
    }
    
}
