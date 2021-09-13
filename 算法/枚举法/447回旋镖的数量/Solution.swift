/*
 447. 回旋镖的数量
 https://leetcode-cn.com/problems/number-of-boomerangs/
 
 枚举所有的可能，并用哈希表存储中间量
 Key: 到点 i 的距离
 Value: 点的个数
 */
class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var map = [Int: Int]()  // [距离: 点的个数]()
        var ans = 0
        for i in points.indices {
            for j in points.indices where i != j {
                let dis = (points[i][0] - points[j][0]) * (points[i][0] - points[j][0]) + (points[i][1] - points[j][1]) * (points[i][1] - points[j][1])
                let count = map[dis, default: 0]
                ans += count * 2
                map[dis, default: 0] += 1
            }
            map = [Int: Int]()
        }
        return ans
    }
}
