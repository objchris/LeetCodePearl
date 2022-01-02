/*
 5968. 银行中的激光束数量
 https://leetcode-cn.com/problems/number-of-laser-beams-in-a-bank/
 */
class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var ans = 0, p = 0
        for r in bank {
            let arr = Array(r)
            let c = arr.map { Int(String($0))! }.reduce(0, +)
            if c == 0 { continue }
            ans += p * c
            p = c
        }
        return ans
    }
}
