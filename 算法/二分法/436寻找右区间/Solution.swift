/*
436. 寻找右区间
https://leetcode.cn/problems/find-right-interval/

按起点排序，再用二分找大于终点的最近的一个起点
*/
class Solution {
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        let starts = zip(intervals.map{ $0[0] }, 0..<intervals.count).sorted{ $0.0 <= $1.0 }
        let n = starts.count
        var ans = [Int]()
        for inter in intervals {
            let target = inter[1]
            var l = 0, r = n - 1
            while l < r {
                let m = (l + r) >> 1
                if starts[m].0 >= target {
                    r = m
                } else {
                    l = m + 1
                }
            }
            ans.append(starts[r].0 >= target ? starts[r].1 : -1)
        }
        return ans
    }
}
