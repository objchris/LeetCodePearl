/*
1185. 一周中的第几天
https://leetcode-cn.com/problems/day-of-the-week/
*/
class Solution {
    let res = ["Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"]
    let months = [31,28,31,30,31,30,31,31,30,31,30,31]

    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        // 1971.1.1 Friday
        var days = 0
        for y in 1971..<year {
            days += 365
            if (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 {
                days += 1
            }
        }
        for m in 0..<month-1 {
            days += months[m]
        }
        if month > 2 {
            if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                days += 1
            }
        }
        days += day
        return res[days % 7]

    }
}
