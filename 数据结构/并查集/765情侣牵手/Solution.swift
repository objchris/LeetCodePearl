/*
765. 情侣牵手
https://leetcode-cn.com/problems/couples-holding-hands/
*/
class Solution {

    func getf(_ f: inout [Int], _ x: Int) -> Int {
        if x == f[x] {
            return x
        }
        f[x] = getf(&f, f[x])
        return f[x]
    }

    func add(_ f: inout [Int], _ x: Int, _ y: Int) {
        let fx = getf(&f, x)
        let fy = getf(&f, y)
        f[fx] = fy
    }

    func minSwapsCouples(_ row: [Int]) -> Int {
        let n = row.count
        let tot = n / 2
        var f = [Int](repeating: 0, count: tot)
        for i in 0..<tot {
            f[i] = i
        }

        for i in stride(from: 0, to: n, by: 2) {
            let l = row[i] / 2, r = row[i + 1] / 2
            add(&f, l, r)
        }

        var map = [Int: Int]()
        for i in 0..<tot {
            let fx = getf(&f, i)
            map[fx, default: 0] += 1
        }

        var ans = 0
        for (_, v) in map {
            ans += (v - 1)
        }
        return ans
    }
    
}
