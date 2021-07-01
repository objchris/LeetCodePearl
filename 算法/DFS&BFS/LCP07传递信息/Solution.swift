/*
 [DFS]LCP 07. 传递信息
 https://leetcode-cn.com/problems/chuan-di-xin-xi/
 */

class Solution {
    
    func numWays(_ n: Int, _ relation: [[Int]], _ k: Int) -> Int {
        
        // i 能发送信息的玩家
        var tree = [Set<Int>](repeating: Set<Int>(), count: n)
        for re in relation {
            tree[re[0]].insert(re[1])
        }
        
        var ans = 0
        func dfs(_ index: Int, _ count: Int) {
            if count == k {
                if tree[index].contains(n-1) {
                    ans += 1
                }
                return
            }
            for i in tree[index] {
                dfs(i, count + 1)
            }
        }
        dfs(0, 1)
        return ans
        
    }
}

let s = Solution()
s.numWays(5, [[0,2],[2,1],[3,4],[2,3],[1,4],[2,0],[0,4]], 3) // 3

