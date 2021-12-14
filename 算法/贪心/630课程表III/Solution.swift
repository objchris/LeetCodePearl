/*
630. 课程表 III
https://leetcode-cn.com/problems/course-schedule-iii/

贪心思路：每次选择的课程都是截止时间靠前的。当无法继续添加时，从已学的课程中去掉时间最长的
*/
class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let courseSorts = courses.sorted { $0.last! < $1.last! }
        var total = 0
        var queue = [Int]()
        for cource in courseSorts {
            let ti = cource[0], di = cource[1]
            if total + ti <= di {
                total += ti
                queue.append(ti)
                queue.sort(by: <)
            } else if !queue.isEmpty, queue.last! > ti {
                total = total - queue.last! + ti
                queue.removeLast()
                queue.append(ti)
                queue.sort(by: <)
            }
        }
        return queue.count
    }
}
