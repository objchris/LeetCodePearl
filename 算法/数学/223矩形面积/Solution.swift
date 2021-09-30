/*
 223. 矩形面积
 https://leetcode-cn.com/problems/rectangle-area/
 */
class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let area1 = abs(ax1 - ax2) * abs(ay1 - ay2)
        let area2 = abs(bx1 - bx2) * abs(by1 - by2)
        var area3 = 0
        if bx1 >= ax2 || by1 >= ay2 || bx2 <= ax1 || by2 <= ay1 {
        } else {
        area3 = abs(max(ax1, bx1) - min(ax2, bx2)) * abs(max(ay1, by1) - min(ay2, by2))
        }
        return area1 + area2 - area3
    }
}
