/*
1716. 计算力扣银行的钱
https://leetcode-cn.com/problems/calculate-money-in-leetcode-bank/

等差数列求和公式: (a1+an) * n / 2
*/
class Solution {
    func totalMoney(_ n: Int) -> Int {
        let c = n / 7, m = n % 7, n = c + 1, t = 28 + (c - 1) * 7
        var ans = (28 + t) * c / 2
        ans += (n + n + m - 1) * m / 2
        return ans
    }
}
