/*
 [扫描线算法+优先队列]218天际线问题
 https://leetcode-cn.com/problems/the-skyline-problem/
 
 参考三叶大佬的讲解：https://leetcode-cn.com/problems/the-skyline-problem/solution/gong-shui-san-xie-sao-miao-xian-suan-fa-0z6xc/
 */

class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {

        var ans = [[Int]]()
        
        // 预处理所有的点，为了方便排序，对于左端点，令高度为负；对于右端点令高度为正
        var ps = [[Int]]()
        for b in buildings {
            let l = b[0], r = b[1], h = b[2]
            ps.append([l, -h])
            ps.append([r, h])
        }
        
        ps.sort { a, b in
            if a[0] != b[0] {
                return a[0] - b[0] > 0
            }
            return a[1] - b[1] > 0
        }
        
        return ans
        
    }
}
