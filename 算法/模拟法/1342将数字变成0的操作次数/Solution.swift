/*
1342. 将数字变成 0 的操作次数
https://leetcode-cn.com/problems/number-of-steps-to-reduce-a-number-to-zero/
*/
class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var ans = 0, num = num
        while num != 0 {
            num = num % 2 == 0 ? num / 2 : num - 1
            ans += 1
        }
        return ans
    }
}
