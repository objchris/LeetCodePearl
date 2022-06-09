/*
497. 非重叠矩形中的随机点
https://leetcode.cn/problems/random-point-in-non-overlapping-rectangles/
*/
class Solution {

    let rects: [[Int]]
    var sum: [Int]
    let n: Int

    init(_ rects: [[Int]]) {
        self.rects = rects
        n = rects.count
        sum = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            sum[i] += sum[i - 1] + (rects[i - 1][2] - rects[i - 1][0] + 1) * (rects[i - 1][3] - rects[i - 1][1] + 1)
        }
    }
    
    func pick() -> [Int] {
        let val = Int.random(in: 1...sum[n])
        var l = 0, r = n 
        while l < r {
            let m = (l + r) >> 1
            if sum[m] >= val {
                r = m
            } else {
                l = m + 1
            }
        }
        let cur = rects[r - 1]
        return [Int.random(in: cur[0]...cur[2]), Int.random(in: cur[1]...cur[3])]
    }

}
