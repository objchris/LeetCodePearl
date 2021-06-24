/* [枚举法]149直线上最多的点数
 给你一个数组 points ，其中 points[i] = [xi, yi] 表示 X-Y 平面上的一个点。求最多有多少个点在同一条直线上。
 */
class Solution {
    
    struct MyPoint {
        let x: Int
        let y: Int
    }
    
    //时间复杂度：O(n^3)
    //空间复杂度：O(1)
    func maxPoints1(_ points: [[Int]]) -> Int {
        let myPoints = points.map { MyPoint(x: $0[0], y: $0[1]) }
        var ans = 1
        for i in myPoints.indices {
            for j in i+1..<myPoints.count {
                var count = 2
                for k in j+1..<myPoints.count {
                    if (myPoints[k].x - myPoints[i].x) * (myPoints[i].y - myPoints[j].y) == (myPoints[k].y - myPoints[i].y) * (myPoints[i].x - myPoints[j].x) {
                        // 求两直线的斜率
                        count += 1
                    }
                }
                ans = max(ans, count)
            }
        }
        return ans
    }
    
    /*
     时间复杂度：枚举所有直线的复杂度为 O(n^2)；令坐标值的最大差值为 m，gcd 复杂度为 O(logm)。整体复杂度为 O(n^2 * logm)
     空间复杂度：O(n)
     */
    func maxPoints(_ points: [[Int]]) -> Int {
        let myPoints = points.map { MyPoint(x: $0[0], y: $0[1]) }
        var ans = 1
        for i in myPoints.indices {
            var maxV = 0;
            var map = [String: Int]()
            for j in i+1..<myPoints.count {
                let s1 = myPoints[j].x - myPoints[i].x
                let s2 = myPoints[j].y - myPoints[i].y
                let k = gcd(s1, s2)
                let key = "\(s1/k)_\(s2/k)"
                if map[key] == nil {
                    map[key] = 0
                }
                map[key]! += 1
                maxV = max(maxV, map[key]!)
            }
            ans = max(ans, maxV + 1)
        }
        return ans
    }
    
    // 求最大公约数
    // 避免了浮点数除法,得到一个最大公约数，记录的就是他们对于公约数各自的倍数。比如说我们两个直线斜率都是 1.5 ，一个是 6/4 ，一个是 9/6 ,这个时候第一组数最大公约数为2，分子分母分别为3和2；第二组数最大公约数为3，分子分母分别为3和2。化为最间的时候原来相等的现在也一一对应的相等了。
    private func gcd(_ lhs: Int, _ rhs: Int) -> Int {
        return rhs == 0 ? lhs : gcd(rhs, lhs % rhs)
    }
    
}

let s = Solution()
s.maxPoints([[-1,-2]])

