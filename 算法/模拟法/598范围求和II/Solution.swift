/*
598. 范围求和 II
https://leetcode-cn.com/problems/range-addition-ii/
*/
class Solution {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var r = m, c = n
        for o in ops {
            r = min(r, o[0])
            c = min(c, o[1])
        }
        return r * c
    }
}
