/*
986. 区间列表的交集
https://leetcode-cn.com/problems/interval-list-intersections/
*/
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var a = 0, b = 0
        var ans = [[Int]]()
        while a < firstList.count && b < secondList.count {
            let i1 = firstList[a], i2 = secondList[b]
            let left = max(i1[0], i2[0]), right = min(i1[1], i2[1])
            if left <= right {
                ans.append([left, right])
            }
            if right >= i1[1] { a += 1 }
            if right >= i2[1] { b += 1 }
        }
        return ans
    }
}
