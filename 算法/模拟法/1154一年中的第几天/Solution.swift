/*
1154. 一年中的第几天
https://leetcode-cn.com/problems/day-of-the-year/
*/
class Solution {

    let days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    func dayOfYear(_ date: String) -> Int {
        let arr = date.split(separator: "-").map { String($0) }
        let year = Int(arr[0])!, month = Int(arr[1])!, day = Int(arr[2])!
        var ans = 0
        for i in 0..<month-1 {
            ans += days[i]
        }
        if ((year % 4 == 0 && year % 100 != 0) || y % 400 == 0) && month > 2 {
            ans += 1
        }
        ans += day
        return ans
    }
  
}
