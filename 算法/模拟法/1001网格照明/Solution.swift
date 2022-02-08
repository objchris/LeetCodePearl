/*
1001. 网格照明
https://leetcode-cn.com/problems/grid-illumination/

通过行列号之和和之差记录正反斜线
*/
class Solution {
    let dirs = [(0, 0), (0, -1), (0, 1), (-1, 0), (-1, -1), (-1, 1), (1, 0), (1, -1), (1, 1)]

    func gridIllumination(_ n: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
        var row = [Int: Int](), col = [Int: Int]()
        var left = [Int: Int](), right = [Int: Int]()
        var set = Set<Int>()
        for l in lamps {
            var x = l[0], y = l[1]
            var a = x + y, b = x - y
            if set.contains(x * n + y) { continue }
            row[x, default: 0] += 1
            col[y, default: 0] += 1
            left[a, default: 0] += 1
            right[b, default: 0] += 1
            set.insert(x * n + y)
        }
        let m = queries.count
        var ans = [Int](repeating: 0, count: m)
        for i in 0..<m {
            let q = queries[i]
            let x = q[0], y = q[1]
            let a = x + y, b = x - y
            if row[x] != nil || col[y] != nil || left[a] != nil || right[b] != nil { ans[i] += 1 }

            for d in dirs {
                let nx = x + d.0, ny = y + d.1
                let na = nx + ny, nb = nx - ny
                if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
                if set.contains(nx * n + ny) {
                    set.remove(nx * n + ny)
                    if row[nx] == 1 { row.removeValue(forKey: nx) }
                    else { row[nx]! -= 1 }
                    if col[ny] == 1 { col.removeValue(forKey: ny) }
                    else { col[ny]! -= 1 }
                    if left[na] == 1 { left.removeValue(forKey: na) }
                    else { left[na]! -= 1 }
                    if right[nb] == 1 { right.removeValue(forKey: nb) }
                    else { right[nb]! -= 1 }
                }
            }
        }
        return ans
    }
}
