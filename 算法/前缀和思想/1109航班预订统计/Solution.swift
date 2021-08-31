/*
 1109. 航班预订统计
 https://leetcode-cn.com/problems/corporate-flight-bookings/
 
 差分 - 前缀和
 */
class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: n)
        var temp = [Int](repeating: 0, count: n + 1)
        for booking in bookings {
            let l = booking[0] - 1, r = booking[1] - 1, s = booking[2]
            temp[l] += s
            temp[r + 1] -= s
        }
        ans[0] = temp[0]
        for i in 1..<n {
            ans[i] = ans[i - 1] + temp[i]
        }
        return ans
    }
}
