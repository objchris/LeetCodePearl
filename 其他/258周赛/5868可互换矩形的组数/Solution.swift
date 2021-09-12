/*
 5868. 可互换矩形的组数
 https://leetcode-cn.com/problems/number-of-pairs-of-interchangeable-rectangles/
 
 哈希表
 */
class Solution {
    func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        var map = [String: Int]()
        for rect in rectangles {
            let w = rect[0]
            let h = rect[1]
            let maxDiv = getMaxDivNumber(w, h)
            // 除以最大公约数保证不会出现小数，规避小数精度问题
            let key = "\(w/maxDiv)_\(h/maxDiv)"
            map[key, default: 0] += 1
        }
        var ans = 0
        for (_, v) in map {
            ans += v * (v - 1) / 2
        }
        return ans
    }

    // 辗转相除法求得两个数的最大公约数
    func getMaxDivNumber(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : getMaxDivNumber(b, a % b)
    }
}
