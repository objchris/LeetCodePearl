/*
868. 二进制间距
https://leetcode-cn.com/problems/binary-gap/
*/
class Solution {
    func binaryGap(_ n: Int) -> Int {
        guard n & (n - 1) != 0 else { return 0 }
        var last = Int.max, ans = 0
        for i in 0..<32 where ((n >> i) & 1) == 1 {
            ans = max(ans, i - last)
            last = i
        }
        return ans
    }
}
