/*
 470. 用 Rand7() 实现 Rand10()
 https://leetcode-cn.com/problems/implement-rand10-using-rand7/
 
 原理：
 https://leetcode-cn.com/problems/implement-rand10-using-rand7/solution/cong-zui-ji-chu-de-jiang-qi-ru-he-zuo-dao-jun-yun-/
 
 已知 rand_N() 可以等概率的生成[1, N]范围的随机数
 那么：
 (rand_X() - 1) × Y + rand_Y() ==> 可以等概率的生成[1, X * Y]范围的随机数
 即实现了 rand_XY()
 
 */
class Solution : SolBase {
    func rand10() -> Int {
        var row = 0, col = 0, idx = 0
        repeat {
            row = rand7()
            col = rand7()
            idx = col + (row - 1) * 7
        } while idx > 40
        return 1 + (idx - 1) % 10
    }
}
