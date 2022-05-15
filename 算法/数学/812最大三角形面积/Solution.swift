/*
812. 最大三角形面积
https://leetcode.cn/problems/largest-triangle-area/
*/
class Solution {
    func largestTriangleArea(_ ps: [[Int]]) -> Double {
        var ans = 0.0
        let n = ps.count
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                for k in j+1..<n {
                    let cur = cross(ps[j][0] - ps[i][0], ps[j][1] - ps[i][1], ps[k][0] - ps[i][0], ps[k][1] - ps[i][1])
                    ans = max(ans, abs(Double(cur) / 2.0))
                }
            }
        }
        return ans
    }

    func cross(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {
        a * d - b * c
    }
}
