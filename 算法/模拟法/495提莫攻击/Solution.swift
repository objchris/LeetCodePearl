/*
495. 提莫攻击
https://leetcode-cn.com/problems/teemo-attacking/

简单题目，注意寒冰中毒的区间重叠即可
*/
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var maxV = 0
        var ans = 0
        for i in timeSeries {
            ans += i + duration - max(i, maxV)
            maxV = max(maxV, i + duration)
        }
        return ans
    }
}
