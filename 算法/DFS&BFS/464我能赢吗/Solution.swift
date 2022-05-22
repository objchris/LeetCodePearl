/*
464. 我能赢吗
https://leetcode.cn/problems/can-i-win/
*/
class Solution {
    var memo = [Int: Bool]()

    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if maxChoosableInteger * (maxChoosableInteger + 1) / 2 < desiredTotal {
            return false 
        }
        return dfs(maxChoosableInteger, 0, desiredTotal, 0)
    }

    func dfs(_ maxChoosableInteger: Int, _ usedNumbers: Int, _ desiredTotal: Int, _ currentTotal: Int) -> Bool {
        if memo[usedNumbers] == nil {
            var res = false
            for i in 0..<maxChoosableInteger {
                if ((usedNumbers >> i) & 1) == 0 {
                    if i + 1 + currentTotal >= desiredTotal {
                        res = true
                        break
                    }
                    if !dfs(maxChoosableInteger, usedNumbers | (1 << i), desiredTotal, currentTotal + i + 1) {
                        res = true
                        break
                    }
                }
            }
            memo[usedNumbers] = res
        }
        return memo[usedNumbers]!
    }
}
