/*
478. 在圆内随机生成点
https://leetcode.cn/problems/generate-random-point-in-a-circle/
*/
class Solution {

    private let (r, x, y): (Double, Double, Double)
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        (r, x, y) = (radius, x_center, y_center)
    }
    
    func randPoint() -> [Double] {
        while true {
            let dx = Double.random(in: -r...r), dy = Double.random(in: -r...r)
            if dx*dx+dy*dy <= r*r {
                return [x+dx, y+dy]
            }
        }
        return []
    }
}
