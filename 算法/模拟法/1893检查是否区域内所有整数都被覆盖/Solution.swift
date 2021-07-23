/*
 1893. 检查是否区域内所有整数都被覆盖
 https://leetcode-cn.com/problems/check-if-all-the-integers-in-a-range-are-covered/
 */
class Solution {
    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        var hold = [Int](repeating: 0, count: 51)
        for range in ranges {
            for i in range[0]...range[1] {
                hold[i] += 1
            }
        }
        for i in left...right {
            if hold[i] == 0 {
                return false
            }
        }
        return true
    }
}
