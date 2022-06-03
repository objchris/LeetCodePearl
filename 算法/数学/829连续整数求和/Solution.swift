/*
829. 连续整数求和
https://leetcode.cn/problems/consecutive-numbers-sum/
*/
class Solution {
    func consecutiveNumbersSum(_ n: Int) -> Int {
        var ans = 0
        let bound = 2 * n
        var k = 1
        while k * (k + 1) <= bound {
            if isKConsecutive(n, k) {
                ans += 1
            }
            k += 1
        }
        return ans
    }

    func isKConsecutive(_ n: Int, _ k: Int) -> Bool {
        if k % 2 == 1 {
            return n % k == 0
        } else {
            return n % k != 0 && 2 * n % k == 0
        }
    }
}
