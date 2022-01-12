/*
 2136. 全部开花的最早一天
 https://leetcode-cn.com/problems/earliest-possible-day-of-full-bloom/
 
 优先种生长时间长的种子，就会有更多的时间可以用来种种子
 */
class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        let n = plantTime.count
        var order = [Int](0..<n).sorted{ growTime[$0] > growTime[$1] }
        var ans = 0, ed = 0
        for i in order {
            ed += plantTime[i]
            ans = max(ans, ed + growTime[i])
        }
        return ans
    }
}
