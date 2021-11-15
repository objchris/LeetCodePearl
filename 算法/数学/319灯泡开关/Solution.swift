/*
319. 灯泡开关
https://leetcode-cn.com/problems/bulb-switcher/

数学讲解：https://leetcode-cn.com/problems/bulb-switcher/solution/deng-pao-kai-guan-by-leetcode-solution-rrgp/
*/
import Foundation

class Solution {
    func bulbSwitch(_ n: Int) -> Int {
        // 使用全局 sqrt 函数需要引入 Foundation
        return Int(sqrt(Double(n)))
    }
}
