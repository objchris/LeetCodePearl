/*
913. 猫和老鼠
https://leetcode-cn.com/problems/cat-and-mouse/

目前遇到的最难的一题...
参考题解：https://leetcode-cn.com/problems/cat-and-mouse/solution/gong-shui-san-xie-dong-tai-gui-hua-yun-y-0bx1/
*/
class Solution {

    let MOUSE_WIN = 1
    let CAT_WIN = 2
    let DRAW = 0

    var n = 0
    var graph: [[Int]]!
    var dp: [[[Int]]]!

    func catMouseGame(_ graph: [[Int]]) -> Int {
        n = graph.count
        self.graph = graph
        // [mouse][cat][turns]
        dp = [[[Int]]](repeating: [[Int]](repeating:[Int](repeating: -1, count: n * n * 2), count: n), count: n)
        return solved(1, 2, 0)
    }

    func solved(_ mouse: Int, _ cat: Int, _ turns: Int) -> Int {
        if turns >= 2 * n * n { return DRAW }
        if dp[mouse][cat][turns] < 0 {
            if mouse == 0 { dp[mouse][cat][turns] = MOUSE_WIN } 
            else if mouse == cat { dp[mouse][cat][turns] = CAT_WIN }
            else { solved2(mouse, cat, turns) }
        }
        return dp[mouse][cat][turns]
    } 

    func solved2(_ mouse: Int, _ cat: Int, _ turns: Int) {
        let (cur, defaultRet) = turns % 2 == 0 ? (mouse, CAT_WIN) : (cat, MOUSE_WIN)
        var ret = defaultRet
        let nextNodes = graph[cur]
        for next in nextNodes {
            if cur == cat && next == 0 { continue } // 猫不能到 0 点
            let mouseNext = cur == mouse ? next : mouse
            let catNext = cur == cat ? next : cat
            let nextRet = solved(mouseNext, catNext, turns + 1)
            if nextRet != defaultRet { // 对方必胜状态，不选择
                ret = nextRet          // 平局或我方必胜状态   
                if ret != DRAW {       // 我方必胜状态，选择
                    break
                }
            }
        }
        dp[mouse][cat][turns] = ret
    }
}
